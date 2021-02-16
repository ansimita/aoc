# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

require 'set'

def total_change_in_happiness(descriptions, with_me: false)
  seatings = {}
  descriptions.each do |description|
    /(\w+) \w+ (\w+) (\d+) (\w+ ){6}(\w+)/.match(description) do |m|
      seatings[[m[1], m[5]]] =
        case m[2]
        when 'gain' then +m[3].to_i
        when 'lose' then -m[3].to_i
        end
    end
  end
  guests = seatings.keys.flatten.to_set
  if with_me
    me = ''
    guests.each { |guest| seatings[[guest, me]] = seatings[[me, guest]] = 0 }
    guests << me
  end
  changes = guests.to_a.permutation.map do |arrangement|
    seatings[[arrangement.last, arrangement.first]] +
      seatings[[arrangement.first, arrangement.last]] +
      arrangement.each_cons(2).sum do |pair|
        seatings[pair] + seatings[pair.reverse]
      end
  end
  changes.max
end

if __FILE__ == $PROGRAM_NAME
  descriptions = File.readlines('input.txt')
  puts "Part One: #{total_change_in_happiness(descriptions)}"
  puts "Part Two: #{total_change_in_happiness(descriptions, with_me: true)}"
end
