require 'pry'
class Node

  attr_accessor :score,
                :title,
                :depth,
                :right,
                :left,
                :data,
                :children


  def initialize(score, title, depth = 0, right = nil, left = nil, children = nil, data = {})
    @score = score
    @title = title
    @depth = depth
    @right = right
    @left = left
    @data = data
    @children = children
    @data[@title] = @score
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
      @left.depth = depth_counter
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
      @right.depth = depth_counter
      depth_counter
    else
      node = @right
      node.insert(score, title, depth_counter)
    end
  end

  def include?(include_score, current_node)
      if current_node.score == include_score
        return true
      elsif include_score < current_node.score
        current_node = @left
        return false if current_node == nil
        current_node.include?(include_score, current_node)
      elsif include_score > current_node.score
        current_node = @right
        return false if current_node == nil
        current_node.include?(include_score, current_node)
      end
  end

  def depth_of(depth_score, current_node)
      if current_node.score == depth_score
        current_node.depth
      elsif depth_score < current_node.score
        current_node = @left
        return nil if current_node == nil
        current_node.depth_of(depth_score, current_node)
      elsif depth_score > current_node.score
        current_node = @right
        return nil if current_node == nil
        current_node.depth_of(depth_score, current_node)
      end
  end

  def max(current_node)
    if current_node.right == nil
      current_node.data
    else
      current_node = current_node.right
      current_node.max(current_node)
    end
  end

  def min(current_node)
    if current_node.left == nil
      current_node.data
    else
      current_node = current_node.left
      current_node.min(current_node)
    end
  end

  def sort(current_node, movie_collection = [])
    if current_node == nil
      return
    end
      sort(current_node.left, movie_collection)
      movie_collection << current_node.data
      sort(current_node.right, movie_collection)
      movie_collection
  end

  def sort_for_depth(current_node, tree_depth, total_nodes, depth_collection = [])
    if current_node == nil
      return
    elsif current_node.depth == tree_depth
        evaluate_children(current_node)
        number_of_children = current_node.children.to_f + 1
        percentage = (number_of_children / total_nodes.to_f) * 100
        health_collection = [current_node.score, number_of_children.to_i, percentage.to_i]
        depth_collection << health_collection
    end
    sort_for_depth(current_node.left, tree_depth, total_nodes, depth_collection)
    sort_for_depth(current_node.right, tree_depth, total_nodes, depth_collection)
    depth_collection
  end

  def evaluate_children(current_node, child_counter = 0)
    if current_node.left == nil && current_node.right == nil
      @children = child_counter
    else
      go_left_children(current_node, child_counter)
      go_right_children(current_node, child_counter)
    end
  end

  def go_right_children(current_node, child_counter)
    child_counter += 1
    if @right == nil
      @children = child_counter
    else
      current_node = @right
      current_node.evaluate_children(current_node, child_counter)
    end
  end

  def go_left_children(current_node, child_counter)
    child_counter += 1
    if @left == nil
      @children = child_counter
    else
      current_node = @left
      current_node.evaluate_children(current_node, child_counter)
    end
  end

end
