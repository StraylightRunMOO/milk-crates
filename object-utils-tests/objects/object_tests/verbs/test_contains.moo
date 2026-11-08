@verb object_tests:test_contains this none none rxd
@program object_tests:test_contains
room = `create($root_class) ! ANY => 0';
box = `create($root_class) ! ANY => 0';
item = `create($root_class) ! ANY => 0';
ok = typeof(room) == OBJ && valid(room) && typeof(box) == OBJ && valid(box) && typeof(item) == OBJ && valid(item);
if (!ok)
  this:recycle_all(item, box, room);
  return "create failed";
endif
`move(box, room) ! ANY => 0';
`move(item, box) ! ANY => 0';
r = 1;
if (!(item in `box.contents ! ANY => {}') || !(box in `room.contents ! ANY => {}'))
  r = "move failed";
elseif (!$object_utils:contains(room, box))
  r = "contains(room, box)";
else
  if (!$object_utils:contains(room, item))
    r = "contains(room, item)";
  elseif (!$object_utils:contains(box, item))
    r = "contains(box, item)";
  else
    if ($object_utils:contains(item, box))
      r = "contains(item, box) should be false";
    elseif ($object_utils:contains(room, room))
      r = "contains self should be false";
    endif
  endif
endif
if (r == 1)
  loc = `$object_utils:locations(item) ! ANY => 0';
  if (typeof(loc) != LIST || !(box in loc) || !(room in loc))
    r = "locations => " + toliteral(loc);
  else
    bi = `locations(item) ! ANY => 0';
    if (loc != bi)
      r = "locations wrap mismatch " + toliteral(loc) + " vs " + toliteral(bi);
    endif
  endif
endif
if (r == 1)
  ac = `$object_utils:all_contents(room) ! ANY => 0';
  if (typeof(ac) != LIST || !(box in ac) || !(item in ac))
    r = "all_contents => " + toliteral(ac);
  endif
endif
this:recycle_all(item, box, room);
return r;
.
