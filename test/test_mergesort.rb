require "./lib/mergesort.rb"
require "test/unit"

class TestNode < Test::Unit::TestCase

  def setup
    @m = Merge.new
  end

  def test_returns_same_list_if_length_less_than_or_equal_1
    a = [1]
    assert_equal a, @m.sort(a)
  end

  def test_sorts_a_list
    assert_equal [1,2,3,4,5,6,7], @m.sort([7,6,4,5,3,2,1])
  end
end
