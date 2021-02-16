# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

class Reindeer
  attr_reader :distance_traveled

  def initialize(speed, moving_period, resting_period)
    @speed = speed
    @moving_period = moving_period
    @resting_period = resting_period
    @period = 0
    @distance_traveled = 0
  end

  def elapse_a_second
    @period = (@period + 1) % (@moving_period + @resting_period)
    @distance_traveled += @speed if (1..@moving_period).include?(@period)
  end
end
