# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

require 'English'

class Computer
  attr_reader :a

  def initialize(c)
    @a = 0
    @b = 0
    @c = c
    @d = 0
  end

  def run(instructions)
    index = 0
    index += evaluate(instructions[index]) while index < instructions.size
  end

  private

  def evaluate(instruction)
    case instruction
    when /cpy (\w+) (\w)/
      value = get_value($LAST_MATCH_INFO[1])
      instance_variable_set("@#{$LAST_MATCH_INFO[2]}", value)
      1
    when /inc (\w)/
      operate($LAST_MATCH_INFO[1], :+)
      1
    when /dec (\w)/
      operate($LAST_MATCH_INFO[1], :-)
      1
    when /jnz (\w) (-*\d)/
      get_value($LAST_MATCH_INFO[1]).zero? ? 1 : $LAST_MATCH_INFO[2].to_i
    end
  end

  def get_value(s)
    case s
    when 'a', 'b', 'c', 'd'
      instance_variable_get("@#{s}").to_i
    else s.to_i
    end
  end

  def operate(register, op)
    value = instance_variable_get("@#{register}").to_i
    instance_variable_set("@#{register}", value.public_send(op, 1))
  end
end
