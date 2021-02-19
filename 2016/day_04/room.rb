# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

class Room
  attr_reader :sector_id

  def initialize(name, sector_id, checksum)
    @name = name
    @sector_id = sector_id
    @checksum = checksum
  end

  def decrypted_name
    shift_by = @sector_id % 26
    name = String.new
    @name.each_char do |c|
      shift_by.times { c.succ! } unless c == '-'
      name += c.size == 1 ? c : c[1]
    end
    name
  end

  def real?
    calculate_checksum == @checksum
  end

  private

  def calculate_checksum
    checksum = String.new
    tally = @name.delete('-').each_char.tally
    until checksum.size == 5
      # frequency
      most_common_count = tally.values.max
      keys = tally.filter { |_, v| v == most_common_count }.keys
      # alphabetization
      keys.sort.each { |key| checksum += key if checksum.size < 5 }
      tally.delete_if { |_, v| v == most_common_count }
    end
    checksum
  end
end
