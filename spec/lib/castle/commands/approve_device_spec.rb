# frozen_string_literal: true

RSpec.describe Castle::Commands::ApproveDevice do
  subject(:instance) { described_class }

  let(:context) { {} }
  let(:device_token) { '1234' }

  describe '.build' do
    subject(:command) { instance.build(device_token: device_token) }

    context 'without device_token' do
      let(:device_token) { '' }

      it { expect { command }.to raise_error(Castle::InvalidParametersError) }
    end

    context 'with device_token' do
      it { expect(command.method).to be(:put) }
      it { expect(command.path).to eql("devices/#{device_token}/approve") }
      it { expect(command.data).to be_nil }
    end
  end
end
