require 'spec_helper'

describe Setup do

  let(:defaults) {
    attributes = [:dir, :username, :author]
    klass = Object.const_set "Options", Struct.new(*attributes)
    Options.new "~/desenvolvimento/projetos/workspace/", "oab_server2", "Wender Freese"
  }

  subject {
    Setup.new defaults
  }

  describe '#initialize(parameters)' do
    it 'should initialize a Setup object from Hash of parameters' do
      expect(subject.dir).to eq(defaults.dir)
    end
  end

  describe '#save' do
    it 'should save the setup' do
      subject.save
      expect(Setup.exists?).to eq(true)
    end

    it 'should preserve not informed parameters' do
      expect(Setup.load.dir).to eq(defaults.dir)
      subject.dir = nil
      subject.save
    #   expect(Setup.load.dir).to eq(defaults.dir)
    end
  end

  describe '.load' do
    it 'should load an existent Setup' do
      expect(Setup.load.dir).to eq(defaults.dir)
    end
  end

  # context 'When user puts just one of three parameters' do
  #   context 'Should be change just parameter informed' do
  #     it '#save' do

  #     end
  #   end
  # end
end
