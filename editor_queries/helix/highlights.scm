; See: https://docs.helix-editor.com/master/themes.html#syntax-highlighting
; -------------------------------------------------------------------------
;
; variable
; --------
(identifier) @variable

(destruct_bind
  name: (identifier) @comment.line
  bind: (identifier) @variable)

; variable.builtin
; ----------------
(self) @variable.builtin

; variable.parameter
; ------------------
(parameter
  name: (identifier) @variable.parameter)

; variable.other.member
; ---------------------
(storage_variable
  name: (identifier) @variable.other.member)

(field
  name: (identifier) @variable.other.member)

(field_access_expression
  name: (identifier) @variable.other.member)

(instance_argument
  name: (identifier) @variable.other.member)

; punctuation.delimiter
; ---------------------
[
  ";"
  ","
  "."
  ":"
  "?"
] @punctuation.delimiter

; punctuation.bracket
; -------------------
[
  "("
  ")"
  "{"
  "}"
] @punctuation.bracket

; operator
; --------
[
  "~"
  "-"
  "-="
  "+"
  "+="
  "*"
  "*="
  "/"
  "/="
  "%"
  "%="
  "="
  "=="
  "!"
  "!="
  "!!"
  "<"
  "<="
  "<<"
  "<<="
  ">"
  ">="
  ">>"
  ">>="
  "&"
  "&="
  "|"
  "|="
  "^"
  "^="
  "&&"
  "&&="
  "||"
  "||="
  "->"
  ".."
] @operator

; constructor
; -----------
(instance_expression
  name: (identifier) @constructor)

(initOf
  name: (identifier) @constructor)

(codeOf
  name: (identifier) @constructor)

; type
; ----
(type_identifier) @type

; type.builtin
; ------------
(tlb_serialization
  "as" @keyword
  type: (identifier) @type)

(tlb_serialization
  type: (identifier) @type.builtin
  (#match? @type.builtin
    "^(coins|remaining|bytes32|bytes64|int257|u?int(?:2[0-5][0-6]|1[0-9][0-9]|[1-9][0-9]?))$"))

((type_identifier) @type.builtin
  (#any-of? @type.builtin "Address" "Bool" "Builder" "Cell" "Int" "Slice" "String" "StringBuilder"))

(map_type
  "map" @type.builtin
  "<" @punctuation.bracket
  ">" @punctuation.bracket)

(set_type
  "set" @type.builtin
  "<" @punctuation.bracket
  ">" @punctuation.bracket)

(bounced_type
  "bounced" @type.builtin
  "<" @punctuation.bracket
  ">" @punctuation.bracket)

(generic_parameter_list
  "<" @punctuation.bracket
  ">" @punctuation.bracket)

; string
; ------
(string) @string

; string.special.path
; -------------------
(import
  name: (string) @string.special.path)

; constant
; --------
(global_constant
  name: (identifier) @constant)

(storage_constant
  name: (identifier) @constant)

; constant.character.escape
; -------------------------
(escape_sequence) @constant.character.escape

; constant.numeric.integer
; ------------------------
(integer) @constant.numeric.integer

; constant.builtin
; ----------------
((identifier) @constant.builtin
  (#any-of? @constant.builtin
    "SendDefaultMode" "SendBounceIfActionFail" "SendPayGasSeparately" "SendPayFwdFeesSeparately"
    "SendIgnoreErrors" "SendDestroyIfZero" "SendRemainingValue" "SendRemainingBalance"
    "SendOnlyEstimateFee" "ReserveExact" "ReserveAllExcept" "ReserveAtMost"
    "ReserveAddOriginalBalance" "ReserveInvertSign" "ReserveBounceIfActionFail"
    "TactExitCodeNullReferenceException" "TactExitCodeInvalidSerializationPrefix"
    "TactExitCodeInvalidIncomingMessage" "TactExitCodeConstraintsError" "TactExitCodeAccessDenied"
    "TactExitCodeContractStopped" "TactExitCodeInvalidArgument" "TactExitCodeContractCodeNotFound"
    "TactExitCodeInvalidStandardAddress" "TactExitCodeNotBasechainAddress")
  (#is-not? local))

(null) @constant.builtin

; constant.builtin.boolean
; ------------------------
(boolean) @constant.builtin.boolean

; keyword
; -------
[
  "with"
  ; "public" ; -- not used, but declared in grammar.ohm
  ; "extend" ; -- not used, but declared in grammar.ohm
] @keyword

; keyword.storage.modifier
; ------------------------
[
  "get"
  "mutates"
  "extends"
  "virtual"
  "override"
  "inline"
  "abstract"
] @keyword.storage.modifier

; keyword.storage.type
; --------------------
[
  "contract"
  "trait"
  "struct"
  "message"
  "with"
  "const"
  "let"
] @keyword.storage.type

; keyword.function
; ----------------
[
  "fun"
  "native"
  "asm"
] @keyword.function

; keyword.directive
; -----------------
"primitive" @keyword.directive

; keyword.operator
; ----------------
"initOf" @keyword.operator

"codeOf" @keyword.operator

; keyword.control.exception
; -------------------------
[
  "try"
  "catch"
] @keyword.control.exception

; keyword.control.return
; ----------------------
"return" @keyword.control.return

; keyword.control.import
; ----------------------
"import" @keyword.control.import

; keyword.control.repeat
; ----------------------
(foreach_statement
  .
  (_)
  .
  (_)
  .
  "in" @keyword.control.repeat)

[
  "while"
  "repeat"
  "do"
  "until"
  "foreach"
] @keyword.control.repeat

; keyword.control.conditional
; ---------------------------
[
  "if"
  "else"
] @keyword.control.conditional

; function
; --------
(func_identifier) @function

(native_function
  name: (identifier) @function)

(asm_function
  name: (identifier) @function)

(global_function
  name: (identifier) @function)

(static_call_expression
  name: (identifier) @function)

(init_function
  "init" @function.method)

(receive_function
  "receive" @function.method)

(bounced_function
  "bounced" @function.method)

(external_function
  "external" @function.method)

(storage_function
  name: (identifier) @function.method)

; function.method
; ---------------
(method_call_expression
  name: (identifier) @function.method)

; asm-specific
; ------------
(tvm_instruction) @function.call

(asm_integer) @constant.numeric.integer

(asm_string) @string

(asm_control_register) @string.special.symbol

(asm_stack_register) @string.special.symbol

(asm_hex_bitstring) @function.macro

(asm_bin_bitstring) @function.macro

(asm_boc_hex) @function.macro

(asm_cont_name) @variable

; within asm_sequence
[
  "<{"
  "}>"
  "}>c"
  "}>s"
  "}>CONT"
] @punctuation.bracket

; attribute
; ---------
[
  "@name"
  "@interface"
] @attribute

; comment.block
; -------------
(comment) @comment.block

; comment.line
; ------------
((comment) @comment.line
  (#match? @comment.line "^//"))
