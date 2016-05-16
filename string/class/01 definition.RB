DEFINITION

An arbitrary collection of bytes, though it is mostly used for characters.

----------

!
methods that are followed by ! destroy and replace the object
  methods that do not have this return a new string

----------

PUBLIC CLASS METHODS

CREATE

----------

new(obj)
creates new String

String.new("Supernintendo Chalmers")
  => "Supernintendo Chalmers"

----------

try_convert(obj)
uses .to_s on obj, trying to convert into an object
  if .to_s fails for any reason, returns nil

String.try_convert("string")
  => "string"
String.try_convert(5)
  => nil
whatever = "whatever"
whatever.try_convert
  NoMethodError: undefined method 'try_convert' for "whatever":String

----------

PUBLIC INSTANCE METHODS

string % argument

#TODO

----------

.*
string * integer
copy String integer times

new_string = "String it up!"
new_string * 3
  => "String it up!String it up!String it up!"

----------

.+
string + other_string
concatentate string

new_string = "jim"
new_string + "rulez"
  => "jimrulez"

----------

+string => string(mutable)

#TODO

----------

-string => string(mutable)

#TODO

----------

<<
shovel
concatenate integer, string or object onto string
if an integer follows the shovel operator, it is a codepoint
  codepoint: Unicode, probably
  #TODO

new_string = "Can I kick it?"
new_string << " Yes you can."
  => "Can I kick it? Yes you can."

----------

<=>
string <=> other_object
compare two strings or objects
returns -1, 0 or 1, or nil if two objects cannot be compared
  -1 is less than, 0 is equal to, and 1 is greater than
if two strings are of different size but match up to the shortest length,
  the longer string is considered greater

new_string = "jim rulez"
another_string = "jim rulez"
omg_another = "JIM RULEZ"
yet_another = "jim rulez, yeah"
new_string <=> another_string
  => 0
new_string <=> omg_another
  => 1
new_string <=> yet_another
  => -1

----------

==
string == object
return true if string is the same as object
if object is not an instance of String but responds to .to_string, the two
  strings are comapred using ===
for objects of any Class, == is the same as .equal? because it compares the values
  as they exist in the hash key

new_string = "Tyrion is a Lannister."
another_string = 'Tyrion is a Lannister.'
yet_another = "Tyrion is a Lannister"
num_string = "5"
num_string_2 = 5
new_string == another_string
  => true
new_string == yet_another
  => true
num_string == num_string_2
  => false

----------

===
string === object
return true if string is same case as object in if/when cases

case foo
  when bar;  p 'do something'
end

if bar === foo
  p 'do something'
end

----------

=~

#TODO

----------

string[index]
string[start, length]
string[range]
string[regexp]
string[regexp, capture]
string[match_string]
return object at item index
return objects at start index of length
return objects in range
return matching portion of regexp
return MatchData if capture is second argument
return string that occurs in string if match_string is given

got_string = "A new king rises in the North; Khaleesi prepares the Khal's funeral pyre."
got_string[5]
  => " "
got_string[5, 10]
  => " king rise"
got_string[5..20]
  => " king rises in t"

----------

string[fixnum] = new_string
string[fixnum, fixnum] = new_string
string[range] = aString
string[regexp] = new_string
string[regexp, fixnum] = new_string
string[regexp, name] = new_string
string[other_string] = new_string
replace elements in a string

new_string = "John Snow leads the Night's Watch."
new_string[3] = "Oh, geez."
  => "Oh, geez."
  new_string => "JohOh, geez. Snow leads the Night's Watch."

----------

.ascii_only?
return true with a string that is only of ASCII characters

new_string = "abc"
new_string.ascii_only?
  => true
"abc\u{6666}".force_encoding("UTF-8").ascii_only?
  => false

----------

b

#TODO

----------

.bytes
.each_byte.to_a
return array of bytes in string

got_string = "Man, Joffrey is not a good king."
got_string.bytes
  => [
        77, 97, 110, 44, 32, 74, 111, 102, 102, 114, 101, 121, 32, 105,
        115, 32, 110, 111, 116, 32, 97, 32, 103, 111, 111, 100, 32, 107, 105,
        110, 103, 46
      ]

----------

.bytesize
return length of string in bytes

got_string = "Man, Joffrety is not a good king."
got_string.bytesize
  => 32

----------

.byteslice(fixnum)
.byteslice(fixnum, fixnum)
.byteslice(range)

#TODO

----------

.capitalize
capitalize only the first letter of a string, lowercasing every other letter

new_string = "PeNGuIN off DOOm"
new_string.capitalize
=> "Penguin off doom"
  new_string => "PeNGuIN off DOOm"

 ----------

.capitalize!
destructively capitalize only the first letter of a string, lowercasing every other letter

new_string = "PeNGuIN off DOOm"
new_string.capitalize!
=> "Penguin off doom"
 new_string => "Penguin off doom"

----------

.casecmp(other_string)
case-insensitive version of <=>
return 1, 0 or -1 if two objects are greater, equal or less than

got_string = "HBO Now is pretty great, though."
got_string.casecmp("hbo now is pretty great, though.")
  => 0

----------

.center(width)
.center(width, padding)
center string in width
if string is longer than width, returns string of length string
if wideth is longer than string, returns string centered in width with padding on either side

got_string = "Everything is awful in Westeros."
got_string.center(50)
  => "         Everything is awful in Westeros.         "
got_string.center(50, "ba-da-bahn-ba")
  => "ba-da-bahEverything is awful in Westeros.ba-da-bah"

----------

.chars
.each_char.to_a
return array of characters in string

new_string = "jim rulez"
new_string.chars
=> ["j", "i", "m", " ", "r", "u", "l", "e", "z"]

----------































#
