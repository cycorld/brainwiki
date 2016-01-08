require 'test_helper'

class NueronTest < ActiveSupport::TestCase
  test "should set prev and unset prev nueron" do
    p = nuerons(:one)
    n = nuerons(:two)
    assert_not n.prev? p
    n.set_prev p
    assert n.prev? p
    n.unset_prev p
    assert_not n.prev? p
  end

  test "should set next and unset next nueron" do
    p = nuerons(:one)
    n = nuerons(:two)
    assert_not p.next? n
    p.set_next n
    assert p.next? n
    p.unset_next n
    assert_not p.next? n
  end
end
