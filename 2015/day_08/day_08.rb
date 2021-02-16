# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

require_relative 'string'

def sum_decoded_difference(strings)
  strings.sum(&:decode_diff_length)
end

def sum_encoded_difference(strings)
  strings.sum(&:encode_diff_length)
end

if __FILE__ == $PROGRAM_NAME
  strings = File.readlines('input.txt', chomp: true)
  puts "Part One: #{sum_decoded_difference(strings)}"
  puts "Part Two: #{sum_encoded_difference(strings)}"
end
