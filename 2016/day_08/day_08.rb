# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

def lit(screen)
  screen.flatten.count(true)
end

def print_screen(screen)
  screen.each do |row|
    row.each { |cell| print cell ? '#' : '.' }
    puts
  end
end

def render(instructions)
  columns = 50
  rows = 6
  screen = Array.new(rows) { Array.new(columns, false) }
  instructions.each do |instruction|
    m = instruction.match(/(\d+)(x| by )(\d+)/)
    a = m[1].to_i
    b = m[3].to_i
    case instruction
    when /rect/
      screen[...b].each { |row| row.fill(true, 0, a) }
    when /rotate column x=/
      screen = screen.transpose
      screen[a].rotate!(rows - b)
      screen = screen.transpose
    when /rotate row y=/
      screen[a].rotate!(columns - b)
    end
  end
  screen
end

if __FILE__ == $PROGRAM_NAME
  screen = render(File.readlines('input.txt'))
  puts "Part One: #{lit(screen)}"
  puts 'Part Two:'
  print_screen(screen)
end
