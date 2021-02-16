# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

class Present
  def initialize(length, width, height)
    @l = length
    @w = width
    @h = height
  end

  def amount_of_ribbon
    perimeter_face_1 = 2 * @l + 2 * @w
    perimeter_face_2 = 2 * @w + 2 * @h
    perimeter_face_3 = 2 * @h + 2 * @l
    volume + [perimeter_face_1, perimeter_face_2, perimeter_face_3].min
  end

  def amount_of_wrapping_paper
    area_face_1 = @l * @w
    area_face_2 = @w * @h
    area_face_3 = @h * @l
    2 * area_face_1 +
      2 * area_face_2 +
      2 * area_face_3 +
      [area_face_1, area_face_2, area_face_3].min
  end

  def volume
    @l * @w * @h
  end
end
