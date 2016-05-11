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
return converted array or nil if the object cannot be converted

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
return new array that has elements common to both arrays

one_array = [1, 2, 3, 4, 5]
another_array = [1, 3, 5, 7, 9]

one_array & another_array
  => [1, 3, 5]

----------

*
[ary] * integer => [new_array]
[ary] * string => [new_string]

return new array by concatenating [integer] versions of [ary]
return new string by concatenating [integer] versions of [string]

one_array = [1, 2, 3, 4, 5]

one_array * 3
  => [1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5]
one_array * "jim"
  => "1jim2jim3jim4jim5"

----------

+
[ary] + [ary] => [new_array]
return a new array by concatenating both arrays

new_array = [1, 2, 3]
another_array = [4, 5, 6]

concat_array = new_array + another_array
  => [1, 2, 3, 4, 5, 6]
  concat_array => [1, 2, 3, 4, 5, 6]

----------

-
[ary] - [ary] => [new_array]
return a new array by subtracting elements of the second from the first

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
compares elements one by one and return -1, 0, +1 or nil as soon as comparison is non-zero
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
compares elements and return a boolean
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

return element at index
return subarray starting at index and continuing for length
return subarray specified by range
a negative index counts backwards--the last element is -1
an empty array is returned when the starting index of a range is at the end of the array
return nil if the index is out of range

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
return boolean if array includes element

new_array = [1, 2, 3, 4, 5]
new_array.any? {|num| num > 3}
  => true
new_array.any? {|num| num > 10}
  => false

----------

.assoc(object)
compares one array to another whose elements are also arrays
return first array that matches or nil if there is no match

new_array = [[1, 1], [2, 2], [3, 3], [4, 4], "not_array"]
new_array.assoc(2)
  => [2, 2]
new_array.assoc("not_array")
  => nil

----------

.at(index)
return element at index and return nil if index is out of range

new_array = [1, 2, 3, 4, 5]
new_array.at(0)
  => 1
new_array.at(10)
  => nil

----------

.bsearch {|object| block}
return element by using binary search
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
return new array containing values from the block

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
return a copy of array with all nil elements removed

new_array = [1, nil, 2, nil, nil, 3, 4, 5, nil,]
new_array.compact
  => [1, 2, 3, 4, 5]

----------

.compact!
return a copy of array with all nil elements removed

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
return number of elements
with one argument, return number of elements equal to object with ==
with a block, return number of times block is true for each element

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
return nil after running the block operation n number of times
goes forever if n is omitted or nil

new_array = [1, 2, 3, 4, 5]
new_array.cycle(3) {|x| print x}
  123451234512345=> nil
new_array.cycle(2) {|x| x < 4}
  => nil

----------

.delete(obj)
.delete(obj) { block }
deletes element equal and return the last deleted element or nil if it does not exist
return element in the block if the object does not exist
destructive

new_array = [1, 2, 3, 4, 5]
new_array.delete(3)
  => 3
  new_array => [1, 2, 4, 5]
new_array.delete(10) {"sorry, dude, it's not here"}
  => "sorry, dude, it's not here"

----------

.delete_at(index)
deletes by index
destructive

new_array = [1, 2, 3, 4, 5]
new_array.delete_at(0)
  => 1
  new_array => [2, 3, 4, 5]

----------

.delete_if {|element| true for element}
deletes each element that evaluates for true in the block
destructive

new_array = [1, 2, 3, 4, 5]
new_array.delete_if {|num| num < 3}
  => [3, 4, 5]
another_array = ["jim", "rulez", "jim", "rulez", "jim", "rulez",]
another_array.delete_if {|word| word == "jim"}
  => ["rulez", "rulez", "rulez"]

----------

.dig =(obj, obj...)
return the nested value according to indices

new_array = ["arr1spot1", ["arr2spot1", "arr2spot2", ["arr3spot1", "arr3spot2", "arr3spot3"]]]
new_array.dig(0)
  => "arr1spot1"
new_array.dig(1)
  => ["arr2spot1", "arr2spot2", ["arr3spot1", "arr3spot2", "arr3spot3"]]
new_array.dig(1, 1)
  => "arr2spot2"
new_array.dig(1, 1, 1)
  => TypeError: String does not have #dig method

----------

.drop(n)
.take(n)
return remaining elements after first n have been dropped

new_array = [1, 2, 3, 4, 5]
new_array.drop(3)
  => [4, 5]
new_array = [1, 2, 3, 4, 5]
new_array.take(3)
  => [4, 5]

----------

.drop_while {|element| first false element}
.take_while {|element| first false element}

new_array = [1, 2, 3, 4, 5]
new_array.drop_while {|num| num < 2}
  => [2, 3, 4, 5]
new_array = [1, 2, 3, 4, 5]
new_array.take_while {|num| num < 2}
  => [2, 3, 4, 5]

----------

.each {|element| element in block}
performs block operation on each element, return original array

new_array = [1, 2, 3, 4, 5]
new_array.each {|num| print num + 20}
  2122232425=> [1, 2, 3, 4, 5]

new_array.each do |num|
  print num + 20
end
  2122232425=> [1, 2, 3, 4, 5]

----------

.each_index {|index_num| index_num in block}
performs block operation on index number of each element

new_array = ["jim", "rulez", "jim", "rulez"]
new_array.each_index {|index_num| print index_num + 20}
  20212223=> ["jim", "rulez", "jim", "rulez"]

----------

.empty?
return true if array is empty

new_array = []
new_array.empty?
  => true
another_array = ["jim", "rulez", "jim", "rulez"]
another_array.empty?
  => false

----------

.eql?(other_ary)
return true if the two arrays are equal

new_array = [1, 2, 3, 4, 5]
new_array.eql?([1, 2, 3, 4, 5])
  => true
new_array.eql?([2, 3, 4, 5, 6])
  => false

----------

.fetch(index)
.fetch(index, default_value)
.fetch (index) {|return_value| return_value if invalid}
with one argument, this return element at index number
with two arguments, this sets a default value if index is out of range
with one argument and a block, return value in block after iterating over element

new_array = [1, 2, 3, 4, 5]
new_array.fetch(1)
  => 2
new_array.fetch(5, "nothing here")
  => "nothing here"
new_array.fetch(5) {|element| puts "#{element} is out of range"}
  5 is out of range => nil

----------

.fill

#TODO

----------

.find_index(obj)
.find_index {|element| element in block}
.find_index

return the index of the first object where object == element
with a block, return the index of the first elemetn that is true
reutrn an enumerator wihtout a block or argument

new_array = [1, 2, 3, 4, 5]
new_array.find_index(0)
  => nil
new_array.find_index(1)
  => 0
new_array.find_index(2)
  => 1
another_array = ["jim", "rulez", "and", "you", "fools"]
another_array.find_index(0)
  => nil
another_array.find_index(1)
  => nil
another_array.find_index("and")
  => 2
new_array.find_index {|num| num < 3}
  => 0
new_array.find_index
  => #<Enumerator: [1, 2, 3, 4, 5]:find_index>

----------

.first
.first(n)
return first element of the array
with one argument, return first n elements of the array

new_array = [1, 2, 3, 4, 5]
new_array.first
  => 1
new_array.first(3)
  => [1, 2, 3]
another_array = []
another_array.first
  => nil
another_array.first(3)
  => []

----------

.flatten
.flatten(level)
turn nested arrays into single array with recursion, returns new array
with one argument, determines the level of recursion

arr1 = [1, 2]
arr2 = [[3, 4], 5]
arr3 = [6, 7]
arr4 = [arr1, arr2, arr3, 8, 9, 10]
arr4.flatten
  => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
arr4.flatten(1)
  => [1, 2, [3, 4], 5, 6, 7, 8, 9, 10]
arr4.flatten(3)
  => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

----------





























#
