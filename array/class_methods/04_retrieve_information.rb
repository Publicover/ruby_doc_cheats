RETRIEVE INFORMATION

.length method:
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
