SELECT ELEMENTS

.select method:
.select returns values defined in block
.select! destroys original array and returns values defined in block

new_array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
new_array.select {|element| element < 6}
  => [0, 1, 2, 3, 4, 5]
  new_array => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
new_array.select! {|element| element < 6}
  => [0, 1, 2, 3, 4, 5]
new_array => [0, 1, 2, 3, 4, 5]

.reject method:
.reject returns elements that are false in the block
.reject! destroys original array and returns elements that are false in the block

new_array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
new_array.reject {|element| element < 6}
  => [6, 7, 8, 9]
  new_array => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
new_array.reject! {|element| element < 6}
  => [6, 7, 8, 9]
  new_array => [6, 7, 8, 9]

.drop_while method:
returns elements that are true in the block

new_array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
new_array.drop_while {|element| element < 6}
  => [6, 7, 8, 9]
  new_array => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

.delete_if method:
destroys original array and returns elements false in the block

new_array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
new_array.delete_if {|element| element < 6}
  => [6, 7, 8, 9]
  new_array => [6, 7, 8, 9]

keep_if method:
destorys original array and returns elements true in the block

new_array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
new_array.keep_if {|element| element < 6}
  => [0, 1, 2, 3, 4, 5]
  new_array => [0, 1, 2, 3, 4, 5]
