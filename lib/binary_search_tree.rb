require 'pry'
require './lib/node'

class BinarySearchTree

  attr_accessor   :root_node

  def initialize
    @root_node = nil
  end

  def insert(score, title)
    if @root_node == nil
      node = Node.new(score, title)
      @root_node = node
      node.depth = 0
    else
      # @root_node.left_node = node
      insert_left_or_right(score,title)
    end
  end

  def insert_left_or_right(score, title)
    if score > @root.score
      insert_right(score, title)
    else score < @root.score
      insert_left(score, title)
  end

  def insert_right(score, title)
    
  end

  def insert_left(score, title)

  end

end

tree = BinarySearchTree.new
tree.insert(23, "movie")
puts tree.root_node







# spaceship operator
# a <=> b :=
#   if a < b then return -1
#   if a = b then return  0
#   if a > b then return  1
#   if a and b are not comparable then return nil
