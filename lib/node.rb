require 'pry'
class Node

  attr_reader :score,
              :title


  attr_accessor :left,
                :right,
                :depth


  def initialize(score, title, left = nil, right = nil, depth = nil)
    @score = score
    @title = title
    @left = left
    @right = right
    @depth = depth
  end

end
