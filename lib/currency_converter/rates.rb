# frozen_string_literal: true

module CurrencyConverter
  class Rates # :nodoc:
    BASE_CURRENCY = "USD"
    EXCHANGE_API = "https://open.er-api.com/v6/latest/"

    attr_reader :base_currency, :rates, :rates_source

    def initialize(base_currency)
      @base_currency = base_currency
      @rates = {}
      @rates_source = "#{EXCHANGE_API}/#{base_currency}"
    end

    def [](currency)
      conversion_rate = rates[currency]
      raise ConversionRateNotFound, "Conversion rate for '#{currency}' not found" unless conversion_rate

      conversion_rate
    end

    def fetch
      response = Faraday.get(rates_source)

      raise Error, "Error fetching rates from #{rates_source}" unless response.success?

      @rates = JSON.parse(response.body)["rates"]
      self
    end

    class << self
      def fetch(base_currency = BASE_CURRENCY)
        new(base_currency).fetch
      end
    end
  end
end
