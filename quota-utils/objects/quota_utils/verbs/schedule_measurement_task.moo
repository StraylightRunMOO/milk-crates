@verb quota_utils:schedule_measurement_task this none this rxd
@program quota_utils:schedule_measurement_task
// $quota_utils:schedule_measurement_task
if (caller == this || caller_perms().wizard)
  day = 24 * 3600;
  hour_of_day_GMT = 8;
  fork (hour_of_day_GMT * 60 * 60 + day - time() % day)
    this:schedule_measurement_task();
    this.measurement_task_running = task_id();
    this:measurement_task(this.task_time_limit);
    this.measurement_task_running = 0;
  endfork
endif
.
