require 'spec_helper'
require 'fileutils'

describe Migration do

  subject {
    Migration.create(['User', 'name:string', 'age:int'])
  }

  describe '.create(columns)' do
    it 'should create a new object from an array' do
      expect(subject.name).to eq('user')
      expect(subject.columns.size).to eq(2)
    end
  end

  describe '#next_id' do
    before {
      FileUtils.rm Dir["#{subject.dir}/*.yml"]
    }

    context 'when migration directory is empty' do
      it 'should return 001_create_table_user' do
        expect(subject.next_id).to eq('001_create_table_user')
      end
    end
  end

  describe '#generate' do
    it 'should generate a new file from template' do
      subject.generate
    end
  end
end
