# frozen_string_literal: true

RSpec.describe Katinguele, type: :module do
  it { expect(described_class::VERSION).not_to be_nil }

  describe '.configure' do
    subject do
      described_class.configure do |config|
        config.add_service :linqueta,
                           protocol: 'https',
                           raise_error: true,
                           url: 'www.linqueta.com'
      end
    end

    before { subject }

    it { expect(described_class.configuration.services.length).to eq(1) }
    it do
      expect(described_class.configuration.services[:linqueta]).to have_attributes(
        protocol: 'https',
        raise_error: true,
        url: 'www.linqueta.com',
        urn: 'https://www.linqueta.com'
      )
    end
  end

  describe '.configuration' do
    subject { described_class.configuration }

    it { is_expected.to be_a(described_class::Configuration) }
  end
end
