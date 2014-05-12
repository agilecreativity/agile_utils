require_relative "../../test_helper"
describe AgileUtils::Helper do
  context "#shell" do
    it "returns result for valid command" do
      result = AgileUtils::Helper.shell(%w[ls])
      result.wont_be_nil
    end
    it "raises error on invalid command" do
      assert_raises(RuntimeError) { AgileUtils::Helper.shell(%w[bad-command]) }
    end
  end
end
