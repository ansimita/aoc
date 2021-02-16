# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

require 'English'

def override(instructions)
  a = signal(instructions.dup)
  instructions.each_with_index do |s, i|
    break instructions[i] = "#{a} -> b" if s.end_with?(' -> b')
  end
  signal(instructions)
end

def signal(instructions)
  ops = { 'AND' => :&, 'OR' => :|, 'LSHIFT' => :<<, 'RSHIFT' => :>> }
  loop do
    instruction = instructions.shift
    case instruction
    when /^(-*\d+) -> (\w+)/
      break $LAST_MATCH_INFO[1].to_i if $LAST_MATCH_INFO[2] == 'a'
      next instructions.each_with_index do |i, i_index|
        components = i.split
        components.each_with_index do |c, c_index|
          components[c_index] = $LAST_MATCH_INFO[1] if c == $LAST_MATCH_INFO[2]
        end
        instructions[i_index] = components.join(' ')
      end
    when /^NOT (-*\d+) -> (\w+)/
      instruction = "#{~$LAST_MATCH_INFO[1].to_i} -> #{$LAST_MATCH_INFO[2]}"
    when /(-*\d+) (\w+) (-*\d+) -> (\w+)/
      lhs = $LAST_MATCH_INFO[1].to_i
      rhs = $LAST_MATCH_INFO[3].to_i
      op = ops[$LAST_MATCH_INFO[2]]
      instruction = "#{lhs.public_send(op, rhs)} -> #{$LAST_MATCH_INFO[4]}"
    end
    instructions << instruction
  end
end

if __FILE__ == $PROGRAM_NAME
  instructions = File.readlines('input.txt', chomp: true)
  puts "Part One: #{signal(instructions)}"
  instructions = File.readlines('input.txt', chomp: true)
  puts "Part Two: #{override(instructions)}"
end
