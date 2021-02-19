# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

require_relative 'string'

def real_rooms(data)
  data.map(&:to_room).filter(&:real?)
end

def sector_id(rooms)
  target = 'northpole-object-storage'
  rooms.find { |r| r.decrypted_name == target }.sector_id
end

def sum_sector_id(rooms)
  rooms.sum(&:sector_id)
end

if __FILE__ == $PROGRAM_NAME
  real = real_rooms(File.readlines('input.txt', chomp: true))
  puts "Part One: #{sum_sector_id(real)}"
  puts "Part Two: #{sector_id(real)}"
end
