require 'json'
require 'cgi'
require 'patron'

module VoteSmart
  module ParallelQueries
    def session
      @session ||= Typhoeus::Hydra.new(:max_concurrency => 20)
    end

    def request(api_method, params = {})
      raise "on_complete block required" unless block_given?

      url = construct_url api_method, params

      new_request = Typhoeus::Request.new(url)
      new_request.on_complete do |response|
        next if response.body.size < 2
        json = JSON.parse(response.body)

        if json['error'] and json['error']['errorMessage'] == 'Authorization failed'
          raise RequestFailed.new(json['error']['errorMessage'])
        end

        yield json
      end
      session.queue new_request
    end

    def run
      session.run
    end
  end

  module SidekiqQueries
    #
    # Per comments at the following links, Typhoeus::Hydra can not
    # be used in a multi-threaded environment such as Sidekiq. 
    # Doing so causes seg faults in the Ethon gem.
    #
    # https://github.com/typhoeus/ethon/issues/85
    # https://github.com/oscardelben/firebase-ruby/issues/15#issuecomment-46654551
    #
    def request(api_method, params = {})
      url = construct_url api_method, params

      request = Typhoeus::Request.new(url)
      response = request.run
      json = JSON.parse(response.body)

      if json['error'] and json['error']['errorMessage'] == 'Authorization failed'
        raise RequestFailed.new(json['error']['errorMessage'])
      end

      json
    end
  end

  class Common
    
    class << self
      attr_reader :attribute_map

      def parallelize!
        gem 'typhoeus'
        extend ParallelQueries
      end

      def sidekiqize!
        gem 'typhoeus'
        extend SidekiqQueries
      end

      def set_attribute_map map
        @attribute_map = map
      end

      def response_child response, *children
        for child in children
          response = response[child] if response
        end

        response || {}
      end

      # Constructs a VoteSmart API-friendly URL
      def construct_url(api_method, params = {})
        "#{API_URL}#{api_method}?key=#{VoteSmart.api_key}&o=#{API_FORMAT}#{hash2get(params)}"
      end

      # Converts a hash to a GET string
      def hash2get(h)
        h.map do |(key, value)|
          "&#{key.to_s}=#{CGI::escape(value.to_s)}" if value
        end.compact.join
      end

      def request(api_method, params = {})
        url = construct_url api_method, params

        json = get_json_data(url)

        if json['error'] and json['error']['errorMessage'] == 'Authorization failed'
          raise RequestFailed.new(json['error']['errorMessage'])
        end

        json
      end

      def session
        @session ||= Patron::Session.new.tap do |session|
          session.timeout = 15
        end
      end

      # Use the Net::HTTP and JSON libraries to make the API call
      #
      # Usage:
      #   District.get_json_data("http://someurl.com")    # returns Hash of data or nil
      def get_json_data(url)
        response = session.get(url)
        if response.status != 200
          raise RequestFailed.new("Request was not OK: #{response.class}: #{url} #{response.body}")
        end
        JSON.parse(response.body)
      rescue
        @json_retries ||= 0
        if @json_retries < 5
          puts "Retrying #{url}"
          sleep(2 ** @json_retries)
          @json_retries += 1
          retry
        end
        raise
      ensure
        @json_retries = 0
      end
    end
    
    def initialize attributes = {}
      update_attributes attributes
    end
    
    def update_attributes attributes
      map = self.class.attribute_map
      raise "map not set over-ride needed" unless map
      
      attributes.each do |key, value|
        if key.kind_of?(Symbol)
          send("#{key}=", value)
        else
          map_to = map[key]
          send("#{map_to}=", value) if map_to
        end
      end
    end

  end
  
end
