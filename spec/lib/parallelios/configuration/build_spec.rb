# frozen_string_literal: true

describe Parallelios::Configuration::Build do
  describe '#to_s' do
    {
      { scheme: 'Project', configuration: 'Debug', only_testing: ['Test Project/GroupTests/testAddToGroup'] } =>
        '-scheme "Project" -configuration "Debug" -only-testing:Test\ Project/GroupTests/testAddToGroup',
      { scheme: 'Project', only_testing: ['Test Project/GroupTests/testAddToGroup',
                                          'Test Project/GroupTests/testRemoveFromGroup'] } =>
        '-scheme "Project" -only-testing:{Test\ Project/GroupTests/testAddToGroup' \
                                        ',Test\ Project/GroupTests/testRemoveFromGroup}',
      { workspace: 'Projects/Project.workspace', destination: { platform: 'iOS Simulator', name: 'iPhone 7' } } =>
        '-workspace "Projects/Project.workspace" -destination "platform=iOS Simulator,name=iPhone 7"'
    }.each do |options, expected_string|
      it { expect(described_class.new(options).to_s).to eq expected_string }
    end
  end
end
