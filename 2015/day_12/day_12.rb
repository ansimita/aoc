# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

require 'json'

def sum(o, include_red: true)
  case o
  when Array then o.sum { |e| sum(e, include_red: include_red) }
  when Hash
    return 0 if !include_red && o.value?('red')
    o.each_value.sum { |v| sum(v, include_red: include_red) }
  when Integer then o
  else 0
  end
end

if __FILE__ == $PROGRAM_NAME
  o = JSON.parse(File.read('input.txt'))
  puts "Part One: #{sum(o)}"
  puts "Part Two: #{sum(o, include_red: false)}"
end
