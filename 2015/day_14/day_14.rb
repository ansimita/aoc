# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

require_relative 'string'

def distance_traveled_winning_reindeer(reindeers)
  distances = Array.new(reindeers.size, 0)
  reindeers.each_with_index do |reindeer, index|
    2503.times { reindeer.elapse_a_second }
    distances[index] = reindeer.distance_traveled
  end
  distances.max
end

def points_winning_reindeer(reindeers)
  distances = Array.new(reindeers.size, 0)
  points = Array.new(reindeers.size, 0)
  2503.times do
    reindeers.each_with_index do |reindeer, index|
      reindeer.elapse_a_second
      distances[index] = reindeer.distance_traveled
    end
    furthest_distance = distances.max
    distances.each_with_index do |distance, index|
      points[index] += 1 if distance == furthest_distance
    end
  end
  points.max
end

def reindeers(descriptions)
  descriptions.map(&:to_reindeer)
end

if __FILE__ == $PROGRAM_NAME
  reindeers = reindeers(File.readlines('input.txt'))
  puts "Part One: #{distance_traveled_winning_reindeer(reindeers)}"
  reindeers = reindeers(File.readlines('input.txt'))
  puts "Part Two: #{points_winning_reindeer(reindeers)}"
end
