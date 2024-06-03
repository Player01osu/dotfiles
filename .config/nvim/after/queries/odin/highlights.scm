;; extends

(procedure_declaration
  (identifier) @function
  (procedure
    (block))
  (#set! "priority" 150))

(procedure_declaration
  (identifier) @function
  (procedure
    (uninitialized))
  (#set! "priority" 150))
