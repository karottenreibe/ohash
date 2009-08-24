ohash
=====

*   http://github.com/karottenreibe/ohash

Description
-----------

OpenHash (short: ohash) is a simple, enhanced hash structure with the direct
member access of OpenStruct, but without all the restrictions.
It also features some niceties as found in Mash
(http://www.intridea.com/2008/4/12/mash-mocking-hash-for-total-poser-objects?blog=company).

Synopsis
--------

    require 'rubygems'
    require 'ohash'

    o = OpenHash.new({:foo => 12})
    o = OpenHash.new
 
* Access to hash methods
 
    o._merge!({:foo => 12, :bar => 22})
    o._keys         #=> [:foo, :bar]
 
* Member access
 
    o.foo == 12     #=> true
    o.foo = 33
    o[:foo] == 12   #=> false
 
* Membership test
 
    o.foo?          #=> true
    o.bar?          #=> true
    o.bla?          #=> false
 
* Quick population with sub hashes
 
    o.bla!.goo = 23
    o.bla!.yadda!.rofl = 42
    o.bla?          #=> true
    o.bla?.goo?     #=> true
 

Installing
----------

*   sudo gem install karottenreibe-ohash --source http://gems.github.com
*   sudo gem install ohash

License
-------

/*---- DON'T PANIC License 1.1 -----------

  Don't panic, this piece of software is
  free, i.e. you can do with it whatever
  you like, including, but not limited to:
  
    * using it
    * copying it
    * (re)distributing it
    * burning/burying/shredding it
    * eating it
    * using it to obtain world domination
    * and ignoring it
  
  Under the sole condition that you
  
    * CONSIDER buying the author a strong
      brownian motion producer, say a nice
      hot cup of tea, should you ever meet
      him in person.

----------------------------------------*/

