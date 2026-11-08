@verb lock_tests:run this none none rxd
@program lock_tests:run
// Entry for $pkg:test. Delegates to $test_utils:run(this).
return $test_utils:run(this);
.
