require './lib/binary_search_tree'
require './lib/node'
require 'minitest/autorun'
require 'minitest/pride'

class BinarySearchTreeTest < Minitest::Test

  def test_binary_search_tree_is_a_class
    tree = BinarySearchTree.new
    assert_instance_of BinarySearchTree, tree
  end

  def test_root_is_nil_when_instantiated
    tree = BinarySearchTree.new
    assert_nil tree.root_node
  end

  def test_root_has_score_after_one_insertion
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    assert_equal 61, tree.root_node.score
  end

  def test_insert_method_returns_depth
    tree = BinarySearchTree.new
    assert_equal 0, tree.insert(61, "Bill & Ted's Excellent Adventure")
  end

  def test_insert_method_returns_depth_again
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    assert_equal 1, tree.insert(92, "Sharknado 3")
  end

  def verify_presence_of_score_in_tree
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert tree.include?(16)
  end

  def reject_presence_of_score_in_tree
    skip
    refute tree.include?(72)
  end

end

# file will run with no errors but it does not show any assertions
