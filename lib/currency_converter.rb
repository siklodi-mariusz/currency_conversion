# frozen_string_literal: true

require 'faraday'
require_relative "currency_converter/version"
require_relative "currency_converter/rates"

module CurrencyConverter # :nodoc:
  class Error < StandardError; end

  class << self
    def convert(from_currency, amount, to_currency)
      # TODO: Implement parameter validation

      (amount / rates[from_currency] * rates[to_currency]).round(2)
    end

    def rates
      @rates ||= Rates.fetch
    end
  end
end
