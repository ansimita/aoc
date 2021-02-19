# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

class Keypad
  attr_reader :code

  def initialize
    @code = ''
    @key = 5
  end

  def move_up
    return if [1, 2, 3].include?(@key)
    @key = case @key
           when 4 then 1
           when 5 then 2
           when 6 then 3
           when 7 then 4
           when 8 then 5
           when 9 then 6
           end
  end

  def move_down
    return if [7, 8, 9].include?(@key)
    @key = case @key
           when 1 then 4
           when 2 then 5
           when 3 then 6
           when 4 then 7
           when 5 then 8
           when 6 then 9
           end
  end

  def move_left
    return if [1, 4, 7].include?(@key)
    @key = case @key
           when 2 then 1
           when 3 then 2
           when 5 then 4
           when 6 then 5
           when 8 then 7
           when 9 then 8
           end
  end

  def move_right
    return if [3, 6, 9].include?(@key)
    @key = case @key
           when 1 then 2
           when 2 then 3
           when 4 then 5
           when 5 then 6
           when 7 then 8
           when 8 then 9
           end
  end

  def press
    @code += @key.to_s
  end
end

class ActualKeypad < Keypad
  def move_up
    return if [1, 2, 4, 5, 9].include?(@key)
    @key = case @key
           when 3 then 1
           when 6 then 2
           when 7 then 3
           when 8 then 4
           when 10 then 6
           when 11 then 7
           when 12 then 8
           when 13 then 11
           end
  end

  def move_down
    return if [5, 9, 10, 12, 13].include?(@key)
    @key = case @key
           when 1 then 3
           when 2 then 6
           when 3 then 7
           when 4 then 8
           when 6 then 10
           when 7 then 11
           when 8 then 12
           when 11 then 13
           end
  end

  def move_left
    return if [1, 2, 5, 10, 13].include?(@key)
    @key = case @key
           when 3 then 2
           when 4 then 3
           when 6 then 5
           when 7 then 6
           when 8 then 7
           when 9 then 8
           when 11 then 10
           when 12 then 11
           end
  end

  def move_right
    return if [1, 4, 9, 12, 13].include?(@key)
    @key = case @key
           when 2 then 3
           when 3 then 4
           when 5 then 6
           when 6 then 7
           when 7 then 8
           when 8 then 9
           when 10 then 11
           when 11 then 12
           end
  end

  def press
    @code += case @key
             when 10 then 'A'
             when 11 then 'B'
             when 12 then 'C'
             when 13 then 'D'
             else @key.to_s
             end
  end
end
