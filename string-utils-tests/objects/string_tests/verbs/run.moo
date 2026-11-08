@verb string_tests:run this none none rxd
@program string_tests:run
// Entry for $pkg:test. Seed #0 sentinels, then delegate to $test_utils:run(this).
this:ensure_sentinels();
return $test_utils:run(this);
.
