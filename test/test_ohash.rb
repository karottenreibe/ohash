require 'ohash'
require 'bacon'

describe 'An OpenHash' do

    before do
        @o = OpenHash.new
        @the_family = {:mister => :apple, :misses => :plum}
    end

    it 'should call hash functions' do
        @o._merge!(@the_family)

        @o.to_hash.should.be == @the_family
        @o._keys.should.be == [:mister, :misses]
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

