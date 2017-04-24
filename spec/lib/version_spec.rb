# frozen_string_literal: true

describe Parallelios do
  it { expect(described_class.gem_version).to be_a Gem::Version }
  it { expect(described_class::VERSION::MAJOR).not_to be_nil }
  it { expect(described_class::VERSION::MINOR).not_to be_nil }
  it { expect(described_class::VERSION::TINY).not_to be_nil }
  it { expect(described_class::VERSION::PRE).not_to be_nil }
  it { expect(described_class::VERSION::STRING).not_to be_nil }
end
