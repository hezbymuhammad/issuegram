# frozen_string_literal: true

require 'faraday'

class Issuegram
  class Config
    AVAILABLE_KEYS = %i[api_url connection per_page state token].freeze

    def initialize(options = nil)
      @api_url = 'https://api.github.com'
      @connection = Faraday.new
      @per_page = 100
      @state = :all

      apply(options) if options
    end

    AVAILABLE_KEYS.each do |key|
      define_method("#{key}=") {|value| instance_variable_set("@#{key}", value) }
      define_method(key.to_s) { instance_variable_get("@#{key}") }
    end

    def load_config(filename)
      yml_file = filename.to_s
      config_data = YAML.safe_load(ERB.new(File.read(yml_file)).result)

      apply(config_data)
    end

    alias load_yml load_config

    def inspect
      "<Issuegram::Config " +
	AVAILABLE_KEYS.map {|key| "@#{key}=#{instance_variable_get("@#{key}")} " }.join.strip +
	">"
    end

    private

    def apply(hash)
      hash.each do |key, value|
	unless AVAILABLE_KEYS.include?(key.to_s.to_sym)
	  raise ArgumentError.new(
	    "Unknown option #{key.inspect}, available keys: #{AVAILABLE_KEYS.map(&:inspect).join(', ')}"
	  )
	end

	instance_variable_set("@#{key}", value)
      end
    end
  end
end
