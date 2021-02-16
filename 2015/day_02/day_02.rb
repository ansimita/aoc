# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

require_relative 'string'

def amount_of_ribbon(presents)
  presents.sum(&:amount_of_ribbon)
end

def amount_of_wrapping_paper(presents)
  presents.sum(&:amount_of_wrapping_paper)
end

def presents(dimensions)
  dimensions.map(&:to_present)
end

if __FILE__ == $PROGRAM_NAME
  presents = presents(File.readlines('input.txt'))
  puts "Part One: #{amount_of_wrapping_paper(presents)}"
  puts "Part Two: #{amount_of_ribbon(presents)}"
end
