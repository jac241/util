require "date"

start = DateTime.new(2023, 12, 1, 0, 00, 00)
finish = DateTime.new(2023, 12, 30, 0, 00, 00)
time_range = start..finish

Dir["**/*.{rb,py,ipynb}"].lazy.map { Pathname.new(_1) }.map { [_1, _1.mtime] }.select { time_range.cover? _1[1] }.first(5)
