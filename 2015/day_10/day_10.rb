# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

def look_and_say(s, iterations)
  buffer = String.new
  iterations.times do
    buffer.clear
    count = 1
    s.each_char.each_cons(2) do |a|
      next count += 1 if a.first == a.last
      buffer << count.to_s + a.first
      count = 1
    end
    s = buffer + count.to_s + s[-1]
  end
  s
end

if __FILE__ == $PROGRAM_NAME
  print 'Enter puzzle input: '
  input = gets.chomp

  result = look_and_say(input, 40)
  puts "Part One: #{result.length}"

  result = look_and_say(result, 10)
  puts "Part Two: #{result.length}"
end
