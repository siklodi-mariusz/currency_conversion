# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CurrencyConverter::Rates do
  let(:instance) { described_class.new("USD") }

  describe "#fetch" do
    subject { instance.fetch }

    it "returns rates Hash" do
      VCR.use_cassette("USD_rates") do
        expect(subject).to be_a(Hash)
        expect(subject).to have_key("USD")
      end
    end
  end
end
