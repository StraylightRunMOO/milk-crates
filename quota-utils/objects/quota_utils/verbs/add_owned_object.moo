@verb quota_utils:add_owned_object this none this rxd
@program quota_utils:add_owned_object
// $quota_utils:add_owned_object(who, what) -- adds what to whose .owned_objects.
{who, what} = args;
if (typeof(who.owned_objects) == LIST && what.owner == who)
  who.owned_objects = setadd(who.owned_objects, what);
endif
.
