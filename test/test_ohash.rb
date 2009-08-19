require 'ohash'
require 'bacon'

describe 'An OpenHash' do

    before do
        @o = OpenHash.new
        @the_family = {:mister => :apple, :misses => :plum}
    end

    it 'should have the same creation methods as hash' do
        seed = {:grandgrandpa => :grape, :grandgrandma => :strawberry}
        klass_seeded = OpenHash[seed]
        new_seeded = OpenHash.new(seed)

        klass_seeded.class.should.be == OpenHash
        klass_seeded.to_hash.should.be == seed

        new_seeded.class.should.be == OpenHash
        new_seeded.to_hash.should.be.empty
        new_seeded._default.should.be == seed
    end

    it 'should call hash functions' do
        @o._merge!(@the_family)

        @o.to_hash.should.be == @the_family
        @o._keys.should.be == [:mister, :misses]
    end

    it 'should ensure that hash functions return an ohash whenever possible' do
        # only an excerpt
        @o._merge(@the_family).class.should.be == OpenHash
        @o._invert.class.should.be == OpenHash
        @o._reject { false }.class.should.be == OpenHash
        @o._delete_if { false }.class.should.be == OpenHash
        @o._replace(@the_family).class.should.be == OpenHash
    end

    it 'should grant direct member access' do
        @o._merge!(@the_family)
        @o.mister.should.be == :apple

        @o.son = :pineapple
        @o.son.should.be == :pineapple
    end

    it 'should perform the membership test' do
        @o._merge!(@the_family)
        @o.mister?.should.be.true
        @o.misses?.should.be.true
        @o.uncle_leo?.should.be.false
    end

    it 'should populate quickly' do
        @o._merge!(@the_family)
        @o.grandparents!.apple_side!.grandma = :dade
        @o.grandparents?.should.be.true
        @o.grandparents.class.should.be == OpenHash
        @o.grandparents.apple_side?.should.be.true
        @o.grandparents.apple_side.class.should.be == OpenHash
        @o.grandparents.apple_side.grandma?.should.be.true
        @o.grandparents.apple_side.grandma.should.be == :dade
    end

end

