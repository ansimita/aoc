# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

require 'digest'

def lowest_positive_number(secret_key, number_of_leading_zeroes)
  leading_zeroes = '0' * number_of_leading_zeroes
  (1..).each do |n|
    digest = Digest::MD5.hexdigest("#{secret_key}#{n}")
    break n if digest.start_with?(leading_zeroes)
  end
end

if __FILE__ == $PROGRAM_NAME
  print 'Please enter the secret key: '
  secret_key = gets.chomp
  puts "Part One: #{lowest_positive_number(secret_key, 5)}"
  puts "Part Two: #{lowest_positive_number(secret_key, 6)}"
end
