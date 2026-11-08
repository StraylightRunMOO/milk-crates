@verb string_utils:connection_hostname connection_hostname_bsd this none this rxd
@program string_utils:connection_hostname connection_hostname_bsd
// $string_utils:connection_hostname(obj|str) => STR
// Host for a live connection, or extract it from a legacy connection_name() string.
caller != #0 && set_task_perms(caller_perms());
{lookup} = args;
if (typeof(lookup) == OBJ)
  info = `connection_info(lookup) ! ANY => 0';
  if (typeof(info) != MAP || !maphaskey(info, "connection_name"))
    return "";
  endif
  lookup = info["connection_name"];
endif
if (typeof(lookup) != STR)
  return "";
endif
return (m = `match(lookup, "^.* %(from%|to%) %([^, ]+%)") ! ANY') ? substitute("%2", m) | lookup;
.
