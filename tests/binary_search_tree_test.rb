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

  def test_verify_presence_of_score_in_tree
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert tree.include?(50)
  end

  def test_reject_presence_of_score_in_tree
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    refute tree.include?(72)
  end

  def test_hash_is_created_on_instantiation
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    assert_equal ({"Bill & Ted's Excellent Adventure"=>61}), tree.root_node.data
  end

  def test_which_movie_has_highest_score
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert_equal ({"Sharknado 3"=>92}), tree.max
  end

  def test_which_movie_has_lowest_score
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert_equal ({"Johnny English"=>16}), tree.min
  end

  def test_knows_the_depth_of_each_score
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert_equal 2, tree.depth_of(50)
  end

  def test_returns_array_with_min_movie_data
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert_equal ([{"Johnny English"=>16}]), tree.sort
  end

  def test_returns_array_with_sorted_data
    skip
    tree = BinarySearchTree.new
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert_equal ([{"Johnny English"=>16}, {"Hannibal Buress: Animal Furnace"=>50},
                  {"Bill & Ted's Excellent Adventure"=>61},{"Sharknado 3"=>92}]), tree.sort
  end

end
