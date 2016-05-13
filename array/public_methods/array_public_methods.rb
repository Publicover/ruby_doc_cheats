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

.frozen?
return true if array is frozen or temporarily frozen while being sorted

#TODO

----------

.hash
compute a hash-code for array
two arrays with the same content will have the same hash code
  and return .eql? => true

new_array = [1, 2, 3, 4, 5]
new_array.hash
  => -3882442013874083202

----------

.include?(obj)
return true if element is in the array

new_array = [1, 2, 3, 4, 5]
new_array.include?(1)
  => true
new_array.include?(6)
  => false

----------

.index(ob)
.index {|element| block}
return the index of the first value equal to element in array
with a block, return the index of the first element that returns true

new_array = [1, 2, 3, 4, 4, 4]
new_array.index(3)
  => 2
new_array.index {|num| num > 1}
  => 1

----------

.initialize_copy(another_array)
  (THE ABOVE DOES NOT SEEM TO WORK, USE .REPLACE)
.replace
replace contents of array with array in argument

new_array = [1, 2, 3, 4, 5]
new_array.replace([6, 7, 8])
=> [6, 7, 8]
new_array => [6, 7, 8]

----------

.insert(index, obj)
insert element directly before element with the given index
a negative index will count backwards from the end so element is inserted after index

new_array = ["0 index", "1 index", "2 index", "3 index", "4 index"]
new_array.insert(2, "INSERTED ELEMENT")
  => ["0 index", "1 index", "INSERTED ELEMENT", "2 index", "3 index", "4 index"]
new_array.insert(-2, "INSERTED ELEMENT")
  => ["0 index", "1 index", "2 index", "3 index", "INSERTED ELEMENT", "4 index"]

----------

.inspect
.to_s
create a string representation of each element in array

new_array = [1, 2, 3, 4, 5]
new_array.inspect
  => "[1, 2, 3, 4, 5]"
new_array.to_s
  => "[1, 2, 3, 4, 5]"
  new_array.to_s[0] => "["

----------

.join
.join("string")
return a string made of each element in the array
with one argument, inserts obj between each element in the string
new_array = [1, 2, 3, 4, 5]
new_array.join
  => "12345"
new_array.join("WUT")
  => "1WUT2WUT3WUT4WUT5"
new_array.join(5)
  TypeError: no implicit conversion of Fixnum into String

----------

.keep_if {|element| block}
.select! {|element| block}
deletes every element of the array that returns false from the block

new_array = [1, 2, 3, 4, 5]
new_array.keep_if {|num| num < 4}
  => [1, 2, 3]

----------

.last
.last(num)
return the last element in array and returns nil if the array is empty

new_array = [1, 2, 3, 4, 5]
new_array.last
  => 5
new_array.last(3)
  => [3, 4, 5]
new_array.last(30)
  => [1, 2, 3, 4, 5]

----------

.length
return the number of elements in array
alias of .size

new_array = [1, 2, 3, 4, 5]
new_array.length
  => 5

----------

.map {|element| block}
return new array based on block

new_array = [1, 2, 3, 4, 5]
new_array.map {|num| num + 20}
  => [21, 22, 23, 24, 25]
another_array = ["one", "two", "three"]
another_array.map {|element| element.length}
  => [3, 3, 5]

----------

.map! {|element| block}
replace each element in an array with block operation

new_array = [1, 2, 3, 4, 5]
new_array.map! {|num| num + 20}
  => [21, 22, 23, 24, 25]
  new_array => [21, 22, 23, 24, 25]
another_array = ["one", "two", "three"]
another_array.map! {|element| element.length}
  => [3, 3, 5]
  another_array => [3, 3, 5]

----------

.pack

#TODO

----------

.permutation {|element| block}
.permutation(num) {|element| block}
create permutation of each element
if no argument is given, returns all possible permutations
  there is no guarantee that the permutaitons will be listed in a sensible order

new_array = [1, 2, 3]
new_array.permutation(3)
  => #<Enumerator: [1, 2, 3]:permutation(3)>

----------

.pop
.pop(num)
return last element in an array, destroying original array
with one argument, returns array with n elements

new_array = [1, 2, 3, 4, 5]
new_array.pop
  => 5
  new_array => [1, 2, 3, 4]
new_array = [1, 2, 3, 4, 5]
new_array.pop(3)
  => [3, 4, 5]
  new_array = [1, 2]

----------

.product(other_ary)
.product(other_ary) {|element| block}
return array of all combinations of elements from each array
with a block, will yield all combinations and return array instead

 new_array = [1, 2, 3,]
 new_array.product([4, 5])
  => [[1, 4], [1, 5], [2, 4], [2, 5], [3, 4], [3, 5]]
new_array.product([4, 5], [6, 7])
  => [[1, 4, 6], [1, 4, 7], [1, 5, 6], [1, 5, 7], [2, 4, 6], [2, 4, 7], [2, 5, 6], [2, 5, 7], [3, 4, 6], [3, 4, 7], [3, 5, 6], [3, 5, 7]]
  => [[1, 4, 7], [1, 5, 7], [1, 6, 7], [2, 4, 7], [2, 5, 7], [2, 6, 7], [3, 4, 7], [3, 5, 7], [3, 6, 7]]


----------

.push(obj)
original_array << new_element
add object to the end of the array

new_array = [1, 2, 3,]
new_array.push("WUT")
  => [1, 2, 3, "WUT"]
new_array.push("---", "+++")
  => [1, 2, 3, "WUT", "---", "+++"]
new_array << 6
  => [1, 2, 3, "WUT", "---", "+++", 6]

----------

.rassoc(string)
return the first nested array by using == on the last object

new_array = [[1, 2], [3, 4], [5, 6]]
new_array.rassoc(4)
  => nil
new_array.rassoc("4")
  => nil
another_array = [[1, "one"], [2, "two"], [3, "three"], [3, "three"]]
another_array.rassoc("three")
  => [3, "three"]

----------

.reject {|element| block}
return new array of elements of each item that returns false from the block

new_array = [1, 2, 3, 4, 5]
new_array.reject {|num| num > 3}
  => [1, 2, 3]

----------

.reject! {|element| block}
delete element of array that does not return false from the block

new_array = [1, 2, 3, 4, 5]
new_array.reject! {|num| num > 3}
=> [1, 2, 3]
new_array => [1, 2, 3]

----------

.repeated_combination(num) {|element| block}

#TODO

----------

.repeated_permutation

#TODO

----------

.replace(other_ary)
replace all elements of original array with array in argument

new_array = [1, 2, 3, 4, 5]
new_array.replace([6, 7, 8])
  => [6, 7, 8]
  new_array => [6, 7, 8]

----------

.reverse
reverse order of elements in an array

new_array = [1, 2, 3, 4, 5]
new_array.reverse
  => [5, 4, 3, 2, 1]

----------

.reverse!
replace elements in array with same elements in reverse order

new_array = [1, 2, 3, 4, 5]
new_array.reverse
  => [5, 4, 3, 2, 1]
  new_array => [5, 4, 3, 2, 1]

----------

.reverse_each {|element| block}
perform block operation in reverse order
words exactly like .each

new_array = [1, 2, 3, 4, 5]
new_array.reverse_each {|num| print num}
  54321=> [1, 2, 3, 4, 5]

----------

.rindex(obj)
.rindex {|element| block}
return the index of the last element in the array == the argument
with a block, return the index of the last element to return true

new_array = [1, "one", 3, "three", 5, "three"]
new_array.rindex("three")
  => 5
new_array.rindex {|string| string == "three"}
  => 5

----------

.rotate(count)
return new array by rotating the array until the argument is the first in the array
the default count is 1

new_array = [1, 2, 3, 4, 5]
new_array.rotate
  => [2, 3, 4, 5, 1]
new_array.rotate(2)
  => [3, 4, 5, 1, 2]

----------

.rotate!(count)
replace elements in array with rotated values according to the argument

new_array = [1, 2, 3, 4, 5]
new_array.rotate!
=> [2, 3, 4, 5, 1]
  new_array => [2, 3, 4, 5, 1]
new_array = [1, 2, 3, 4, 5]
new_array.rotate!(3)
=> [4, 5, 1, 2, 3]
  new_array => [4, 5, 1, 2, 3]

----------

.sample
.sample(num)
randomly choose an element from the array
with one argument, randomly choose n elements from the array

new_array = [1, 2, 3, 4, 5]
new_array.sample
  => 1
new_array.sample
  => 4
new_array.sample(3)
  => [1, 2, 4]
new_array.sample(3)
  => [1, 3, 5]

----------

.select {|element| block}
return new array of elements that return true from the block

new_array = [1, 2, 3, 4, 5]
new_array.select {|num| num < 3}
  => [1, 2]

----------

.select! {|element| block}
replace elements in the array that return true from the block

new_array = [1, 2, 3, 4, 5]
new_array.select! {|num| num < 3}
=> [1, 2]
new_array => [1, 2]

----------

.shift
.shift(num)
destructively delete first item of the array
with one argument, destructively deletes first n elements of the array

new_array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
new_array.shift
  => 1
  new_array => [2, 3, 4, 5, 6, 7, 8, 9]
new_array.shift(4)
  => [2, 3, 4, 5]
  new_array => [6, 7, 8, 9]

----------

.shuffle
.shuffl(random: Random.new(1))
randomly mix elements of an array
with an argument including Random class, use the same random number for each method call

new_array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
new_array.shuffle
  => [1, 5, 9, 8, 6, 2, 3, 7, 4]
  => [2, 9, 3, 6, 8, 5, 1, 4, 7]
  => [2, 3, 7, 1, 5, 4, 9, 8, 6]
  new_array => [1, 2, 3, 4, 5, 6, 7, 8, 9]
new_array.shuffle(random: Random.new(1))
  => [9, 3, 7, 8, 2, 1, 5, 4, 6]
  => [9, 3, 7, 8, 2, 1, 5, 4, 6]
  => [9, 3, 7, 8, 2, 1, 5, 4, 6]

----------

.shuffle!
destructively and randomly mix elements of an array

new_array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
new_array.shuffle!
  => [1, 7, 2, 6, 5, 9, 8, 3, 4]
  => [2, 1, 3, 5, 4, 9, 6, 8, 7]
  => [6, 9, 8, 4, 5, 1, 3, 7, 2]
  new_array => [6, 9, 8, 4, 5, 1, 3, 7, 2]

----------

.size
alias of .length
return the number of elements in array

new_array = [1, 2, 3, 4, 5]
new_array.size
  => 5

----------

.slice(index)
.slice(start, length)
.slice(range)

return element at index
with two arguments, returns elements starting at first argument of length second argument
with a range, returns elements included in the range

new_array = [1, 2, 3, 4, 5]
new_array.slice(2)
  => 3
new_array.slice(2, 3)
  => [3, 4, 5]
new_array.slice(2..4)
  => [3, 4, 5]

----------

.slice!(index)
.slice!(start, length)
.slice!(range)
delete element at index
with two arguments, delete elements starting at first argument of length second element
with range, delete elements included in range

new_array = [1, 2, 3, 4, 5]
new_array.slice!(2)
=> 3
  new_array => [1, 2, 4, 5]

----------

.sort
.sort {|a, b| block}
sort array by the <=> operator
passing a block allows you to use reverse alphabetical order

new_array = [5, 1, 4, 2, 3]
new_array.sort
  => [1, 2, 3, 4, 5]
new_array.sort {|a, b| b <=> a}
  => [5, 4, 3, 2, 1]
new_array.sort {|a, b| b > a}
  NoMethodError: undefined method '>' for true:TrueClass

----------

.sort!
.sort! {|a, b| block}
destructively sort array with <=> operator
passing a block allows you to use reverse alphabetical order

new_array = ["Homer", "Marge", "Bart", "Lisa", "Maggie"]
new_array.sort!
  => ["Bart", "Homer", "Lisa", "Maggie", "Marge"]
new_array.sort! {|a, b| b <=> a}
  => ["Marge", "Maggie", "Lisa", "Homer", "Bart"]

----------

sort_by! {|obj| block}
destructively sort elements in array according to block

new_array = ["Homer", "Marge", "Bart", "Lisa", "Maggie"]
new_array.sort_by! {|name| name.length}
  => ["Bart", "Lisa", "Homer", "Marge", "Maggie"]

----------

.take(num)
return first n elements of an array
using a negative number returns ArgumentError

new_array = [1, 2, 3, 4, 5]
new_array.take(3)
  => [1, 2, 3]

----------

.take_while(num)
return all elements before an element returns false from the block

new_array = [2, 3, 4, 5]
new_array.take_while {|element| element.even?}
  => [2]

----------

.to_a
.to_ary
change into array

new_range = (1..10)
new_range.to_a
  => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

----------

.to_h
interpret array as key value pairs

new_array = [[1, 2], [3, 4], [5, 6]]
new_array.to_h
  => {1=>2, 3=>4, 5=>6}
another_array = [1, 2, 3, 4, 5, 6]
another_array.to_h
  TypeError: wrong element type Fixnum at 0 (expected array)

----------

.to_s
alias for .inspect
changes array into string

new_array = [[1, 2], [3, 4], [5, 6]]
new_array.to_s
  => "[[1, 2], [3, 4], [5, 6]]"
new_array = [1, 2, 3, 4, 5]
new_array.to_s
  => "[1, 2, 3, 4, 5]"

----------

.uniq
.uniq {|item| ...}
return array with all duplicate items deleted

new_array = [1, 1, 2, 2, 3, 3]
new_array.uniq
  => [1, 2, 3]
new_array.uniq {|item| item + 1}
  => [1, 2, 3]

----------

.uniq!
.uniq! {|item| ...}
delete all duplicate elements from array

new_array = [1, 1, 2, 2, 3, 3]
new_array.uniq!
  => [1, 2, 3]
  new_array => => [1, 2, 3]

----------

.unshift(obj)
add elements to the beginning of array

new_array = [1, 2, 3, 4, 5]
new_array.unshift("dragons")
  => ["dragons", 1, 2, 3, 4, 5]
new_array.unshift("misery", "sadness", "Westeros")
  => ["misery", "sadness", "Westeros", "dragons", 1, 2, 3, 4, 5]

----------

.values_at(selector)
return array according to selector

new_array = [1, 2, 3, 4, 5]
new_array.values_at(3)
  => [4]
new_array.values_at(0, 2)
  => [1, 3]
new_array.values_at(0..2, 3..4)
  => [1, 2, 3, 4, 5]

----------

.zip(argument, ...)
convert arguments into arrays then merges each element with corresponding elements from each argument
this creates array with size of one more than the number of arguments
nil is returned for each element that does not fit the size of the initial array

a_arr = [1, 2, 3]
b_arr = [4, 5, 6]
b_arr.zip(a_arr)
  => [[4, 1], [5, 2], [6, 3]]
[7, 8, 9].zip(a_arr, b_arr)
  => [[7, 1, 4], [8, 2, 5], [9, 3, 6]]
[10].zip(a_arr, b_arr)
  => [[10, 1, 4]]
a_arr.zip(["one", "two"], ["three"])
  => [[1, "one", "three"], [2, "two", nil], [3, nil, nil]]

----------

|
array | other_ary
return new array by joining two arrays, excluding duplicates and preserving the order from the original array
also called "set Union"
see also .uniq

new_array = [1, 2, 3, 4, 5]
another_array = [9, 3, 8, 2, 7, 5, 6]
new_array | another_array
  => [1, 2, 3, 4, 5, 9, 8, 7, 6]

----------












#
