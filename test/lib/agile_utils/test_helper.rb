require_relative '../../test_helper'
describe AgileUtils::Helper do
  context '#shell' do
    it 'returns result for valid command' do
      result = AgileUtils::Helper.shell(%w(ls))
      result.wont_be_nil
    end

    it 'raises error on invalid command' do
      assert_raises(RuntimeError) { AgileUtils::Helper.shell(%w(bad-command)) }
    end
  end

  context '#which' do
    it 'works with valid executable' do
      # TODO: mock or stub the call
      AgileUtils::Helper.which('ruby').wont_be_nil
    end
    it 'works with invalid executable' do
      AgileUtils::Helper.which('bad-or-invalid-executable!').must_be_nil
    end
    it 'works with the binary name only' do
      # TODO: mock or stub the call
      AgileUtils::Helper.which('/bin/bash').must_be_nil
    end
  end
end
