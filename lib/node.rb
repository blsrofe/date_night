require 'pry'
class Node

  attr_reader :score,
              :title


  attr_accessor :left_node,
                :right_node,
                :depth


  def initialize(score, title, left_node = nil, right_node = nil, depth = nil)
    @score = score
    @title = title
    @left_node = left_node
    @right_node = right_node
    @depth = depth
  end

end

current_node = Node.new(nil, "hello")
left_node = Node.new(nil, "")
right_node = Node.new(nil, "")
