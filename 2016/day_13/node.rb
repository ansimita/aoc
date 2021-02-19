# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

class Node
  attr_accessor :steps
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def adjacent(input)
    [[0, 1], [0, -1], [1, 0], [-1, 0]].map do |a|
      x = @x + a.first
      y = @y + a.last
      Node.new(x, y) if x >= 0 && y >= 0 && coordinates_space?(x, y, input)
    end.compact
  end

  def to_a
    [@x, @y]
  end
end
