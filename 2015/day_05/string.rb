# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

class String
  def nice?(part)
    case part
    when :one then nice_part_one?
    when :two then nice_part_two?
    end
  end

  private

  def char_appear_twice?
    each_char.each_cons(2).any? { _1 == _2 }
  end

  def nice_part_one?
    count('aeiou') > 2 && char_appear_twice? && !match?(/ab|cd|pq|xy/)
  end

  def nice_part_two?
    pair_appear_twice? && sandwich?
  end

  def pair_appear_twice?
    pairs = {}
    each_char.each_cons(2).each_with_index do |pair, index|
      if pairs.include?(pair)
        return true if pairs[pair] != index
      else
        pairs[pair] = index + 1
      end
    end
    false
  end

  def sandwich?
    each_char.each_cons(3).any? { _1 == _3 }
  end
end
