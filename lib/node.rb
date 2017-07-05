require 'pry'
class Node

  attr_accessor :score,
                :title,
                :depth,
                :right,
                :left,
                :data


  def initialize(score, title, depth = 0, right = nil, left = nil, data = {})
    @score = score
    @title = title
    @depth = depth
    @right = right
    @left = left
    @data = data
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

  def sort(current_node)
    if current_node.left != nil
      sort(current_node.left)
    else
      add_to_collection(current_node)
      sort(current_node.right)
    end
  end

    # node = start_at_lowest_score_node(current_node)
    # add_to_collection(node)
    # node.traverse(node)
    # node.next_node(node)
    # if current_node.right == nil and current_node.left == nil
    #   current_node.add_to_collection(current_node)
    # elsif current_node.right == nil
    #     current_node = current_node.left
    #     current_node.add_to_collection(current_node)
    #     current_node.sort(current_node)
    # elsif current_node.left == nil
    #   current_node = current_node.right
    #   current_node.add_to_collection(current_node)
    #   current_node.sort(current_node)
    # elsif current_node.right != nil and current_node.left != nil
    #   current_node = current_node.left
    #   current_node.add_to_collection(current_node)
    #   current_node.sort(current_node)
    #   end
  # end



  def add_to_collection(node, movie_collection = [])
    movie_collection << node.data
  end


end
