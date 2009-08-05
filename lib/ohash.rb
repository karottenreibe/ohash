
#
# Since I personally hate OpenStructs, this is a
# Hash with the same features, but it's mergeable etc...
#
class OpenHash < Hash

    def method_missing meth, *args
        method = meth.to_s

        if method =~ %r{.+=$}
            super unless args.length == 1
            self[method[0...-1].to_sym] = args.first
        else
            self[meth]
        end
    end

end

