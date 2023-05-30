# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CurrencyConverter::ConversionContract do
  let(:instance) { described_class.new }

  describe "#call" do
    let(:from_currency) { "USD" }
    let(:to_currency) { "EUR" }
    let(:amount) { 100 }
    let(:params) { { from_currency: from_currency, amount: amount, to_currency: to_currency } }
    subject { instance.call(params) }

    context "when valid" do
      it { is_expected.to be_success }
    end

    context "when from_currency is invalid" do
      let(:from_currency) { nil }

      it { is_expected.to be_failure }
    end

    context "when to_currency is invalid" do
      let(:to_currency) { nil }

      it { is_expected.to be_failure }
    end

    context "when amount is invalid" do
      let(:amount) { nil }

      it { is_expected.to be_failure }
    end
  end
end
