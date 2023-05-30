# frozen_string_literal: true

require "dry-validation"

module CurrencyConverter
  class ConversionContract < Dry::Validation::Contract # :nodoc:
    params do
      required(:from_currency).filled(:string)
      required(:to_currency).filled(:string)
      required(:amount).filled(:float)
    end
  end
end
