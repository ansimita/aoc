# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

def factors(n)
  (1..n).filter { |m| (n % m).zero? }
end

def lowest_house_number(at_least_as_many_presents, part)
  (1..).each do |house| # adjust starting point accordingly
    break house if presents(house, part) >= at_least_as_many_presents
  end
end

def presents(house, part)
  factors(house).sum do |f|
    case part
    when :one then f * 10
    when :two then house / f <= 50 ? f * 11 : 0
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  print 'Enter puzzle input: '
  presents = gets.chomp.to_i
  puts "Part One: #{lowest_house_number(presents, :one)}"
  puts "Part Two: #{lowest_house_number(presents, :two)}"
end
