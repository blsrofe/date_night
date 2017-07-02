require './lib/binary_search_tree'
require './lib/node'
require 'minitest/autorun'
require 'minitest/pride'

class Node < Minitest::Test

  def node_is_a_class
    node = Node.new(23, "Bill and Ted")
    assert_equal Node, node.class
  end

end
