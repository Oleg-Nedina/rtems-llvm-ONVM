set pagination off
set confirm off
target remote :4242
load

break *0x080058da
commands
  silent
  set $hit_17 = $hit_17 + 1
  continue
end
set $hit_17 = 0

break *0x080059f0
commands
  silent
  set $hit_18 = $hit_18 + 1
  continue
end
set $hit_18 = 0

break *0x08005a3a
commands
  silent
  set $hit_19 = $hit_19 + 1
  continue
end
set $hit_19 = 0

break *0x08005b58
commands
  silent
  set $hit_20 = $hit_20 + 1
  continue
end
set $hit_20 = 0

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 17, "RASM", "SCHEDULER", "_Scheduler_priority_Unblock", "0x080058da", $hit_17
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 18, "RASM", "SCHEDULER", "_Scheduler_priority_Yield", "0x080059f0", $hit_18
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 19, "RASM", "THREAD_LIFECYCLE", "_Stack_Allocator_allocate_for_idle_workspace", "0x08005a3a", $hit_19
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 20, "EDDI", "THREAD_LIFECYCLE", "_Thread_Do_dispatch", "0x08005b58", $hit_20
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
