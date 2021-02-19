# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

def decompressed_length(s, version)
  size = 0
  loop do
    op_idx = s.index('(')
    break size += s.size if op_idx.nil?
    size += s[...op_idx].size
    sp_idx = s.index(')')

    marker = s[op_idx + 1..sp_idx - 1]
    parts = marker.split('x')
    subsequent = parts.first.to_i
    repetition = parts.last.to_i

    sequence = s[sp_idx + 1..sp_idx + subsequent]

    size += repetition * case version
                         when :one then sequence.size
                         when :two then decompressed_length(sequence, version)
                         end

    s = s[sp_idx + 1 + sequence.size..]
  end
end

if __FILE__ == $PROGRAM_NAME
  data = File.read('input.txt').gsub(/\s+/, '')
  puts "Part One: #{decompressed_length(data, :one)}"
  puts "Part Two: #{decompressed_length(data, :two)}"
end
