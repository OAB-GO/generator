require 'spec_helper'

describe Template do
  describe '.get(template)' do
    it 'should raise an error if template has not found' do
      expect { Template.get :inexistent }.to raise_error
    end

    it 'should return a specific template' do
      expect(Template.get :migration).to eq('./templates/migration.rb.erb')
    end
  end
end
