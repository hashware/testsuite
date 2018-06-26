;; Test `unreachable` operator

(module
  ;; Auxiliary definitions
  (func $dummy)
  (func $dummy3 (param i32 i32 i32))

  (func (export "type-i32") (result i32) (unreachable))
  (func (export "type-i64") (result i32) (unreachable))
  (func (export "type-f32") (result f64) (unreachable))
  (func (export "type-f64") (result f64) (unreachable))

  (func (export "as-func-first") (result i32)
    (unreachable) (i32.const -1)
  )
  (func (export "as-func-mid") (result i32)
    (call $dummy) (unreachable) (i32.const -1)
  )
  (func (export "as-func-last")
    (call $dummy) (unreachable)
  )
  (func (export "as-func-value") (result i32)
    (call $dummy) (unreachable)
  )

  (func (export "as-block-first") (result i32)
<<<<<<< HEAD
    (block i32 (unreachable) (i32.const 2))
  )
  (func (export "as-block-mid") (result i32)
    (block i32 (call $dummy) (unreachable) (i32.const 2))
=======
    (block (result i32) (unreachable) (i32.const 2))
  )
  (func (export "as-block-mid") (result i32)
    (block (result i32) (call $dummy) (unreachable) (i32.const 2))
>>>>>>> upstream/master
  )
  (func (export "as-block-last")
    (block (nop) (call $dummy) (unreachable))
  )
  (func (export "as-block-value") (result i32)
<<<<<<< HEAD
    (block i32 (nop) (call $dummy) (unreachable))
  )
  (func (export "as-block-broke") (result i32)
    (block i32 (call $dummy) (br 0 (i32.const 1)) (unreachable))
  )

  (func (export "as-loop-first") (result i32)
    (loop i32 (unreachable) (i32.const 2))
  )
  (func (export "as-loop-mid") (result i32)
    (loop i32 (call $dummy) (unreachable) (i32.const 2))
=======
    (block (result i32) (nop) (call $dummy) (unreachable))
  )
  (func (export "as-block-broke") (result i32)
    (block (result i32) (call $dummy) (br 0 (i32.const 1)) (unreachable))
  )

  (func (export "as-loop-first") (result i32)
    (loop (result i32) (unreachable) (i32.const 2))
  )
  (func (export "as-loop-mid") (result i32)
    (loop (result i32) (call $dummy) (unreachable) (i32.const 2))
>>>>>>> upstream/master
  )
  (func (export "as-loop-last")
    (loop (nop) (call $dummy) (unreachable))
  )
  (func (export "as-loop-broke") (result i32)
<<<<<<< HEAD
    (block i32 (loop i32 (call $dummy) (br 1 (i32.const 1)) (unreachable)))
  )

  (func (export "as-br-value") (result i32)
    (block i32 (br 0 (unreachable)))
=======
    (block (result i32)
      (loop (result i32) (call $dummy) (br 1 (i32.const 1)) (unreachable))
    )
  )

  (func (export "as-br-value") (result i32)
    (block (result i32) (br 0 (unreachable)))
>>>>>>> upstream/master
  )

  (func (export "as-br_if-cond")
    (block (br_if 0 (unreachable)))
  )
  (func (export "as-br_if-value") (result i32)
<<<<<<< HEAD
    (block i32 (br_if 0 (unreachable) (i32.const 1)) (i32.const 7))
  )
  (func (export "as-br_if-value-cond") (result i32)
    (block i32 (drop (br_if 0 (i32.const 6) (unreachable))) (i32.const 7))
=======
    (block (result i32)
      (drop (br_if 0 (unreachable) (i32.const 1))) (i32.const 7)
    )
  )
  (func (export "as-br_if-value-cond") (result i32)
    (block (result i32)
      (drop (br_if 0 (i32.const 6) (unreachable))) (i32.const 7)
    )
>>>>>>> upstream/master
  )

  (func (export "as-br_table-index")
    (block (br_table 0 0 0 (unreachable)))
  )
  (func (export "as-br_table-value") (result i32)
<<<<<<< HEAD
    (block i32 (br_table 0 0 0 (unreachable) (i32.const 1)) (i32.const 7))
  )
  (func (export "as-br_table-value-index") (result i32)
    (block i32 (br_table 0 0 (i32.const 6) (unreachable)) (i32.const 7))
=======
    (block (result i32)
      (br_table 0 0 0 (unreachable) (i32.const 1)) (i32.const 7)
    )
  )
  (func (export "as-br_table-value-2") (result i32)
    (block (result i32)
      (block (result i32) (br_table 0 1 (unreachable) (i32.const 1)))
    )
  )
  (func (export "as-br_table-value-index") (result i32)
    (block (result i32)
      (br_table 0 0 (i32.const 6) (unreachable)) (i32.const 7)
    )
  )
  (func (export "as-br_table-value-and-index") (result i32)
    (block (result i32) (br_table 0 0 (unreachable)) (i32.const 8))
>>>>>>> upstream/master
  )

  (func (export "as-return-value") (result i64)
    (return (unreachable))
  )

  (func (export "as-if-cond") (result i32)
<<<<<<< HEAD
    (if (unreachable) (i32.const 0) (i32.const 1))
  )
  (func (export "as-if-then") (param i32 i32) (result i32)
    (if i32 (get_local 0) (unreachable) (get_local 1))
  )
  (func (export "as-if-else") (param i32 i32) (result i32)
    (if i32 (get_local 0) (get_local 1) (unreachable))
=======
    (if (result i32) (unreachable) (then (i32.const 0)) (else (i32.const 1)))
  )
  (func (export "as-if-then") (param i32 i32) (result i32)
    (if (result i32) (get_local 0) (then (unreachable)) (else (get_local 1)))
  )
  (func (export "as-if-else") (param i32 i32) (result i32)
    (if (result i32) (get_local 0) (then (get_local 1)) (else (unreachable)))
>>>>>>> upstream/master
  )

  (func (export "as-select-first") (param i32 i32) (result i32)
    (select (unreachable) (get_local 0) (get_local 1))
  )
  (func (export "as-select-second") (param i32 i32) (result i32)
    (select (get_local 0) (unreachable) (get_local 1))
  )
  (func (export "as-select-cond") (result i32)
    (select (i32.const 0) (i32.const 1) (unreachable))
  )

  (func (export "as-call-first")
    (call $dummy3 (unreachable) (i32.const 2) (i32.const 3))
  )
  (func (export "as-call-mid")
    (call $dummy3 (i32.const 1) (unreachable) (i32.const 3))
  )
  (func (export "as-call-last")
    (call $dummy3 (i32.const 1) (i32.const 2) (unreachable))
  )

  (type $sig (func (param i32 i32 i32)))
  (table anyfunc (elem $dummy3))
  (func (export "as-call_indirect-func")
<<<<<<< HEAD
    (call_indirect $sig (unreachable) (i32.const 1) (i32.const 2) (i32.const 3))
  )
  (func (export "as-call_indirect-first")
    (call_indirect $sig (i32.const 0) (unreachable) (i32.const 2) (i32.const 3))
  )
  (func (export "as-call_indirect-mid")
    (call_indirect $sig (i32.const 0) (i32.const 1) (unreachable) (i32.const 3))
  )
  (func (export "as-call_indirect-last")
    (call_indirect $sig (i32.const 0) (i32.const 1) (i32.const 2) (unreachable))
=======
    (call_indirect (type $sig)
      (unreachable) (i32.const 1) (i32.const 2) (i32.const 3)
    )
  )
  (func (export "as-call_indirect-first")
    (call_indirect (type $sig)
      (i32.const 0) (unreachable) (i32.const 2) (i32.const 3)
    )
  )
  (func (export "as-call_indirect-mid")
    (call_indirect (type $sig)
      (i32.const 0) (i32.const 1) (unreachable) (i32.const 3)
    )
  )
  (func (export "as-call_indirect-last")
    (call_indirect (type $sig)
      (i32.const 0) (i32.const 1) (i32.const 2) (unreachable)
    )
>>>>>>> upstream/master
  )

  (func (export "as-set_local-value") (local f32)
    (set_local 0 (unreachable))
  )

  (memory 1)
  (func (export "as-load-address") (result f32)
    (f32.load (unreachable))
  )
  (func (export "as-loadN-address") (result i64)
    (i64.load8_s (unreachable))
  )

  (func (export "as-store-address")
    (f64.store (unreachable) (f64.const 7))
  )
  (func (export "as-store-value")
    (i64.store (i32.const 2) (unreachable))
  )

  (func (export "as-storeN-address")
    (i32.store8 (unreachable) (i32.const 7))
  )
  (func (export "as-storeN-value")
    (i64.store16 (i32.const 2) (unreachable))
  )

  (func (export "as-unary-operand") (result f32)
    (f32.neg (unreachable))
  )

  (func (export "as-binary-left") (result i32)
    (i32.add (unreachable) (i32.const 10))
  )
  (func (export "as-binary-right") (result i64)
    (i64.sub (i64.const 10) (unreachable))
  )

  (func (export "as-test-operand") (result i32)
    (i32.eqz (unreachable))
  )

  (func (export "as-compare-left") (result i32)
    (f64.le (unreachable) (f64.const 10))
  )
  (func (export "as-compare-right") (result i32)
    (f32.ne (f32.const 10) (unreachable))
  )

  (func (export "as-convert-operand") (result i32)
    (i32.wrap/i64 (unreachable))
  )

<<<<<<< HEAD
  (func (export "as-grow_memory-size") (result i32)
    (grow_memory (unreachable))
=======
  (func (export "as-memory.grow-size") (result i32)
    (memory.grow (unreachable))
>>>>>>> upstream/master
  )
)

(assert_trap (invoke "type-i32") "unreachable")
(assert_trap (invoke "type-i64") "unreachable")
(assert_trap (invoke "type-f32") "unreachable")
(assert_trap (invoke "type-f64") "unreachable")

(assert_trap (invoke "as-func-first") "unreachable")
(assert_trap (invoke "as-func-mid") "unreachable")
(assert_trap (invoke "as-func-last") "unreachable")
(assert_trap (invoke "as-func-value") "unreachable")

(assert_trap (invoke "as-block-first") "unreachable")
(assert_trap (invoke "as-block-mid") "unreachable")
(assert_trap (invoke "as-block-last") "unreachable")
(assert_trap (invoke "as-block-value") "unreachable")
(assert_return (invoke "as-block-broke") (i32.const 1))

(assert_trap (invoke "as-loop-first") "unreachable")
(assert_trap (invoke "as-loop-mid") "unreachable")
(assert_trap (invoke "as-loop-last") "unreachable")
(assert_return (invoke "as-loop-broke") (i32.const 1))

(assert_trap (invoke "as-br-value") "unreachable")

(assert_trap (invoke "as-br_if-cond") "unreachable")
(assert_trap (invoke "as-br_if-value") "unreachable")
(assert_trap (invoke "as-br_if-value-cond") "unreachable")

(assert_trap (invoke "as-br_table-index") "unreachable")
(assert_trap (invoke "as-br_table-value") "unreachable")
(assert_trap (invoke "as-br_table-value-2") "unreachable")
(assert_trap (invoke "as-br_table-value-index") "unreachable")
(assert_trap (invoke "as-br_table-value-and-index") "unreachable")

(assert_trap (invoke "as-return-value") "unreachable")

(assert_trap (invoke "as-if-cond") "unreachable")
(assert_trap (invoke "as-if-then" (i32.const 1) (i32.const 6)) "unreachable")
(assert_return (invoke "as-if-then" (i32.const 0) (i32.const 6)) (i32.const 6))
(assert_trap (invoke "as-if-else" (i32.const 0) (i32.const 6)) "unreachable")
(assert_return (invoke "as-if-else" (i32.const 1) (i32.const 6)) (i32.const 6))

(assert_trap (invoke "as-select-first" (i32.const 0) (i32.const 6)) "unreachable")
(assert_trap (invoke "as-select-first" (i32.const 1) (i32.const 6)) "unreachable")
(assert_trap (invoke "as-select-second" (i32.const 0) (i32.const 6)) "unreachable")
(assert_trap (invoke "as-select-second" (i32.const 1) (i32.const 6)) "unreachable")
(assert_trap (invoke "as-select-cond") "unreachable")

(assert_trap (invoke "as-call-first") "unreachable")
(assert_trap (invoke "as-call-mid") "unreachable")
(assert_trap (invoke "as-call-last") "unreachable")

(assert_trap (invoke "as-call_indirect-func") "unreachable")
(assert_trap (invoke "as-call_indirect-first") "unreachable")
(assert_trap (invoke "as-call_indirect-mid") "unreachable")
(assert_trap (invoke "as-call_indirect-last") "unreachable")

(assert_trap (invoke "as-set_local-value") "unreachable")

(assert_trap (invoke "as-load-address") "unreachable")
(assert_trap (invoke "as-loadN-address") "unreachable")

(assert_trap (invoke "as-store-address") "unreachable")
(assert_trap (invoke "as-store-value") "unreachable")
(assert_trap (invoke "as-storeN-address") "unreachable")
(assert_trap (invoke "as-storeN-value") "unreachable")

(assert_trap (invoke "as-unary-operand") "unreachable")

(assert_trap (invoke "as-binary-left") "unreachable")
(assert_trap (invoke "as-binary-right") "unreachable")

(assert_trap (invoke "as-test-operand") "unreachable")

(assert_trap (invoke "as-compare-left") "unreachable")
(assert_trap (invoke "as-compare-right") "unreachable")

(assert_trap (invoke "as-convert-operand") "unreachable")

(assert_trap (invoke "as-memory.grow-size") "unreachable")

