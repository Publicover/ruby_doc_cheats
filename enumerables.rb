all? {|object| operation including object }

Array true
Enumerable true
insert block? true

asks the array if a certain condiditon is true for all elements

one_array = [1, 2, 3, 4, 5]
one_array.all? { |x| x < 100 }
  => true
one_array.all? { |x| x < 3 }
  => false

if you do not follow it with a block, ruby will return true unless something is false or nil

two_array = [false, true, nil]
two_array.all?
  => false
three_array = [true, 4 < 10]
three_array.all?
  => true

----------

any? {|object| operation including object }

Array true
Enumerable true
insert block? true

asks the array if a certain condidtion is true for any element

one_array = [1, 2, 3, 4, 5]
one_array.any? { |x| x < 4 }
  => true
one_array.any? { |x| x > 10 }
  => false

if you do not follow it with a block, ruby will return true if an element is true

two_array = [false, true, nil]
two_array.any?
  => true
three_array = [true, 4 < 10]
three_array.any?
  => true
four_array = [1, 2, 3, 4]
four_array.any?
  => true

----------

chunk

#TODO

----------

chunk_while

#TODO

----------

collect {|object| operation including object }

Array true
Enumerable true
insert block? true

runs the block once on each element of the array

if you do not follow it with a block, ruby will return an enumerator

one_array = [1, 2, 3, 4, 5]
one_array.collect {|i| i + 1 }
  => [2, 3, 4, 5, 6]
one_array.collect
  => <Enumerator: [1, 2, 3, 4]:collect>
two_array = [5, 6, 7, 8]
two_array.collect {"farts"}
  => ["farts", "farts", "farts", "farts"]

Literally the exact same as .map--collect is an alias

----------

collect_concat {|object| operation including object }

Array true
Enumerable true
insert block? true

gives you a new array with the concatenated results of running the block on each element

if you do not follow it with a block, ruby will return an enumerator

one_array = [1, 2, 3, 4, 5]
one_array.collect_concat {|i| [i, "farts", -i]}
  => [1, "farts", -1, 2, "farts", -2, 3, "farts", -3, 4, "farts", -4, 5, "farts", -5]
two_array = ["jim", "dana"]
two_array.collect_concat {|i| i + "lol"}
  => ["jimlol", "danalol"]

Literally the exact same as flat_map--collect_concat is an alias

----------

count
count(thing)
count {|object| operation including object }

Array true
Enumerable true
insert block? true

counts the things in an array
with parens, counts the number of things in the paren
with block, counts the number of things in the block that are true

one_array = [10, 20, 30, 40, 50]
one_array.count
  => 5
one_array.count(30)
  => 1
one_array.count {|i| i % 20 == 0}
  => 2

----------























#















#
