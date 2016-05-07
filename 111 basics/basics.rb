block
some methods require you to pass a block
  which means you need to set up the definition of what you are asking for
    EX: array_of_numbers_less_than_five { |x| x < 5 }
      => true
    EX: array_of_numbers_less_than_five { |x| x > 2 }
      => false
    EX: array_of_numbers_less_than_five { |x| x > 2 }
      => true
