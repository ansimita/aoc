# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

def animate(grid, four_corners_always_on: false)
  size = grid.size
  corners = [[size - 1, size - 1], [0, size - 1], [size - 1, 0], [0, 0]].freeze
  if four_corners_always_on
    grid[0][0] = grid[0][-1] = grid[-1][0] = grid[-1][-1] = '#'
  end
  100.times do
    as_is = grid.map(&:dup)
    as_is.each_with_index do |row, j|
      row.each_with_index do |col, i|
        next if four_corners_always_on && corners.include?([i, j])
        number_of_neighbors_lit = 0
        [[-1, +1], [0, +1], [+1, +1], [+1, 0],
         [+1, -1], [0, -1], [-1, -1], [-1, 0]].each do |x, y|
          y += j
          x += i
          next if y.negative? || y >= size || x.negative? || x >= size
          number_of_neighbors_lit += 1 if as_is[y][x] == '#'
        end
        grid[j][i] =
          case col
          when '#'
            2.upto(3).include?(number_of_neighbors_lit) ? '#' : '.'
          when '.'
            number_of_neighbors_lit == 3 ? '#' : '.'
          end
      end
    end
  end
  grid.flatten.count('#')
end

def grid(lines)
  lines.map { |line| line.each_char.entries }
end

if __FILE__ == $PROGRAM_NAME
  grid = grid(File.readlines('input.txt', chomp: true))
  puts "Part One: #{animate(grid)}"

  grid = grid(File.readlines('input.txt', chomp: true))
  puts "Part Two: #{animate(grid, four_corners_always_on: true)}"
end
