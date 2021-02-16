# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

require_relative 'string'

def most_matches(sues, part)
  matches = sues.map do |sue|
    { children: 3, cats: 7, samoyeds: 2, pomeranians: 3, akitas: 0,
      vizslas: 0, goldfish: 5, trees: 3, cars: 2, perfumes: 1 }.count do |k, v|
      sue.include?(k) && case part
                         when :one then sue[k] == v
                         when :two
                           case k
                           when :cats, :trees then sue[k] > v
                           when :pomeranians, :goldfish then sue[k] < v
                           else sue[k] == v
                           end
                         end
    end
  end
  matches.index(matches.max) + 1
end

def sues(descriptions)
  descriptions.map(&:to_sue)
end

if __FILE__ == $PROGRAM_NAME
  sues = sues(File.readlines('input.txt'))
  puts "Part One: #{most_matches(sues, :one)}"
  puts "Part Two: #{most_matches(sues, :two)}"
end
