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
    else
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


end

tree = BinarySearchTree.new
tree.insert(23, "movie")
tree.insert(43, "movie_name")
puts tree.root_node.right.score
puts tree.root_node.score








# spaceship operator
# a <=> b :=
#   if a < b then return -1
#   if a = b then return  0
#   if a > b then return  1
#   if a and b are not comparable then return nil
