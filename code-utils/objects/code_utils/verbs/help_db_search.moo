@verb code_utils:help_db_search this none this rxd
@program code_utils:help_db_search
// $code_utils:help_db_search(string, dblist) => {db, topic}|{ambiguous, topics}|{}
// searches each of the help db's in dblist for a topic matching string.
// Returns  {db,topic}  or  {$ambiguous_match,{topic...}}  or {}
{what, dblist} = args;
topics = {};
help = 1;
verb_help_match = 0;
for db in (dblist)
  $command_utils:suspend_if_needed(0);
  if ({what} == (ts = `db:find_topics(what) ! ANY => 0'))
    if (`db == $help_db["verb"] ! ANY => 0')
      // Verb help is considered a last resort. It's possible help files contain more relevant information (e.g. $login).
      verb_help_match = {db, ts[1]};
    else
      return {db, ts[1]};
    endif
  elseif (ts && typeof(ts) == LIST)
    if (help)
      help = db;
    endif
    for t in (ts)
      topics = setadd(topics, t);
    endfor
  endif
endfor
if (length(topics) > 1)
  return {`$ambiguous_match ! ANY => #-2', topics};
elseif (topics)
  return {help, topics[1]};
else
  if (verb_help_match)
    return verb_help_match;
  else
    return {};
  endif
endif
.
