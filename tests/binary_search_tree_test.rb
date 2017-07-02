require './lib/binary_search_tree'
require './lib/node'
require 'minitest/autorun'
require 'minitest/pride'

class BinarySearchTreeTest < Minitest::Test

  def test_binary_search_tree_is_a_class
    tree = BinarySearchTree.new
    assert_instance_of BinarySearchTree, tree
  end

  # def insert_method_returns_depth
  #   skip
  #   assert_equal 0,tree.insert(90, "movie_name")
  # end
  #
  # def verify_presence_of_score_in_tree
  #   skip
  #   assert tree.include?(16)
  # end
  #
  # def reject_presence_of_score_in_tree
  #   skip
  #   refute tree.include?(72)
  # end

end

# file will run with no errors but it does not show any assertions
