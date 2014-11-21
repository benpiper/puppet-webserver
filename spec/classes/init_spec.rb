require 'spec_helper'
describe 'webserver' do

  context 'with defaults for all parameters' do
    it { should contain_class('webserver') }
  end
end
