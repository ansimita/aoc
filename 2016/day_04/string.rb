# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

require_relative 'room'

class String
  def to_room
    Room.new(slice(..-12), slice(-10..-8).to_i, slice(-6..-2))
  end
end
