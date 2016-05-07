CREATE

literal constructor: []
new_array = [1, 2, 3, 4, 5]

call:
new_array = Array.new
  => []

pass argument:
set initial size
Array.new(3)
  => [nil, nil, nil]

pass 2 arguments:
set initial size and default object
Array.new(3, "JIMRULZ")
  => ["JIMRULZ", "JIMRULZ", "JIMRULZ"]
# best done when you need immutalbe objects
  # such as a hash, symbol, true or false

pass a block:
create an array of objects
Array.new(3) { Hash.new }
  => [{}, {}, {}]
Array.new(3) { Array.new(3) }
  => [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]

use a method:
calls to_array then to_a on its arguments
Array({:jim => "rules", :dana => "rulez2"})
  => [[:jim, "rules"], [:dana, "rulez2"]]
