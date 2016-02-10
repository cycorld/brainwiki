require 'test_helper'

class SynapseTest < ActiveSupport::TestCase
  def setup
    @synapse = Synapse.new(origin_id: 1, next_id: 2, user_id: 1)
  end

  test "should be valid" do
    assert @synapse.valid?
  end

  test "should require a origin_id" do
    @synapse.origin_id = nil
    assert_not @synapse.valid?
  end

  test "should require a next_id" do
    @synapse.next_id = nil
    assert_not @synapse.valid?
  end
end
