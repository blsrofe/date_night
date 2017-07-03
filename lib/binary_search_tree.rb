require 'pry'
require './lib/node'

class BinarySearchTree

  attr_accessor   :root_node

  def initialize
    @root_node = nil
  end

  def insert(score, title, node = @root_node)
    if @root_node == nil
       @root_node =  Node.new(score, title)
       @root_node.depth
    else
      root_node.insert(score, title)
    end
  end

  def include?(include_score)
    if @root_node.score == include_score
    else
      root_node.include?(include_score, @root_node)
    end
  end


end




# tree = BinarySearchTree.new
# tree.insert(61, "Bill and Ted's Excellent Adventure")
#tree.insert(16, "Johnny English")
#puts tree.root_node.right.depth
#puts tree.root_node.left.depth









# spaceship operator
# a <=> b :=
#   if a < b then return -1
#   if a = b then return  0
#   if a > b then return  1
#   if a and b are not comparable then return nil
