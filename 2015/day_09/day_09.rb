# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

require 'set'

def longest_route(descriptions)
  route_distances(descriptions).max
end

def route_distances(descriptions)
  distances = {}
  descriptions.each do |description|
    /(\w+) to (\w+) = (\d+)/.match(description) do |m|
      distances[[m[1], m[2]]] = distances[[m[2], m[1]]] = m[3].to_i
    end
  end
  distances.keys.flatten.to_set.to_a.permutation.map do |route|
    route.each_cons(2).sum { |pair| distances[pair] }
  end
end

def shortest_route(descriptions)
  route_distances(descriptions).min
end

if __FILE__ == $PROGRAM_NAME
  descriptions = File.readlines('input.txt')
  puts "Part One: #{shortest_route(descriptions)}"
  puts "Part Two: #{longest_route(descriptions)}"
end
