ohash
=====

* http://github.com/karottenreibe/ohash

Description
-----------

OpenHash (short: ohash) is a simple, enhanced hash structure with the direct
member access of OpenStruct, but without all the restrictions.

Synopsis
--------

    require 'rubygems'
    require 'ohash'

    o = OpenHash.new({:foo => 12})
    o.foo  #=> 12

    o[:foo] #=> 12

    o.bar = 42
    o.bar  #=> 42

    o.merge!({:goo => 23})
    o.goo  #=> 23

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

