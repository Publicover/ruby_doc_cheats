ACCESS

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
