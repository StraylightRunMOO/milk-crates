@verb seq_tests:test_for this none none rxd
@program seq_tests:test_for
this.collected = {};
r = `$seq_utils:("for")({1, 4}, this, "collect") ! ANY => E_NONE';
if (typeof(r) == ERR)
  return "for err " + toliteral(r);
endif
if (this.collected != {1, 2, 3})
  return "for collected => " + toliteral(this.collected);
endif
this.collected = {};
r = `$seq_utils:("for")({5, 6}, this, "collect") ! ANY => E_NONE';
if (this.collected != {5})
  return "for singleton => " + toliteral(this.collected);
endif
return 1;
.
