# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

class String
  def decode_diff_length
    d = { '\\' => 1, '"' => 1, 'x' => 3 }.freeze
    s = slice(1, length - 2)
    in_memory = s.length
    previous_was_backslash = false
    s.each_char do |c|
      if d.keys.include?(c) && previous_was_backslash
        in_memory -= d[c]
        next previous_was_backslash = false
      end
      previous_was_backslash = true if c == '\\'
    end
    length - in_memory
  end

  def encode_diff_length
    count = 2
    each_char do |c|
      count += case c
               when '\\', '"' then 2
               else 1
               end
    end
    count - length
  end
end
