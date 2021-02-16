# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

class String
  def to_sue
    h = {}
    %w[children cats samoyeds pomeranians akitas
       vizslas goldfish trees cars perfumes].each do |s|
      match(Regexp.new("#{s}: (\\d+)")) { |m| h[s.to_sym] = m[1].to_i }
    end
    h
  end
end
