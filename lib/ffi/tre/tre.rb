require 'ffi/tre/reg_aprox_params'
require 'ffi/tre/reg_aprox_match'

require 'ffi'

module FFI
  module TRE
    extend FFI::Library

    ffi_lib 'tre'

    enum :reg_errcode, [
      :reg_ok,
      :reg_nomatch,
      :reg_badpat,
      :reg_ecollate,
      :reg_ectype,
      :reg_eescape,
      :reg_esubreg,
      :reg_ebrack,
      :reg_eparen,
      :reg_ebrace,
      :reg_badbr,
      :reg_espace,
      :reg_badrpt
    ]

    REG_EXTENDED = 1
    REG_ICASE = (REG_EXTENDED << 1)
    REG_NEWLINE = (REG_ICASE << 1)
    REG_NOSUB = (REG_NEWLINE << 1)

    REG_BASE = 0
    REG_LITERAL = (REG_NOSUB << 1)
    REG_RIGHT_ASSOC = (REG_LITERAL << 1)
    REG_UNGREEDY = (REG_RIGHT_ASSOC << 1)

    REG_NOTBOL = 1
    REG_NOTEOL = (REG_NOTBOL << 1)

    REG_APPROX_MATCHER = (REG_NOTEOL << 1)
    REG_BACKTRACKING_MATCHER = (REG_APPROX_MATCHER << 1)

    RE_DUP_MAX = 255

    attach_function :tre_regcomp, [:pointer, :pointer, :int], :int
    attach_function :tre_regncomp, [:pointer, :pointer, :size_t, :int], :int
    attach_function :tre_regerror, [:int, :pointer, :pointer, :size_t], :size_t
    attach_function :tre_regfree, [:pointer], :void

    begin
      attach_function :tre_regwcomp, [:pointer, :pointer, :int], :int
      attach_function :tre_regwncomp, [:pointer, :pointer, :size_t, :int], :int
    rescue FFI::NotFoundError
      warn "Warning: libtre was not compiled with wchar support"
    end

    begin
      attach_function :tre_regaexec, [:pointer, :pointer, :pointer, RegAproxParams, :int], :int
      attach_function :tre_reganexec, [:pointer, :pointer, :size_t, :pointer, RegAproxParams, :int], :int

      begin
        attach_function :tre_regawexec, [:pointer, :pointer, :pointer, RegAproxParams, :int], :int
        attach_function :tre_regawnexec, [:pointer, :pointer, :size_t, :pointer, RegAproxParams, :int], :int
      rescue FFI::NotFoundError
        warn "Warning: libtre was not compiled with wchar support"
      end

      attach_function :tre_regaparams_default, [:pointer], :void
    rescue FFI::NotFoundError
      warn "Warning: libtre was not compiled with approximate matching support"
    end
  end
end
