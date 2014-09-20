# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "votesmart"
  s.version = "0.4.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dan Cunning", "Ben Woosley", "Mark J Steckel"]
  s.date = "2014-09-19"
  s.description = "A wrapper for the Project Vote Smart API"
  s.email = "ben.woosley@gmail.com"
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    "Gemfile",
    "History.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION.yml",
    "lib/vote_smart.rb",
    "lib/vote_smart/address.rb",
    "lib/vote_smart/candidate.rb",
    "lib/vote_smart/candidate_bio.rb",
    "lib/vote_smart/candidate_office.rb",
    "lib/vote_smart/committee.rb",
    "lib/vote_smart/common.rb",
    "lib/vote_smart/district.rb",
    "lib/vote_smart/election.rb",
    "lib/vote_smart/leadership.rb",
    "lib/vote_smart/local.rb",
    "lib/vote_smart/measure.rb",
    "lib/vote_smart/notes.rb",
    "lib/vote_smart/npat.rb",
    "lib/vote_smart/office.rb",
    "lib/vote_smart/official.rb",
    "lib/vote_smart/phone.rb",
    "lib/vote_smart/rating.rb",
    "lib/vote_smart/state.rb",
    "lib/vote_smart/vote.rb",
    "lib/votesmart.rb",
    "script/autospec",
    "script/console",
    "script/destroy",
    "script/generate",
    "script/is_gem_built",
    "spec/responses/Address.get_office.106446.js",
    "spec/responses/Address.get_office.1721.js",
    "spec/responses/District.get_by_office_state.7.GA.js",
    "spec/responses/District.get_by_office_state.8.GA.js",
    "spec/responses/District.get_by_office_state.9.GA.js",
    "spec/responses/Office.get_offices_by_type.C.js",
    "spec/responses/Office.get_offices_by_type.L.js",
    "spec/responses/Office.get_offices_by_type.P.js",
    "spec/responses/Office.get_offices_by_type.S.js",
    "spec/responses/Office.get_types.js",
    "spec/responses/Official.get_by_district.20451.js",
    "spec/responses/Official.get_by_district.20689.js",
    "spec/responses/Official.get_by_district.21397.js",
    "spec/responses/Official.get_by_district.21946.js",
    "spec/responses/Official.get_by_office_state.12.CO.js",
    "spec/responses/Official.get_by_office_state.12.GA.js",
    "spec/responses/Official.get_by_office_state.13.GA.js",
    "spec/responses/Official.get_by_office_state.33.GA.js",
    "spec/responses/Official.get_by_office_state.42.GA.js",
    "spec/responses/Official.get_by_office_state.44.GA.js",
    "spec/responses/Official.get_by_office_state.45.GA.js",
    "spec/responses/Official.get_by_office_state.53.GA.js",
    "spec/responses/Rating.get_sig.1863.js",
    "spec/responses/State.get_state.GA.js",
    "spec/responses/State.get_state_ids.js",
    "spec/responses/authorization_failed.js",
    "spec/spec_helper.rb",
    "spec/vote_smart/district_spec.rb",
    "spec/vote_smart/office/type_spec.rb",
    "spec/vote_smart/office_spec.rb",
    "spec/vote_smart/official_spec.rb",
    "spec/vote_smart/rating_spec.rb",
    "spec/vote_smart/state_spec.rb",
    "tasks/spec_json.rake",
    "votesmart.gemspec"
  ]
  s.homepage = "http://github.com/Empact/votesmart"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.11"
  s.summary = "A wrapper for the Project Vote Smart API"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<patron>, [">= 0.4.6"])
      s.add_development_dependency(%q<rspec>, ["< 2"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.8.3"])
      s.add_development_dependency(%q<ym4r>, [">= 0"])
      s.add_development_dependency(%q<mcll4r>, [">= 0"])
    else
      s.add_dependency(%q<patron>, [">= 0.4.6"])
      s.add_dependency(%q<rspec>, ["< 2"])
      s.add_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.8.3"])
      s.add_dependency(%q<ym4r>, [">= 0"])
      s.add_dependency(%q<mcll4r>, [">= 0"])
    end
  else
    s.add_dependency(%q<patron>, [">= 0.4.6"])
    s.add_dependency(%q<rspec>, ["< 2"])
    s.add_dependency(%q<rdoc>, ["~> 3.12"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.8.3"])
    s.add_dependency(%q<ym4r>, [">= 0"])
    s.add_dependency(%q<mcll4r>, [">= 0"])
  end
end

