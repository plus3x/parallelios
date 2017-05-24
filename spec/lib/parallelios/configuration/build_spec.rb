# frozen_string_literal: true

describe Parallelios::Configuration::Build do
  describe '#to_s' do
    {
      { scheme: 'Project', configuration: 'Debug' } =>
        '-scheme "Project" -configuration "Debug"',
      { workspace: 'Projects/Project.workspace', destination: { platform: 'iOS Simulator', name: 'iPhone 7' } } =>
        '-workspace "Projects/Project.workspace" -destination "platform=iOS Simulator,name=iPhone 7"'
    }.each do |options, expected_string|
      it { expect(described_class.new(options).to_s).to eq expected_string }
    end
  end
end
