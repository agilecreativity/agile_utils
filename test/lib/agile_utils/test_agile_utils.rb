require_relative '../../test_helper'

# require additional libraries here

describe AgileUtils do

  def setup
    # TODO: Your setup
    puts 'setup'
  end

  def teardown
    # TODO: Your teardown
    puts 'teardown'
  end

  before do
    # TODO: your before here
    puts 'before'
  end

  after do
    # TODO: your after here
    puts 'after'
  end

  context '#simplest_test' do
    it 'must pass the simple test' do
      'string'.wont_be_nil
    end
  end

end
