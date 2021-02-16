# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

def code(target_row, target_column)
  row = 1
  column = 1
  previous = 20_151_125
  until row == target_row && column == target_column
    previous *= 252_533
    previous %= 33_554_393
    if row == 1
      row = column + 1
      column = 1
    else
      row -= 1
      column += 1
    end
  end
  previous
end

if __FILE__ == $PROGRAM_NAME
  instruction = File.read('input.txt')
  m = /row (\d+)/.match(instruction)
  row = m[1].to_i
  m = /column (\d+)/.match(instruction)
  column = m[1].to_i

  puts "Part One: #{code(row, column)}"
end
