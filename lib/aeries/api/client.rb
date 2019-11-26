require 'aeries/api/client/schools'
require 'aeries/api/client/students'

module Aeries
  module Api
    class Client
      include HTTParty
      include Aeries::Api::Client::Schools
      include Aeries::Api::Client::Students

      base_uri ENV['AERIES_BASE_URI']
      format :json

      def initialize(aeries_cert = nil)
        aeries_cert ||= ENV['AERIES_CERT']
        self.class.default_options.merge!(headers: { 'AERIES-CERT': aeries_cert })
      end
    end
  end
end
