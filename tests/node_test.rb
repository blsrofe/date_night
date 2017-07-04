require './lib/binary_search_tree'
require './lib/node'
require 'minitest/autorun'
require 'minitest/pride'

class NodeTest < Minitest::Test

  def test_node_is_a_class
    node = Node.new(23, "Bill and Ted")
    assert_instance_of Node, node
  end
  
end
