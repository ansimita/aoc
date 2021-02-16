# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

def first_group(weights, groups)
  wpg = weights.sum / groups
  1.upto(weights.size) do |size|
    combinations = weights.combination(size).filter { |combo| combo.sum == wpg }
    break combinations unless combinations.empty?
  end
end

def qe_first_group_in_ideal_configuration(weights, groups)
  first_group(weights, groups).map { |a| a.reduce(:*) }.min
end

def weights(lines)
  lines.map(&:to_i)
end

if __FILE__ == $PROGRAM_NAME
  weights = weights(File.readlines('input.txt', chomp: true))
  puts "Part One: #{qe_first_group_in_ideal_configuration(weights, 3)}"
  puts "Part Two: #{qe_first_group_in_ideal_configuration(weights, 4)}"
end
