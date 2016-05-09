PUBLIC CLASS METHODS

.[](args)

create a new array with the arguments

Array.[](1, 2, 3, 4, 5)
  => [1, 2, 3, 4, 5]

----------

.new
.new(size)
.new(size, default_value)
.new {|element| element block}

create a new array

Array.new
  => []
Array.new(5)
  => [nil, nil, nil, nil, nil]
Array.new(5, 10)
  => [10, 10, 10, 10, 10]
Array.new(5) {|num| num + 1}
  => [1, 2, 3, 4, 5]

if you need to populate with hashes, pass a block instead of using arguments

new_array = Array.new(2) { Hash.new }
  => [{}, {}]
new_array[0]["jim"] = "rulez"
  => "rulez"
  new_array => [{"jim"=>"rulez"}, {}]

----------

.try_convert
tries to convert object into array using .to_ary
returns converted array or nil if the object cannot be converted

Array.try_convert(["jim"])
  => ["jim"]
Array.try_convert("jim")
  => nil

**********
CHECK IF ARGUMENT IS ARRAY

if tmp = Array.try_convert(arg)
  # the argument is an array
elsif tmp = String.try_convert(arg)
  # the argument is a string
end
**********

----------

PUBLIC INSTANCE METHODS

&
[ary] & [ary]
returns new array that has elements common to both arrays

one_array = [1, 2, 3, 4, 5]
another_array = [1, 3, 5, 7, 9]

one_array & another_array
  => [1, 3, 5]

----------

*
[ary] * integer => [new_array]
[ary] * string => [new_string]

returns new array by concatenating [integer] versions of [ary]
returns new string by concatenating [integer] versions of [string]

one_array = [1, 2, 3, 4, 5]

one_array * 3
  => [1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5]
one_array * "jim"
  => "1jim2jim3jim4jim5"

----------

+
[ary] + [ary] => [new_array]
returns a new array by concatenating both arrays

new_array = [1, 2, 3]
another_array = [4, 5, 6]

concat_array = new_array + another_array
  => [1, 2, 3, 4, 5, 6]
  concat_array => [1, 2, 3, 4, 5, 6]

----------

-
[ary] - [ary] => [new_array]
returns a new array by subtracting elements of the second from the first

new_array = [1, 2, 3, 4, 5]
another_array = [4, 5, 6, 7, 8]

difference_array = new_array - another_array
  => [1, 2, 3]
  difference_array => [1, 2, 3]

----------

<<
[ary] << obj
.push
adds element to end of array

new_array = [1, 2, 3, 4, 5]
new_array << "hey" << "there"
  => [1, 2, 3, 4, 5, "hey", "there"]

----------

<=>
[ary] <=> [ary]
compares elements one by one and returns -1, 0, +1 or nil as soon as comparison is non-zero
if all elements are equal, lengths are compared
  nil is returned if second compared object is not an array

new_array = [1, 2, 3, 4, 5]
another_array = [1, 2, 3, 4, 5]
zam_another = [2, 3, 4, 5]
holy_cow = "holy_cow"

new_array <=> another_array
  => 0
new_array <=> zam_another
  => -1
zam_another <=> new_array
  => 1
new_array <=> holy_cow
  => nil

----------

==
[ary] == [ary]
compares elements and returns a boolean
a comparison is true if each array has the same number of elements and if each element is equal

new_array = [1, 2, 3, 4, 5]
another_array = [1, 2, 3, 4, 5]
zam_another = [2, 3, 4, 5]

new_array == another_array
  => true
new_array == zam_another
  => false

----------

ary[index]
ary[start, length]
ary[range]
.slice(index)
.slice(start, length)
.slice(range)

ELEMENT REFERENCE

returns element at index
returns subarray starting at index and continuing for length
returns subarray specified by range
a negative index counts backwards--the last element is -1
an empty array is returned when the starting index of a range is at the end of the array
returns nil if the index is out of range

new_array = [1, 2, 3, 4, 5]
new_array[0]
  => 1
new_array[1, 3]
  => [2, 3, 4]
new_array[0..3]
  => [1, 2, 3, 4]
new_array[9]
  => nil
new_array[5, 1]
  => []
new_array.slice(0)
  => 1
new_array.slice(1, 3)
  => [2, 3, 4]
new_array.slice(0..3)
  => [1, 2, 3, 4]
new_array.slice(9)
  => nil

----------

ELEMENT ASSIGNMENT

ary[index] = obj, other_ary or nil => obj
ary[start, length] = obj, other_ary or nil => obj
ary[range] = obj, other_ary or nil => obj or other_ary or nil
create element at index
similar to push and unshift
IndexError is raised if a negative index points past the beginning of the array

new_array = Array.new
new_array[0] = 1
  => 1
  new_array => => [1]
new_array[1, 3] = "jim_rulez"
  => "jim_rulez"
  new_array => [1, "jim_rulez"]
new_array[4..6] = "dana_rulez!"
  => "dana_rulez!"
  new_array => [1, "jim_rulez", nil, nil, "dana_rulez!"]

----------

.any?
[ary].any? {|object| block}
returns boolean if array includes element

new_array = [1, 2, 3, 4, 5]
new_array.any? {|num| num > 3}
  => true
new_array.any? {|num| num > 10}
  => false

----------

.assoc(object)
compares one array to another whose elements are also arrays
returns first array that matches or nil if there is no match

new_array = [[1, 1], [2, 2], [3, 3], [4, 4], "not_array"]
new_array.assoc(2)
  => [2, 2]
new_array.assoc("not_array")
  => nil

----------

.at(index)
returns element at index and returns nil if index is out of range

new_array = [1, 2, 3, 4, 5]
new_array.at(0)
  => 1
new_array.at(10)
  => nil

----------

.bsearch {|object| block}
returns element by using binary search
has two modes: find-minimum and find-any--for both, elements of array must be sorted

#TODO

----------

.bsearch_index {|object| block}

#TODO

----------

.clear
removes all elements from array, making a blank array

new_array = [1, 2, 3, 4, 5]
new_array.clear
  => []

----------

.collect {|element| block}
.map.with_index {|element, iterator| block}
returns new array containing values from the block

new_array = [1, 2, 3, 4, 5]
new_array.collect {|num| num * 10}
  => [10, 20, 30, 40, 50]
new_array.map.with_index {|num, iterator| num * iterator}
  => [0, 2, 6, 12, 20]
another_array = ["a", "b", "c", "d"]
another_array.map.with_index {|num, iterator| num * iterator}
  => ["", "b", "cc", "ddd"]

----------

.collect! {|element| block}
.map! {|element| block}
.collect.with_index {|element, iterator| block}
changes original array to contain values from the block

new_array = [1, 2, 3, 4, 5]
new_array.collect! {|num| num * 10}
  => [10, 20, 30, 40, 50]
new_array.map! {|num| num * 10}
  => [10, 20, 30, 40, 50]
new_array.collect!.with_index {|num, iterator| num * iterator}
  => [0, 2, 6, 12, 20]

----------

.combination

#TODO

----------

.compact
returns a copy of array with all nil elements removed

new_array = [1, nil, 2, nil, nil, 3, 4, 5, nil,]
new_array.compact
  => [1, 2, 3, 4, 5]

----------

.compact!
returns a copy of array with all nil elements removed

new_array = [1, nil, 2, nil, nil, 3, 4, 5, nil,]
new_array.compact!
  => [1, 2, 3, 4, 5]
  new_array => [1, 2, 3, 4, 5]

----------

.concat(another_array)
concatenates second array into first

new_array = ["jim", "rulez"]
new_array.concat(["yup", "yup"])
  => ["jim", "rulez", "yup", "yup"]

----------

.count
.count(object)
.count {|element| return true value}
returns number of elements
with one argument, returns number of elements equal to object with ==
with a block, returns number of times block is true for each element

new_array = [1, 2, 3, 4, 5]
new_array.count
  => 5
another_array =  ["what", "what", "in", "the", "butt"]
another_array.count
  => 5
another_array.count("what")
  => 2
another_array.count {|word| word.length < 3}
  => 1

----------

.cycle(n) {|element| block}
returns nil after running the block operation n number of times
goes forever if n is omitted or nil

new_array = [1, 2, 3, 4, 5]
new_array.cycle(3) {|x| print x}
  123451234512345=> nil
new_array.cycle(2) {|x| x < 4}
  => nil

----------

.delete(obj)
.delete(obj) { block }
deletes element equal and returns the last deleted element or nil if it does not exist
returns element in the block if the object does not exist

new_array = [1, 2, 3, 4, 5]
new_array.delete(3)
  => 3
  new_array => [1, 2, 4, 5]
new_array.delete(10) {"sorry, dude, it's not here"}
  => "sorry, dude, it's not here"

----------

.delete_at(index)
deletes by index

new_array = [1, 2, 3, 4, 5]
new_array.delete_at(0)
=> 1
new_array => [2, 3, 4, 5]


















#
