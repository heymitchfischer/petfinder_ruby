require 'unirest'

module Petfinder
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :client_id, :client_secret, :access_token, :token_expires_at
  end

  class Client
    def self.get_token
      response = Unirest.post("https://api.petfinder.com/v2/oauth2/token", 
                              parameters: {
                                "grant_type" => "client_credentials", 
                                "client_id" => "#{Petfinder.configuration.client_id}", 
                                "client_secret" => "#{Petfinder.configuration.client_secret}"
                              }
                            )
      Petfinder.configuration.access_token = response.body["access_token"]
      Petfinder.configuration.token_expires_at = Time.now + 3560
    end

    def self.get_adoptable_animals_by_organization(org_id)
      check_token
      response = Unirest.get("https://api.petfinder.com/v2/animals",
                            headers: {"Authorization" => "Bearer #{Petfinder.configuration.access_token}"},
                            parameters: { "organization" => org_id,
                                          "status" => "adoptable"
                                        }
                            )
      response.body
    end

    def self.get_organization(org_id)
      check_token
      response = Unirest.get("https://api.petfinder.com/v2/organizations/#{org_id}",
        headers: {"Authorization" => "Bearer #{Petfinder.configuration.access_token}"})
      response.body
    end

    def self.check_token
      if Petfinder.configuration.access_token == nil || Petfinder.configuration.token_expires_at < Time.now
        get_token
      end
    end
  end
end