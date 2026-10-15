set pagination off
set confirm off
target remote :4242
load

set $hit_17 = 0
set $hit_18 = 0
set $hit_19 = 0
set $hit_20 = 0

break *0x0800c292
commands
  silent
  set $hit_17 = $hit_17 + 1
  if $hit_17 >= 5
    disable 1
  end
  continue
end

break *0x0800c2c2
commands
  silent
  set $hit_18 = $hit_18 + 1
  if $hit_18 >= 5
    disable 2
  end
  continue
end

break *0x0800c66a
commands
  silent
  set $hit_19 = $hit_19 + 1
  if $hit_19 >= 5
    disable 3
  end
  continue
end

break *0x0800c6e0
commands
  silent
  set $hit_20 = $hit_20 + 1
  if $hit_20 >= 5
    disable 4
  end
  continue
end

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 17, "RASM", "SCHEDULER", "_Scheduler_default_Cancel_job", "0x0800c292", $hit_17
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 18, "RASM", "THREAD_LIFECYCLE", "_Scheduler_default_Start_idle", "0x0800c2c2", $hit_18
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 19, "RASM", "SCHEDULER", "_Scheduler_priority_Initialize", "0x0800c66a", $hit_19
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 20, "RASM", "SCHEDULER", "_Scheduler_priority_Node_initialize", "0x0800c6e0", $hit_20
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
