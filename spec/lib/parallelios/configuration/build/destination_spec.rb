# frozen_string_literal: true

describe Parallelios::Configuration::Build::Destination do
  describe '#to_s' do
    {
      { platform: 'iOS', id: '09143EAF-C4D6-40FD-A554-E707023B6040' } =>
        'platform=iOS,id=09143EAF-C4D6-40FD-A554-E707023B6040',
      { platform: 'iOS Simulator', name: 'iPhone 7' } =>
        'platform=iOS Simulator,name=iPhone 7'
    }.each do |options, expected_string|
      it { expect(described_class.new(options).to_s).to eq expected_string }
    end
  end
end
