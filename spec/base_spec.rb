require 'spec_helper'

describe Generator::Base do

  let(:defaults) {
    {"setup"=>{"dir"=>"~/desenvolvimento/projetos/workspace/", "username"=>"oab_server2", "author"=>"Wender Freese"}}
  }

  it '#defaults' do
    # expect(subject.defaults).to eq(defaults)
  end
end
