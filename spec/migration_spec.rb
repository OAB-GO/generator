require 'spec_helper'

describe Migration do

  let(:args) {
    ['User', 'name:string', 'age:int']
  }

  context 'Creating a new Migration object' do
    it '.create(columns)' do
      subject = Migration.create(args)
      expect(subject.name).to eq('User')
      expect(subject.columns.size).to eq(2)
    end
  end
end
