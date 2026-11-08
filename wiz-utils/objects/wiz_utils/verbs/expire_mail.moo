@verb wiz_utils:expire_mail none none none rxd
@program wiz_utils:expire_mail
// $wiz_utils:expire_mail
if (!caller_perms().wizard)
  return E_PERM;
endif
this:expire_mail_lists();
this:expire_mail_players();
.
