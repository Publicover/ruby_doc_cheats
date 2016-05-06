ITERATE OVER ELEMENT

.each method:
iterates each element through the block. leaving original array intact

new_array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
new_array.each {|element| print element + 20}
  20212223242526272829=> [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
new_array.each do |element|
  print element + 20
end
  20212223242526272829=> [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

.reverse_each method:
iterates each element throught the block in reverse order, leaving original array intact

new_array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
new_array.reverse_each {|element| print element + 20}
  29282726252423222120=> [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

.map method:
modifies array based on passing each element through the block

new_array = [1, 2, 3, 4, 5]
new_array.map {|element| element + 20}
  => [21, 22, 23, 24, 25]
new_array.map {|element| element.to_s + "wutwut"}
  => ["1wutwut", "2wutwut", "3wutwut", "4wutwut", "5wutwut"]
  new_array => [1, 2, 3, 4, 5]
