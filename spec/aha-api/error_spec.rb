require 'spec_helper'

describe AhaApi::Error do
  subject(:error) { described_class.new(response) }

  context 'given a non-JSON response body' do
    let(:response) do
      { method: 'GET', url: '/', body: 'Not JSON', status: 500 }
    end

    it 'includes the raw response body in the message' do
      expect(error.message).to eq('GET /: 500: Not JSON')
    end
  end
end
