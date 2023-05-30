# frozen_string_literal: true

RSpec.describe CurrencyConverter do
  it "has a version number" do
    expect(CurrencyConverter::VERSION).not_to be nil
  end

  describe ".convert" do
    let(:from_currency) { "USD" }
    let(:to_currency) { "EUR" }
    let(:amount) { 100 }
    let(:rates) { { "USD" => 1, "EUR" => 0.9 } }

    subject { described_class.convert(from_currency, amount, to_currency) }

    before do
      allow(described_class).to receive(:rates).and_return(rates)
    end

    context "when converting from USD to EUR" do
      it { is_expected.to eq(90) }
    end

    context "when converting from EUR to USD" do
      let(:from_currency) { "EUR" }
      let(:to_currency) { "USD" }

      it { is_expected.to eq(111.11) }
    end
  end
end
