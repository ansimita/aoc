# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

class Password < String
  def succ!
    loop do
      super
      break if meet_requirements?
    end
  end

  private

  def contains_increasing_thrice?
    codepoints.each_cons(3).any? { _1 + 1 == _2 && _2 + 1 == _3 }
  end

  def meet_requirements?
    contains_increasing_thrice? &&
      !match?(/i|o|l/) &&
      non_overlapping_pairs.size > 1
  end

  def non_overlapping_pairs
    a = []
    j = -1
    p = slice(0)
    slice(1..).each_char.each_with_index do |c, i|
      if p == c && j + 1 != i
        a << p + c
        j = i
      end
      p = c
    end
    a
  end
end
