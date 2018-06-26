;; Test that traps are preserved even in instructions which might otherwise
;; be dead-code-eliminated. These functions all perform an operation and
;; discard its return value.

(module
<<<<<<< HEAD
  (func (export "no_dce.i32.div_s") (param $x i32) (param $y i32) (result i32)
    (i32.div_s (get_local $x) (get_local $y)))
  (func (export "no_dce.i32.div_u") (param $x i32) (param $y i32) (result i32)
    (i32.div_u (get_local $x) (get_local $y)))
  (func (export "no_dce.i64.div_s") (param $x i64) (param $y i64) (result i64)
    (i64.div_s (get_local $x) (get_local $y)))
  (func (export "no_dce.i64.div_u") (param $x i64) (param $y i64) (result i64)
    (i64.div_u (get_local $x) (get_local $y)))
=======
  (func (export "no_dce.i32.div_s") (param $x i32) (param $y i32)
    (drop (i32.div_s (get_local $x) (get_local $y))))
  (func (export "no_dce.i32.div_u") (param $x i32) (param $y i32)
    (drop (i32.div_u (get_local $x) (get_local $y))))
  (func (export "no_dce.i64.div_s") (param $x i64) (param $y i64)
    (drop (i64.div_s (get_local $x) (get_local $y))))
  (func (export "no_dce.i64.div_u") (param $x i64) (param $y i64)
    (drop (i64.div_u (get_local $x) (get_local $y))))
>>>>>>> upstream/master
)

(assert_trap (invoke "no_dce.i32.div_s" (i32.const 1) (i32.const 0)) "integer divide by zero")
(assert_trap (invoke "no_dce.i32.div_u" (i32.const 1) (i32.const 0)) "integer divide by zero")
(assert_trap (invoke "no_dce.i64.div_s" (i64.const 1) (i64.const 0)) "integer divide by zero")
(assert_trap (invoke "no_dce.i64.div_u" (i64.const 1) (i64.const 0)) "integer divide by zero")
(assert_trap (invoke "no_dce.i32.div_s" (i32.const 0x80000000) (i32.const -1)) "integer overflow")
(assert_trap (invoke "no_dce.i64.div_s" (i64.const 0x8000000000000000) (i64.const -1)) "integer overflow")

(module
<<<<<<< HEAD
  (func (export "no_dce.i32.rem_s") (param $x i32) (param $y i32) (result i32)
    (i32.rem_s (get_local $x) (get_local $y)))
  (func (export "no_dce.i32.rem_u") (param $x i32) (param $y i32) (result i32)
    (i32.rem_u (get_local $x) (get_local $y)))
  (func (export "no_dce.i64.rem_s") (param $x i64) (param $y i64) (result i64)
    (i64.rem_s (get_local $x) (get_local $y)))
  (func (export "no_dce.i64.rem_u") (param $x i64) (param $y i64) (result i64)
    (i64.rem_u (get_local $x) (get_local $y)))
=======
  (func (export "no_dce.i32.rem_s") (param $x i32) (param $y i32)
    (drop (i32.rem_s (get_local $x) (get_local $y))))
  (func (export "no_dce.i32.rem_u") (param $x i32) (param $y i32)
    (drop (i32.rem_u (get_local $x) (get_local $y))))
  (func (export "no_dce.i64.rem_s") (param $x i64) (param $y i64)
    (drop (i64.rem_s (get_local $x) (get_local $y))))
  (func (export "no_dce.i64.rem_u") (param $x i64) (param $y i64)
    (drop (i64.rem_u (get_local $x) (get_local $y))))
>>>>>>> upstream/master
)

(assert_trap (invoke "no_dce.i32.rem_s" (i32.const 1) (i32.const 0)) "integer divide by zero")
(assert_trap (invoke "no_dce.i32.rem_u" (i32.const 1) (i32.const 0)) "integer divide by zero")
(assert_trap (invoke "no_dce.i64.rem_s" (i64.const 1) (i64.const 0)) "integer divide by zero")
(assert_trap (invoke "no_dce.i64.rem_u" (i64.const 1) (i64.const 0)) "integer divide by zero")

(module
<<<<<<< HEAD
  (func (export "no_dce.i32.trunc_s_f32") (param $x f32) (result i32) (i32.trunc_s/f32 (get_local $x)))
  (func (export "no_dce.i32.trunc_u_f32") (param $x f32) (result i32) (i32.trunc_u/f32 (get_local $x)))
  (func (export "no_dce.i32.trunc_s_f64") (param $x f64) (result i32) (i32.trunc_s/f64 (get_local $x)))
  (func (export "no_dce.i32.trunc_u_f64") (param $x f64) (result i32) (i32.trunc_u/f64 (get_local $x)))
  (func (export "no_dce.i64.trunc_s_f32") (param $x f32) (result i64) (i64.trunc_s/f32 (get_local $x)))
  (func (export "no_dce.i64.trunc_u_f32") (param $x f32) (result i64) (i64.trunc_u/f32 (get_local $x)))
  (func (export "no_dce.i64.trunc_s_f64") (param $x f64) (result i64) (i64.trunc_s/f64 (get_local $x)))
  (func (export "no_dce.i64.trunc_u_f64") (param $x f64) (result i64) (i64.trunc_u/f64 (get_local $x)))
=======
  (func (export "no_dce.i32.trunc_s_f32") (param $x f32) (drop (i32.trunc_s/f32 (get_local $x))))
  (func (export "no_dce.i32.trunc_u_f32") (param $x f32) (drop (i32.trunc_u/f32 (get_local $x))))
  (func (export "no_dce.i32.trunc_s_f64") (param $x f64) (drop (i32.trunc_s/f64 (get_local $x))))
  (func (export "no_dce.i32.trunc_u_f64") (param $x f64) (drop (i32.trunc_u/f64 (get_local $x))))
  (func (export "no_dce.i64.trunc_s_f32") (param $x f32) (drop (i64.trunc_s/f32 (get_local $x))))
  (func (export "no_dce.i64.trunc_u_f32") (param $x f32) (drop (i64.trunc_u/f32 (get_local $x))))
  (func (export "no_dce.i64.trunc_s_f64") (param $x f64) (drop (i64.trunc_s/f64 (get_local $x))))
  (func (export "no_dce.i64.trunc_u_f64") (param $x f64) (drop (i64.trunc_u/f64 (get_local $x))))
>>>>>>> upstream/master
)

(assert_trap (invoke "no_dce.i32.trunc_s_f32" (f32.const nan)) "invalid conversion to integer")
(assert_trap (invoke "no_dce.i32.trunc_u_f32" (f32.const nan)) "invalid conversion to integer")
(assert_trap (invoke "no_dce.i32.trunc_s_f64" (f64.const nan)) "invalid conversion to integer")
(assert_trap (invoke "no_dce.i32.trunc_u_f64" (f64.const nan)) "invalid conversion to integer")
(assert_trap (invoke "no_dce.i64.trunc_s_f32" (f32.const nan)) "invalid conversion to integer")
(assert_trap (invoke "no_dce.i64.trunc_u_f32" (f32.const nan)) "invalid conversion to integer")
(assert_trap (invoke "no_dce.i64.trunc_s_f64" (f64.const nan)) "invalid conversion to integer")
(assert_trap (invoke "no_dce.i64.trunc_u_f64" (f64.const nan)) "invalid conversion to integer")

(module
    (memory 1)

<<<<<<< HEAD
    (func (export "no_dce.i32.load") (param $i i32) (result i32) (i32.load (get_local $i)))
    (func (export "no_dce.i64.load") (param $i i32) (result i64) (i64.load (get_local $i)))
    (func (export "no_dce.f32.load") (param $i i32) (result f32) (f32.load (get_local $i)))
    (func (export "no_dce.f64.load") (param $i i32) (result f64) (f64.load (get_local $i)))
=======
    (func (export "no_dce.i32.load") (param $i i32) (drop (i32.load (get_local $i))))
    (func (export "no_dce.i32.load16_s") (param $i i32) (drop (i32.load16_s (get_local $i))))
    (func (export "no_dce.i32.load16_u") (param $i i32) (drop (i32.load16_u (get_local $i))))
    (func (export "no_dce.i32.load8_s") (param $i i32) (drop (i32.load8_s (get_local $i))))
    (func (export "no_dce.i32.load8_u") (param $i i32) (drop (i32.load8_u (get_local $i))))
    (func (export "no_dce.i64.load") (param $i i32) (drop (i64.load (get_local $i))))
    (func (export "no_dce.i64.load32_s") (param $i i32) (drop (i64.load32_s (get_local $i))))
    (func (export "no_dce.i64.load32_u") (param $i i32) (drop (i64.load32_u (get_local $i))))
    (func (export "no_dce.i64.load16_s") (param $i i32) (drop (i64.load16_s (get_local $i))))
    (func (export "no_dce.i64.load16_u") (param $i i32) (drop (i64.load16_u (get_local $i))))
    (func (export "no_dce.i64.load8_s") (param $i i32) (drop (i64.load8_s (get_local $i))))
    (func (export "no_dce.i64.load8_u") (param $i i32) (drop (i64.load8_u (get_local $i))))
    (func (export "no_dce.f32.load") (param $i i32) (drop (f32.load (get_local $i))))
    (func (export "no_dce.f64.load") (param $i i32) (drop (f64.load (get_local $i))))
>>>>>>> upstream/master
)

(assert_trap (invoke "no_dce.i32.load" (i32.const 65536)) "out of bounds memory access")
(assert_trap (invoke "no_dce.i32.load16_s" (i32.const 65536)) "out of bounds memory access")
(assert_trap (invoke "no_dce.i32.load16_u" (i32.const 65536)) "out of bounds memory access")
(assert_trap (invoke "no_dce.i32.load8_s" (i32.const 65536)) "out of bounds memory access")
(assert_trap (invoke "no_dce.i32.load8_u" (i32.const 65536)) "out of bounds memory access")
(assert_trap (invoke "no_dce.i64.load" (i32.const 65536)) "out of bounds memory access")
(assert_trap (invoke "no_dce.i64.load32_s" (i32.const 65536)) "out of bounds memory access")
(assert_trap (invoke "no_dce.i64.load32_u" (i32.const 65536)) "out of bounds memory access")
(assert_trap (invoke "no_dce.i64.load16_s" (i32.const 65536)) "out of bounds memory access")
(assert_trap (invoke "no_dce.i64.load16_u" (i32.const 65536)) "out of bounds memory access")
(assert_trap (invoke "no_dce.i64.load8_s" (i32.const 65536)) "out of bounds memory access")
(assert_trap (invoke "no_dce.i64.load8_u" (i32.const 65536)) "out of bounds memory access")
(assert_trap (invoke "no_dce.f32.load" (i32.const 65536)) "out of bounds memory access")
(assert_trap (invoke "no_dce.f64.load" (i32.const 65536)) "out of bounds memory access")
