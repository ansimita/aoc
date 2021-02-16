# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

require 'English'

class Computer
  attr_reader :b

  def initialize(a: 0, b: 0)
    @a = a
    @b = b
  end

  def run(instructions)
    index = 0
    index += evaluate(instructions[index]) while index < instructions.size
  end

  private

  def evaluate(instruction)
    case instruction
    when /(hlf|tpl|inc) (\w)/
      s, n = { 'hlf' => [:/, 2],
               'tpl' => [:*, 3],
               'inc' => [:+, 1] }[$LAST_MATCH_INFO[1]]
      r = instance_variable_get("@#{$LAST_MATCH_INFO[2]}").public_send(s, n)
      instance_variable_set("@#{$LAST_MATCH_INFO[2]}", r)
      1
    when /jmp (\+|-)(\d+)/
      jmp_offset($LAST_MATCH_INFO[1], $LAST_MATCH_INFO[2])
    when /(jie|jio) (\w), (\+|-)(\d+)/
      var = instance_variable_get("@#{$LAST_MATCH_INFO[2]}")
      if { 'jie' => var.even?, 'jio' => var == 1 }[$LAST_MATCH_INFO[1]]
        jmp_offset($LAST_MATCH_INFO[3], $LAST_MATCH_INFO[4])
      else
        1
      end
    end
  end

  def jmp_offset(sign, offset)
    case sign
    when '+' then +offset.to_i
    when '-' then -offset.to_i
    end
  end
end
