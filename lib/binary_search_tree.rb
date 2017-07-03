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
      evaluate_direction(score, title, node)
    end
  end

  def evaluate_direction(score, title, node)
    case node.score <=> score
    when -1 then go_right(score, title, node)
    when 1 then go_left(score, title, node)
    when 0 then return "This is a duplicate score."
    end
  end

  def go_right(score, title, node)
    if node.right == nil
      node.right = Node.new(score, title)
    else
      node = node.right
      node.insert(score, title, node)
    end
  end

  def go_left(score, title, node)
    if node.left == nil
      node.left = Node.new(score, title)
    else
      node = node.left
      node.insert(score, title, node)
    end
  end

end




# tree = BinarySearchTree.new
# tree.insert(61, "Bill and Ted's Excellent Adventure")
#tree.insert(16, "Johnny English")
#puts tree.root_node.right.depth
#puts tree.root_node.left.depth

#depth counter is not incrementing
#test file is returning go left and go right instead of integer for depth








# spaceship operator
# a <=> b :=
#   if a < b then return -1
#   if a = b then return  0
#   if a > b then return  1
#   if a and b are not comparable then return nil
