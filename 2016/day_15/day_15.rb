# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

def capsule(discs, part)
  if part == :two
    hostile = Array.new(11, nil)
    hostile[0] = :slot
    discs << hostile
  end
  (0..).each do |time|
    discs.each { |disc| disc.rotate!(-1) } if time.positive?
    break time if capsule_returned_when_push_button?(discs.map(&:dup))
  end
end

def capsule_returned_when_push_button?(discs)
  # time = time + 1
  discs.each { |disc| disc.rotate!(-1) }
  first_disc_slot_index = discs.first.index(:slot)
  # time = time + 2, time + 3, ...
  (1...discs.size).each do |index|
    discs.each { |disc| disc.rotate!(-1) }
    return false if discs[index][first_disc_slot_index].nil?
  end
  true
end

def discs(lines)
  lines.map do |line|
    m = line.match(/(\d+) positions; at time=0, it is at position (\d+)/)
    a = Array.new(m[1].to_i, nil)
    a[m[2].to_i] = :slot
    a
  end
end

if __FILE__ == $PROGRAM_NAME
  discs = discs(File.readlines('input.txt'))
  puts "Part One: #{capsule(discs, :one)}"
  discs = discs(File.readlines('input.txt'))
  puts "Part Two: #{capsule(discs, :two)}"
end
