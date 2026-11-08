@verb wiz_utils:set_email_address this none this rxd
@program wiz_utils:set_email_address
// $wiz_utils:set_email_address
set_task_perms(caller_perms());
{who, email} = args;
if (typeof(who.email_address) == LIST)
  who.email_address[1] = email;
else
  who.email_address = email;
endif
.
