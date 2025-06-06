; See: https://docs.helix-editor.com/guides/indent.html
;
; indent
; ------
[
  ; (..., ...)
  (parameter_list)
  (argument_list)
  ; {..., ...}
  (instance_argument_list)
  (destruct_bind_list)
  (map_body)
  (set_body)
  ; {...; ...}
  (message_body)
  (struct_body)
  (contract_body)
  (trait_body)
  (function_body)
  (block_statement)
  (asm_function_body)
  ; misc.
  (ternary_expression)
  (binary_expression)
  (return_statement)
] @indent

; outdent
; -------
[
  "}"
  ")"
  ">"
] @outdent

; N/A or unused:
; --------------
; indent.always
; outdent.always
; align
; extend
; extend.prevent-once
