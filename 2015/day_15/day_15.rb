# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

require_relative 'string'

def allot(number_of_ingredients, teaspoons)
  allotments = []
  0.upto(teaspoons) do |teaspoon|
    0.upto(teaspoons) do |remainder|
      next unless teaspoon + remainder == teaspoons
      if number_of_ingredients == 2
        allotments << [teaspoon, remainder]
      else
        allot(number_of_ingredients - 1, remainder).each do |a|
          allotments += [a << teaspoon]
        end
      end
    end
  end
  allotments
end

def highest_scoring_cookie(ingredients, calories: nil)
  max_score = 0
  properties = Array.new(5, 0)
  allot(ingredients.size, 100).each do |allotment|
    properties.fill(0)
    allotment.each_with_index do |teaspoon, index|
      properties[0] += teaspoon * ingredients[index].capacity
      properties[1] += teaspoon * ingredients[index].durability
      properties[2] += teaspoon * ingredients[index].flavor
      properties[3] += teaspoon * ingredients[index].texture
      properties[4] += teaspoon * ingredients[index].calories
    end
    next unless calories.nil? || properties[4] == calories
    next if properties.any?(&:negative?)
    score = properties[..3].reduce(:*)
    max_score = score if score > max_score
  end
  max_score
end

def ingredients(descriptions)
  descriptions.map(&:to_ingredient)
end

if __FILE__ == $PROGRAM_NAME
  ingredients = ingredients(File.readlines('input.txt'))
  puts "Part One: #{highest_scoring_cookie(ingredients)}"
  puts "Part Two: #{highest_scoring_cookie(ingredients, calories: 500)}"
end
