module VoteSmart
  
  class Address < Common
    
    attr_accessor :type, :street, :city, :state, :zip
    
    set_attribute_map "type" => :type, "street" => :street, "city" => :city, "state" => :state, "zip" => :zip
    
    
    # Returns a campaign office's contact information
    def self.get_campaign can_id, &block
      request("Address.getCampaign", {"candidateId" => can_id}, &block)
    end
    
    # Returns a campaign office's contact information
    def self.get_campaign_web_address can_id, &block
      request("Address.getCampaignWebAddress", {"candidateId" => can_id}, &block)
    end
    
    # Returns a campaign office's contact information
    def self.get_campaign_by_election election_id, &block
      request("Address.getCampaignByElection", {"electionId" => election_id}, &block)
    end
    
    # Returns an incumbent office's contact information
    def self.get_office candidate_id, &block
      request("Address.getOffice", {"candidateId" => candidate_id}, &block)
    end
    
    # Returns an incumbent office's contact information
    def self.get_office_web_address can_id, &block
      request("Address.getOfficeWebAddress", {"candidateId" => can_id}, &block)
    end
    
    # Returns a (sometimes)list of offices that fit office_id and state_id
    def self.get_office_by_office_state office_id, state_id = 'NA', &block
      request("Address.getOfficeByOfficeState", {"officeId" => office_id, "stateId" => state_id}, &block)
    end
    
  end
  
end
