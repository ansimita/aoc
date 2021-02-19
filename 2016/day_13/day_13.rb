# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

require 'set'

require_relative 'node'

def bfs(input, part)
  r = Node.new(1, 1)
  r.steps = 0
  q = Queue.new << r
  s = Set.new << r.to_a
  until q.empty?
    r = q.pop
    return r.steps if part == :one && r.x == 31 && r.y == 39
    return s.size if part == :two && r.steps == 50
    r.adjacent(input).each do |n|
      next if s.include?(n.to_a)
      n.steps = r.steps + 1
      q << n
      s << n.to_a
    end
  end
end

def coordinates_space?(x, y, input)
  v = x * x + 3 * x + 2 * x * y + y + y * y + input
  v.to_s(2).count('1').even?
end

def distinct_locations(input)
  bfs(input, :two)
end

def fewest_steps(input)
  bfs(input, :one)
end

if __FILE__ == $PROGRAM_NAME
  print('Enter puzzle input: ')
  input = gets.chomp.to_i

  puts "Part One: #{fewest_steps(input)}"
  puts "Part Two: #{distinct_locations(input)}"
end
