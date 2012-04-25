require 'ffi'

module FFI
  module TRE
    class RegAproxParams < FFI::Struct

      layout :nmatch, :size_t,
             :pmatch, :pointer,
             :cost, :int,
             :num_ins, :int,
             :num_del, :int,
             :num_subst, :int

    end
  end
end
