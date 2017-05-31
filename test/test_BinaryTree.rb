require "./lib/BinaryTree.rb"
require "test/unit"

class TestNode < Test::Unit::TestCase

  def setup
    @a = [3,2,1,4,5,6]
    @n = Node.new
  end

  def test_left_is_nil_when_initialized
    n = Node.new.insert 3
    assert_equal nil, n.left
  end

  def test_right_is_nil_when_initialized
    n = Node.new
    n.insert 3
    assert_equal nil, n.right
  end

  def test_insert_left_when_value_less_than_node
    n = Node.new.insert(10).insert(5)

    assert_equal 5, n.left.value
  end

  def test_can_insert_an_array
    a = [5, 2, 3, 4, 1]

    @n.insert_a(a)

    assert_equal a.sort, @n.to_a.sort
  end

  def test_value_can_be_searched
    @n.insert_a(@a)

    rand = @a.sample

    assert_equal true, @n.search(rand)
  end

  def test_returns_false_when_value_is_not_found
    @n.insert_a(@a)

    assert_equal false, @n.search(50)

  end

  def test_can_return_an_array
    @n.insert_a(@a)

    assert @n.to_a.instance_of? Array

  end

  def test_should_return_a_sorted_array
    @n.insert_a(@a)

    assert_equal @a.sort, @n.to_a.sort

  end

  def test_min_depth_is_0_if_no_children
    @n.insert(1)

    assert_equal 0, @n.min_depth
  end

  def test_max_depth_is_0_if_no_children
    @n.insert(1)

    assert_equal 0, @n.max_depth
  end

  def test_max_depth_1
    @n.insert_a([5,2,8])

    assert_equal 1, @n.max_depth
  end

  def test_max_depth_3
    @n.insert_a([5,2,8,10,11])

    assert_equal 3, @n.max_depth
  end

  def test_min_depth_1_when_max_depth_3
    @n.insert_a([5,2,8,10,11])

    assert_equal 1, @n.min_depth
  end

  def test_isbalanced_returns_false_if_not_balanced
    @n.insert_a([3,2,1,4,5,6])

    assert_equal false, @n.isbalanced?
  end

  def test_isbalanced_returns_true_if_balanced

    @n.insert_a([5,3,2,4,8,7,9,10])

    assert_equal true, @n.isbalanced?
  end

  def test_balance_should_balance_the_tree
    a = [1,2,3,4,5,6,7,8,9]
    @n.insert_a(a)

    assert_equal true, @n.balance.isbalanced?
    assert_equal a.sort, @n.to_a.sort

    puts @n.to_a
  end

  def test_array_mid_len_1
    a = [1]
    assert_equal 1, a[a.length / 2]

    a = [1,2]
    assert_equal 2, a[a.length / 2]
  end


end
