# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

class String
  def find_five_consecutive_characters
    each_char.each_cons(5).find { _1 == _2 && _2 == _3 && _3 == _4 && _4 == _5 }
  end

  def find_three_consecutive_characters
    each_char.each_cons(3).find { _1 == _2 && _2 == _3 }
  end
end
