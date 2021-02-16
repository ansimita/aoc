# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

require_relative 'password'

if __FILE__ == $PROGRAM_NAME
  print 'Enter password: '
  password = Password.new(gets.chomp)

  password.succ!
  puts "Part One: #{password}"

  password.succ!
  puts "Part Two: #{password}"
end
