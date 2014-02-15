
-  ruby


## Basics

To import modules:

require 'mechanize'



To install a new package:

gem install rails --version 3.0.1


To update the gem package manager:

gem update --system


Symbols are immutable strings:



symb = :rails
:rails.to_s



Print



puts "name"  -  print with \n
print "name" -  print without \n
p :name  -  equal to puts :name.inspect




The value nil correspond to None in python.

Array:



x = [1,'two',:three]
x[1] == 'two'
x[0..2] == [1, 'two']
x.length == 3
a << 7 -  append 7 to a
%w[0 3 4 5fsad] -  create a array of string




Ranges:



0..9
(0..9).to_a
('a'..'e').to_a
=> ["a", "b", "c", "e"]



Hash:



w = {'a'=>1, :b=>[2,3]}
w.keys == ['a', :b]
w = Hash.new(0) -  default value for nonexistring key
w[:foo] -  it returns 0




Methods:



def foo(x,y=10)
return [x, y+1]  -  last exp returned as result.
end




if and while:



if cond
stat
elsif
stat
else
stat
end

while cond
stat
end





## string &amp; regular expression

All this types are available:


"string", %Q{string},'string',%q{string}


The concatenation a=41; "The answer is - {a+1}"

Useful string methods:



s.chomp('s')   -  wipe out the last char
s.gsub(//, '')  -  substitute the occurrence with a new string




All this types are available for regex:


/(.*)$/i, %r{(.*)$}i, Regexp.new('(.*)$', Regexp::IGNORECASE)


Matching regexp: "fox@berkeley.EDU" ~= /(.*)@(.*)\.edu$/i
return false if no match, otherwise return true and $1..$n catch the groups.

Replacing a substring:
s.gsub(/s$/, '')


## conversions &amp; more




l.to_a -  convert an Enumerable in Array
s.to_s -  convert in string
s.to_sym -  convert in symbol






## method call and operators" >
To get all methods of an object:

57.methods


Every operator is a method call:

1+2 correspond to 1.send(:+, 2)



To append element into a list:

y << [6,7] 




## oop

Creation of an object: 

ClassName.new(...)


Instance variable: 

@variable


Class (static) variable: 

@@variable


Class method:



def self.bank_name
@@bank_name
end







## metaprogramming

Generate accessor methods:

attr_accessor :balance


Add methods REOPENING a class:



class Numeric
def euros
self * 1.3
end



If a method doesn't exist ruby call a special method:



class Numeric
def method_missing(method_id)
if method_id.to_s == 'euro'
self.send('euros')
else
super
end
end
end


-  Or in this way useful for both module and class
Enumerable.class_eval do
def palindrome?
return (self.is_a? Array) ? self.reverse == self : self.to_a.palindrome?
end
end





## iterator

Loops:



-  Possible way to iterate across the elements
list.each do |string|
puts string
end

for i in (1..10) do
puts i
end

1.upto 10 do |num|
puts num
end

3.times{print "ciao"}

-  Map is the same of map in python
x.map do |f|
fruit.reverse
end.sort

-  Select correspond the same of filter in python
x.select do |el|
el =~ /^[aeuio]/i
end

x.collect {|f| f.include?('e')}
x.any?{|f| f.lenght>5}



Hash



hsh.each_key do |k| ... end
hsh.each_pair do |k,v| ... end





## duck typing

Similar to interface in Java:



class Account
include Comparable
def <=>(other)
self.balance <=> other.balance
end
end




Enumerable respond a lot of methods!!: each, all? any?
collect, find, include?, inject, map, partition,...



## yield

It's the same concept as in python.



-  yield function is:
def around_stuff
..before..
yield
..after..
end

-  in user code
...
around_stuff do
my_stuff()
end
-  so yield will be replaced with the function my_stuff()






