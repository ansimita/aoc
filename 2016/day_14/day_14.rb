# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

require 'digest'

require_relative 'string'

def hash(cache, index, salt, stretch)
  unless cache.include?(index)
    hash = Digest::MD5.hexdigest("#{salt}#{index}")
    2016.times { hash = Digest::MD5.hexdigest(hash) } if stretch
    cache[index] = hash
  end
  cache[index]
end

def index(salt, stretch)
  cache = {}
  key_index = 0
  (0..).each do |outer_index|
    hash = hash(cache, outer_index, salt, stretch)
    cc_3 = hash.find_three_consecutive_characters
    next if cc_3.nil?
    1.upto(1000).each do |inner_index|
      inner_index += outer_index
      hash = hash(cache, inner_index, salt, stretch)
      cc_5 = hash.find_five_consecutive_characters
      next unless !cc_5.nil? && cc_5.first == cc_3.first
      key_index += 1
      return outer_index if key_index == 64
      break
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  print 'Enter salt: '
  salt = gets.chomp

  puts "Part One: #{index(salt, false)}"
  puts "Part Two: #{index(salt, true)}"
end
