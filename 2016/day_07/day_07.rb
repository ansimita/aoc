# SPDX-License-Identifier: MIT
# https://github.com/ansimita/aoc

# frozen_string_literal: true

require 'set'

def aba(net)
  net.each_char
     .each_cons(3)
     .filter { _1 != _2 && _1 == _3 }
     .map(&:join)
end

def aba_to_bab(aba)
  aba[1] + aba[0..1]
end

def abba(net)
  net.each_char
     .each_cons(4)
     .filter { _1 != _2 && _1 + _2 == _4 + _3 }
     .map(&:join)
end

def hypernets(ip)
  a = []
  until ip.nil?
    start_index = ip.index('[')
    break if start_index.nil?
    end_index = ip.index(']')
    a << ip[start_index + 1...end_index]
    ip = ip[end_index + 1..]
  end
  a
end

def number_of_ip_addresses_with_ssl_support(ip_addresses)
  ip_addresses.count { |ip| supports_ssl?(ip) }
end

def number_of_ip_addresses_with_tls_support(ip_addresses)
  ip_addresses.count { |ip| supports_tls?(ip) }
end

def supernets(ip)
  a = []
  until ip.nil?
    start_index = ip.index('[')
    break a << ip if start_index.nil?
    end_index = ip.index(']')
    a << ip[...start_index]
    ip = ip[end_index + 1..]
  end
  a
end

def supports_tls?(ip)
  supernets(ip).any? { |n| abba(n).any? } &&
    hypernets(ip).all? { |n| abba(n).empty? }
end

def supports_ssl?(ip)
  all_aba = supernets(ip).map { |n| aba(n) }.flatten
  all_bab = hypernets(ip).map { |n| aba(n) }.flatten
  all_aba.map { |aba| aba_to_bab(aba) }.to_set.intersect?(all_bab.to_set)
end

if __FILE__ == $PROGRAM_NAME
  ip_addresses = File.readlines('input.txt', chomp: true)
  puts "Part One: #{number_of_ip_addresses_with_tls_support(ip_addresses)}"
  puts "Part Two: #{number_of_ip_addresses_with_ssl_support(ip_addresses)}"
end
