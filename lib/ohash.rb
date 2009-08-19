require 'delegate'

#
# Since I personally hate OpenStructs, this is a
# Hash with the same features, but it's mergeable etc...
#
# Inspired by Mash:
# http://www.intridea.com/2008/4/12/mash-mocking-hash-for-total-poser-objects?blog=company
#
#   o = OpenHash.new
#
# * Access to hash methods
#
#   o._merge!({:foo => 12, :bar => 22})
#   o._keys         #=> [:foo, :bar]
#
# * Member access
#
#   o.foo == 12     #=> true
#   o.foo = 33
#   o[:foo] == 12   #=> false
#
# * Membership test
#
#   o.foo?          #=> true
#   o.bar?          #=> true
#   o.bla?          #=> false
#
# * Quick population with sub hashes
#
#   o.bla!.goo = 23
#   o.bla!.yadda!.rofl = 42
#   o.bla?          #=> true
#   o.bla?.goo?     #=> true
#
# * Predefined methods
#
#   o.to_s
#   o.inspect
#   o.to_h
#   o.to_hash
#   o.as_hash
#   o.__send__(:something)
#   o.__id__
#   o.class
#
class OpenHash

    # Thank you Jim Weirich (http://onestepback.org/index.cgi/Tech/Ruby/BlankSlate.rdoc)
    instance_methods.each { |m| undef_method m unless m =~ /^__|^is_a?$|^class$/ }

    #
    # Same as for Hash.
    #
    def initialize( *args )
        @hash = Hash.new(*args)
    end

    def to_hash
        @hash.dup
    end

    alias_method :to_h, :to_hash

    #
    # Returns this OpenHash as a simple hash.
    # Modifying the returned hash will modify
    # the original OpenHash as well.
    #
    def as_hash
        @hash
    end

    def to_s
        @hash.to_s
    end

    def inspect
        @hash.inspect
    end

    protected

    #
    # Emulates [...], ...=, ...!, ...?, _... and
    # direct member access methods.
    #
    def method_missing( meth, *args, &block )
        method = meth.to_s

        case method
        when *%w{[] []=}
            @hash.send(meth, *args, &block)
        when %r{^_}
            @hash.send(method[1..-1], *args, &block)
        when %r{.=$}
            super unless args.length == 1
            @hash[method[0...-1].to_sym] = args.first
        when %r{.!$}
            super unless args.empty?
            @hash[method[0...-1].to_sym] ||= OpenHash.new
        when %r{.\?$}
            super unless args.empty?
            @hash.keys.include?(method[0...-1].to_sym)
        else
            @hash[meth]
        end
    end

end

class Hash
    def to_ohash
        OpenHash.new._merge(self)
    end
end

