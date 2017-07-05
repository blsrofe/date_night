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
      root_node.insert(score, title)
    end
  end

  def include?(include_score)
      root_node.include?(include_score, @root_node)
  end

  def max
      root_node.max(@root_node)
  end

  def min
      root_node.min(@root_node)
  end

  def depth_of(score)
    root_node.depth_of(score, @root_node)
  end

  def load(file)
    movies = File.open(file)#read File docs read lines
    movie_counter = 0
    movies.each_line do |line|
      split_line = line.strip.split(", ")#=array with 2 strings, score and title
      next if root_node.depth_of(split_line[0].to_i, @root_node) != nil
      movie_counter += 1
      root_node.insert(split_line[0].to_i, split_line[1])
    end
    movies.close
    movie_counter
  end

  def sort
    root_node.sort(@root_node)
  end

end















# spaceship operator
# a <=> b :=
#   if a < b then return -1
#   if a = b then return  0
#   if a > b then return  1
#   if a and b are not comparable then return nil
