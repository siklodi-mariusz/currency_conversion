# frozen_string_literal: true

require 'faraday'
require_relative "currency_converter/version"
require_relative "currency_converter/rates"
require_relative "currency_converter/conversion_contract"

module CurrencyConverter # :nodoc:
  class Error < StandardError; end
  class ConversionRateNotFound < Error; end

  class << self
    def convert(from_currency, amount, to_currency)
      contract = conversion_contract.call(from_currency: from_currency, amount: amount, to_currency: to_currency)

      raise Error, contract.errors.to_h if contract.failure?

      (amount / rates[from_currency] * rates[to_currency]).round(2)
    end

    def refresh_rates!
      @rates = nil
      rates
    end

    def rates
      @rates ||= Rates.fetch
    end

    private

    def conversion_contract
      ConversionContract.new
    end
  end
end
