; See: https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md#folds
[
  ; import …
  (import)+
  ; (…, …)
  (parameter_list)
  (argument_list)
  ; {…, …}
  (instance_argument_list)
  (destruct_bind_list)
  (map_body)
  (set_body)
  ; {…; …}
  (message_body)
  (struct_body)
  (contract_body)
  (trait_body)
  (function_body)
  (block_statement)
  (asm_function_body)
  ; <{ … }>
  (asm_sequence)
] @fold
