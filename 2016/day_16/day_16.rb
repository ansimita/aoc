# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

def checksum(input, disk_length)
  data = input[...disk_length]
  output = String.new
  start_index = 0
  end_index = 2
  loop do
    output << case data[start_index...end_index]
              when '00', '11' then '1'
              when '01', '10' then '0'
              end
    if end_index == data.size
      break output if output.size.odd?
      data = output
      output = String.new
      start_index = 0
      end_index = 2
    else
      start_index += 2
      end_index += 2
    end
  end
end

def data(initial_state, disk_length)
  s = initial_state
  s = generate(s) until s.size >= disk_length
  s
end

def generate(a)
  b = String.new
  a.reverse.each_char do |char|
    b << case char
         when '0' then '1'
         when '1' then '0'
         end
  end
  "#{a}0#{b}"
end

if __FILE__ == $PROGRAM_NAME
  print('Enter puzzle input: ')
  initial_state = gets.chomp

  disk_length = 272
  data = data(initial_state, disk_length)
  puts "Part One: #{checksum(data, disk_length)}"

  disk_length = 35_651_584
  data = data(initial_state, disk_length)
  puts "Part Two: #{checksum(data, disk_length)}"
end
