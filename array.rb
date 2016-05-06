DEFINITION

An ordered collection of any objects indexed by integer.

[1, "b", 3.0]

----------

CREATING

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

----------

ACCESSING

by index:
access by integer starting at 0 (numeric index), pair of arguments (start and length) or range
negative indices start counting from the end starting at -1

new_array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
new_array[0]
  => 0
new_array[0, 5]
  => [0, 1, 2, 3, 4]
new_array[0..5]
  => [0, 1, 2, 3, 4, 5]
new_array[5..-1]
  => [5, 6, 7, 8, 9]

.at method:
use method

new_array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
new_array.at(5)
  => 5

.slice method:
works the exact same as array[n]

new_array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
new_array.slice(5)
  => 5

.fetch method:
use one argument to raise an error if it is not in an array
use two arguments to set a default value if element is not found

new_array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
new_array.fetch(50)
  => IndexError: index 50 outside of array bounds: -10...10
new_array.fetch(50, "wutwut")
  => "wutwut"

.first method:
gets first elmeent

my_array = [1, 2, 3]
my_array.first
  => 1

.last element
gets last element

my_array = [1, 2, 3]
my_array.last
  => 3

.take(n) method:
get first n elements

new_array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
new_array.take(5)
  => [0, 1, 2, 3, 4]

.drop(n) method:
return the remaining elements after n elements have been dropped

new_array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
new_array.drop(5)
  => [5, 6, 7, 8, 9]

----------

GETTING INFORMATION

length:
to get the number of elements in an array, use .length, .count or .size

new_array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
new_array.length
  => 10
new_array.count
  => 10
new_array.size
  => 10

empty method:
see if array contains anything at all with .empty?

new_array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
new_array.empty?
  => false

include method:
see if array contains element with .include?

new_array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
new_array.include?(5)
  => true

----------

ADD ELEMENTS

.push(obj) and shovel method:
add element to end of array with .push(obj) or <<

new_array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
new_array.push("farts")
  => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, "new_thing"]
new_array << "new_thing"
  => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, "new_thing"]

unshift(obj) method:
add element to beginning of an array

new_array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
new_array.unshift("new_thing")
  => ["new_thing", 0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

insert(pos, obj) method:
use two arguments to add element to any position
use more than two to add more than one element to any position

new_array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
new_array.insert(5, "new_thing")
  => [0, 1, 2, 3, 4, "new_thing", 5, 6, 7, 8, 9]
new_array.insert(5, "ohman", "newstuff", "righthere")
  => [0, 1, 2, 3, 4, "ohman", "newstuff", "righthere", 5, 6, 7, 8, 9]

----------

REMOVE ELEMENT

.pop method:
remove and return last element

new_array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
new_array.pop
  => 9

.shift method:
remove an return first element

new_array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
new_array.shift
  => 0

.delete_at(n) method:
delete element at index

new_array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
new_array.delete_at(3)
  => 3
  new_array => [0, 1, 2, 4, 5, 6, 7, 8, 9]

.delete method:
delete element by name at any index

new_array = ["a", "b", "c"]
new_array.delete("b")
  => "b"
  new_array => ["a", "c"]

.compact method:
remove all nil values from array

new_array = [nil, nil, nil, "freddy"]
new_array.compact
  => ["freddy"]
























#
