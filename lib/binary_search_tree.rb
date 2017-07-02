require 'pry'
require './lib/node'

class BinarySearchTree

  attr_accessor   :root_node_score,
                  :root_node_title,
                  :root_node_depth,
                  :left_node,
                  :right_node

  def initialize(root_node_score = nil, root_node_title = "", root_node_depth = 0, left_node = nil, right_node = nil)

    @root_node_score = root_node_score
    @root_node_title = root_node_title
    @root_node_depth = root_node_depth
    @left_node = left_node
    @right_node = right_node

  end

  def insert(score, title)
    if self.root_node_score == nil
      @root_node_score = score
      @root_node_title = title
    else
      evaluate_direction(score, title)
    end
  end

  def evaluate_direction(score, title)
    current_node = Node.new(score, title)
    if current_node.score < self.root_node_score
      self.left_node = current_node
    else
      self.right_node = current_node
    end
  end



end

tree = BinarySearchTree.new
tree.insert(23, "movie")
tree.insert(12, "movie2")
puts tree.left_node






# spaceship operator
# a <=> b :=
#   if a < b then return -1
#   if a = b then return  0
#   if a > b then return  1
#   if a and b are not comparable then return nil
