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


















#
