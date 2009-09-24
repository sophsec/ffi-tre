require 'ffi'

module FFI
  module TRE
    class RegAproxParams < FFI::Struct

      layout :cost_ins, :int,
             :cost_del, :int,
             :cost_subst, :int,
             :max_cost, :int,
             :max_ins, :int,
             :max_del, :int,
             :max_subst, :int,
             :max_err, :int

    end
  end
end
