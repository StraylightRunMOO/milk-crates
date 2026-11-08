@verb hello_tests:test_greet this none none rxd
@program hello_tests:test_greet
// hello-utils: greet returns the greeting property.
g = `$hello:greet() ! ANY => 0';
if (g != "hello, world")
  return "greet returned " + toliteral(g);
endif
return 1;
.
