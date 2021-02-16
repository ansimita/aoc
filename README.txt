Due to the constant code changes,
solutions are kept in separate branches based on the year.

  $ ruby -e 'puts RUBY_VERSION'
  3.0.0

To run one of my puzzle solutions, do the following:

  $ git switch $year
  $ cd $year/$day
  $ ruby $day.rb

My solutions are structured in a way that allows me to
test specific methods interactively with irb.

For example, if $year/day_00.rb contains the method solve:

  $ cd $year/day_00
  $ irb
  >> require_relative 'day_00'
  >> solve('foo', 42)
