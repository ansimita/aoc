# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

require 'English'

require_relative 'bots'

def identify_bot_multiply_outputs(instructions, low, high, which)
  bots = Bots.new
  outputs = {}
  until instructions.empty?
    case instructions.shift
    when /value (\d+) goes to bot (\d+)/
      value = $LAST_MATCH_INFO[1].to_i
      bot = $LAST_MATCH_INFO[2].to_i
      bots[bot] = value
    when /bot (\d+) gives low to (\w+) (\d+) and high to (\w+) (\d+)/
      bot = $LAST_MATCH_INFO[1].to_i
      next instructions << $LAST_MATCH_INFO.string unless bots.ready?(bot)
      min, max = bots[bot]
      target = bot if min == low && max == high
      x, y = case [$LAST_MATCH_INFO[2], $LAST_MATCH_INFO[4]]
             when %w[bot bot] then [bots, bots]
             when %w[bot output] then [bots, outputs]
             when %w[output bot] then [outputs, bots]
             when %w[output output] then [outputs, outputs]
             end
      x[$LAST_MATCH_INFO[3].to_i] = min
      y[$LAST_MATCH_INFO[5].to_i] = max
    end
  end
  [target, outputs.fetch_values(*which).reduce(:*)]
end

if __FILE__ == $PROGRAM_NAME
  instructions = File.readlines('input.txt')
  bot, product = identify_bot_multiply_outputs(instructions, 17, 61, [0, 1, 2])
  puts "Part One: #{bot}"
  puts "Part Two: #{product}"
end
