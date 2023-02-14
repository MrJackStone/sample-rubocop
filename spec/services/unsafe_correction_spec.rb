require 'rails_helper'

RSpec.describe UnsafeCorrection do
  it 'returns helloworld' do
    expect(described_class.call).to eq('hello world')
  end
end
