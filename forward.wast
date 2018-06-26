(module
  (func $even (export "even") (param $n i32) (result i32)
<<<<<<< HEAD
    (if i32 (i32.eq (get_local $n) (i32.const 0))
      (i32.const 1)
      (call $odd (i32.sub (get_local $n) (i32.const 1)))
=======
    (if (result i32) (i32.eq (get_local $n) (i32.const 0))
      (then (i32.const 1))
      (else (call $odd (i32.sub (get_local $n) (i32.const 1))))
>>>>>>> upstream/master
    )
  )

  (func $odd (export "odd") (param $n i32) (result i32)
<<<<<<< HEAD
    (if i32 (i32.eq (get_local $n) (i32.const 0))
      (i32.const 0)
      (call $even (i32.sub (get_local $n) (i32.const 1)))
=======
    (if (result i32) (i32.eq (get_local $n) (i32.const 0))
      (then (i32.const 0))
      (else (call $even (i32.sub (get_local $n) (i32.const 1))))
>>>>>>> upstream/master
    )
  )
)

(assert_return (invoke "even" (i32.const 13)) (i32.const 0))
(assert_return (invoke "even" (i32.const 20)) (i32.const 1))
(assert_return (invoke "odd" (i32.const 13)) (i32.const 1))
(assert_return (invoke "odd" (i32.const 20)) (i32.const 0))
