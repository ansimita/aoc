# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

require 'set'

def fewest_steps(molecule)
  molecule.gsub!(/Rn/, '(')
  molecule.gsub!(/Ar/, ')')
  molecule.gsub!(/Al|B|Ca|F|H|Mg|N|O|P|Si|Th|Ti/, 'X')
  molecule.size - molecule.count('()') - 2 * molecule.count('Y') - 1
end

def number_of_distinct_molecules(molecule, replacements)
  s = Set.new
  replacements.map(&:split).each do |sub|
    0.upto(molecule.size - sub.first.size) do |start_index|
      end_index = start_index + sub.first.size - 1
      if molecule[start_index..end_index] == sub.first
        s << molecule[...start_index] + sub.last + molecule[(end_index + 1)..]
      end
    end
  end
  s.size
end

if __FILE__ == $PROGRAM_NAME
  contents = File.readlines('input.txt', chomp: true)
  medicine = contents.pop
  contents.pop # empty line

  puts "Part One: #{number_of_distinct_molecules(medicine, contents)}"
  puts "Part Two: #{fewest_steps(medicine)}"
end
