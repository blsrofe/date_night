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

  def insert(new_score, new_title, depth_counter = 0)
    if new_score < @score
      go_left(new_score, new_title, depth_counter)
    else
      go_right(new_score, new_title, depth_counter)
    end
  end

  def go_left(score, title, depth_counter)
    depth_counter += 1
    if @left == nil
      @left = Node.new(score, title)
      depth_counter
    else
      node = @left
      node.insert(score, title, depth_counter)
    end
  end

  def go_right(score, title, depth_counter)
    depth_counter += 1
    if @right == nil
      @right = Node.new(score, title)
      depth_counter
    else
      node = @right
      node.insert(score, title, depth_counter)
    end
  end

  def include?(include_score, current_node)
    while current_node != nil
      if current_node.score == include_score
        return true
      elsif include_score < current_node.score
        current_node = @left
        current_node.include?(include_score, current_node)
      elsif include_score > current_node.score
        current_node = @right
        current_node.include?(include_score, current_node)
      end
    end
      false
  end



end
