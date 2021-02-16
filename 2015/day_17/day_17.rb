# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

def combinations(containers)
  mix = []
  2.upto(containers.size) do |size|
    mix += containers.combination(size).filter { |combo| combo.sum == 150 }
  end
  mix
end

def containers(lines)
  lines.map(&:to_i)
end

def minimum_ways(containers)
  mixes = combinations(containers)
  min_mix_size = mixes.map(&:size).min
  mixes.count { |mix| mix.size == min_mix_size }
end

def number_of_combinations(containers)
  combinations(containers).size
end

if __FILE__ == $PROGRAM_NAME
  containers = containers(File.readlines('input.txt', chomp: true))
  puts "Part One: #{number_of_combinations(containers)}"
  puts "Part Two: #{minimum_ways(containers)}"
end
