# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

require 'digest'

def password(door_id, part)
  pw = case part
       when :one then ''
       when :two then ' ' * 8
       end
  (0..).each do |index|
    digest = Digest::MD5.hexdigest("#{door_id}#{index}")
    next unless digest.start_with?('0' * 5)
    case part
    when :one then pw += digest[5]
    when :two then if digest[5] =~ /[0-9]/
                     i = digest[5].to_i
                     pw[i] = digest[6] if i < 8 && pw[i] == ' '
                   end
    end
    break pw if pw.delete(' ').size == 8
  end
end

if __FILE__ == $PROGRAM_NAME
  print 'Enter Door ID: '
  door_id = gets.chomp
  puts "Part One: #{password(door_id, :one)}"
  puts "Part Two: #{password(door_id, :two)}"
end
