# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CurrencyConverter::Rates do
  let(:instance) { described_class.new("USD") }

  describe "#fetch" do
    subject { instance.fetch }

    it "fetches rates" do
      VCR.use_cassette("USD_rates") do
        expect(instance.rates).to be_empty
        expect(subject).to be_a(described_class)
        expect(subject.rates).to have_key("USD")
      end
    end
  end

  describe "#[]" do
    context "when the conversion rate is found" do
      before do
        VCR.use_cassette("USD_rates") do
          instance.fetch
        end
      end

      it "returns the conversion rate for the given currency" do
        expect(instance["EUR"]).to eq(0.933645)
      end
    end

    context "when the conversion rate is not found" do
      it "raises an error" do
        expect { instance["XYZ"] }.to raise_error(CurrencyConverter::ConversionRateNotFound)
      end
    end
  end
end
