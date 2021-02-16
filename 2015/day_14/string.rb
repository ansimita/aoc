# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

require_relative 'reindeer'

class String
  def to_reindeer
    match(%r{(\d+) km/s \w+ (\d+) \w+, (\w+ ){5}(\d+)}) do |m|
      Reindeer.new(m[1].to_i, m[2].to_i, m[4].to_i)
    end
  end
end
