# frozen_string_literal: true

describe Parallelios::Configuration do
  describe 'load config from file' do
    let(:options) { {} }
    let(:config_hash) { { build: { workspace: 'Projects/Project.workspace' } } }
    let(:config_file) { YAML.dump(config_hash) }
    before { allow_any_instance_of(described_class).to receive(:config_file).and_return config_file }

    it 'must load config from file' do
      expect(described_class.new(options).build.workspace).to eq config_hash[:build][:workspace]
    end
  end
end
