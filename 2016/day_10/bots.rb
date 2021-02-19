# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

class Bots
  def initialize
    @h = {}
  end

  def [](id)
    mm = @h[id].minmax
    @h[id].clear
    mm
  end

  def []=(id, value)
    if @h.key?(id)
      @h[id] << value
    else
      @h[id] = [value]
    end
  end

  def ready?(id)
    @h.key?(id) && @h[id].size == 2
  end
end
