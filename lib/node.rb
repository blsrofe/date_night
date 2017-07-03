require 'pry'
class Node

  attr_accessor :score,
                :title,
                :depth,
                :right,
                :left


  def initialize(score, title, depth = 0, right = nil, left = nil)
    @score = score
    @title = title
    @depth = depth
    @right = right
    @left = left
  end

end
