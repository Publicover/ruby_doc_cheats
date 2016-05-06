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

.uniq method:
.uniq returns array of unique elements
.uniq! is destructive

new_array = ["jim", "jim", "publicover", 3, "jim", "dillehunt"]
new_array.uniq
  => ["jim", "publicover", 3, "dillehunt"]
  new_array => ["jim", "jim", "publicover", 3, "jim", "dillehunt"]
new_array.uniq!
  => ["jim", "publicover", 3, "dillehunt"]
  new_array => ["jim", "publicover", 3, "dillehunt"]
