@verb hello_tests:test_parent this none none rxd
@program hello_tests:test_parent
// hello-utils: $hello is a child of $root_class.
if (!valid(`$hello ! ANY => #-1'))
  return "$hello missing";
endif
if (!isa($hello, $root_class))
  return "$hello is not a child of $root_class";
endif
return 1;
.
