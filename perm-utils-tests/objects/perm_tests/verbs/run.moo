@verb perm_tests:run this none none rxd
@program perm_tests:run
// Entry for $pkg:test. Delegates to $test_utils:run(this).
return $test_utils:run(this);
.
