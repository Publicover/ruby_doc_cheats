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
