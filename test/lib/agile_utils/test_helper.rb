require_relative '../../test_helper'
describe AgileUtils::Helper do
  context '#simplest_test' do
    it 'must pass the simple test' do
      'string'.wont_be_nil
    end
  end
end
