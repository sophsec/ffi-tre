require 'tre-ffi/typedefs'

require 'ffi'

module FFI
  module TRE
    extend FFI::Library

    ffi_lib 'tre'

    attach_function :tre_regcomp, [:pointer, :pointer, :int], :int
    attach_function :tre_regncomp, [:pointer, :pointer, :size_t, :int], :int
    attach_function :tre_regwcomp, [:pointer, :pointer, :int], :int
    attach_function :tre_regwncomp, [:pointer, :pointer, :size_t, :int], :int
    attach_function :tre_regfree, [:pointer], :void
  end
end
