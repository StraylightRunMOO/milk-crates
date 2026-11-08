@verb wiz_utils:expire_mail_weekly this none this rxd
@program wiz_utils:expire_mail_weekly
// $wiz_utils:expire_mail_weekly
if (!caller_perms().wizard)
  return E_PERM;
endif
fork (7 * 24 * 60 * 60)
  this:(verb)();
endfork
this:expire_mail();
.
