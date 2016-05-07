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













#
