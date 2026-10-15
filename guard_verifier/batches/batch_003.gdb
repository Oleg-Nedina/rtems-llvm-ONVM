set pagination off
set confirm off
target remote :4242
load

break *0x08004d48
commands
  silent
  set $hit_9 = $hit_9 + 1
  continue
end
set $hit_9 = 0

break *0x08004d6e
commands
  silent
  set $hit_10 = $hit_10 + 1
  continue
end
set $hit_10 = 0

break *0x08004d9e
commands
  silent
  set $hit_11 = $hit_11 + 1
  continue
end
set $hit_11 = 0

break *0x08005146
commands
  silent
  set $hit_12 = $hit_12 + 1
  continue
end
set $hit_12 = 0

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 9, "RASM", "SCHEDULER", "_Scheduler_default_Release_job", "0x08004d48", $hit_9
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 10, "RASM", "SCHEDULER", "_Scheduler_default_Cancel_job", "0x08004d6e", $hit_10
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 11, "RASM", "THREAD_LIFECYCLE", "_Scheduler_default_Start_idle", "0x08004d9e", $hit_11
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 12, "RASM", "SCHEDULER", "_Scheduler_priority_Initialize", "0x08005146", $hit_12
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
