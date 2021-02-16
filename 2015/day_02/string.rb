# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

require_relative 'present'

class String
  def to_present
    match(/(\d+)x(\d+)x(\d+)/) do |m|
      Present.new(m[1].to_i, m[2].to_i, m[3].to_i)
    end
  end
end
