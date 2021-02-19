# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

def error_corrected(tallies)
  tallies.map { |tally| tally.key(tally.values.max) }.join
end

def original(tallies)
  tallies.map { |tally| tally.key(tally.values.min) }.join
end

def tallies(messages)
  messages.map { |l| l.each_char.entries }.transpose.map(&:tally)
end

if __FILE__ == $PROGRAM_NAME
  tallies = tallies(File.readlines('input.txt', chomp: true))
  puts "Part One: #{error_corrected(tallies)}"
  puts "Part Two: #{original(tallies)}"
end
