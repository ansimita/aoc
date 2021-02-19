# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

def count_valid_triangles(triangles)
  triangles.each.count do |sides|
    [[0, 1, 2], [0, 2, 1], [1, 2, 0]].all? do |i|
      sides[i[0]] + sides[i[1]] > sides[i[2]]
    end
  end
end

def number_of_valid_triangles(lines, part)
  lines.map! { |line| line.split.map(&:to_i) }
  if part == :two
    triangles = []
    step = 3
    (0..(lines.length - step)).step(step) do |row_index|
      (0...step).each do |column_index|
        triangles << [lines[row_index + 0][column_index],
                      lines[row_index + 1][column_index],
                      lines[row_index + 2][column_index]]
      end
    end
    lines = triangles
  end
  count_valid_triangles(lines)
end

if __FILE__ == $PROGRAM_NAME
  lines = File.readlines('input.txt')
  puts "Part One: #{number_of_valid_triangles(lines, :one)}"

  lines = File.readlines('input.txt')
  puts "Part Two: #{number_of_valid_triangles(lines, :two)}"
end
