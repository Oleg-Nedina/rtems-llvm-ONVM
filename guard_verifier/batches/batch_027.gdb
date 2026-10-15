set pagination off
set confirm off
target remote :4242
load

break *0x0800bc54
commands
  silent
  set $hit_105 = $hit_105 + 1
  continue
end
set $hit_105 = 0

break *0x0800bdce
commands
  silent
  set $hit_106 = $hit_106 + 1
  continue
end
set $hit_106 = 0

break *0x0800bdce
commands
  silent
  set $hit_107 = $hit_107 + 1
  continue
end
set $hit_107 = 0

break *0x0800be72
commands
  silent
  set $hit_108 = $hit_108 + 1
  continue
end
set $hit_108 = 0

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 105, "RASM", "CORE_SYSTEM", "_Stack_Free", "0x0800bc54", $hit_105
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 106, "RASM", "THREAD_LIFECYCLE", "_TLS_Get_allocation_size", "0x0800bdce", $hit_106
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 107, "EDDI", "THREAD_LIFECYCLE", "_TLS_Get_allocation_size", "0x0800bdce", $hit_107
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 108, "RASM", "WATCHDOG_TIMERS", "_Watchdog_Remove", "0x0800be72", $hit_108
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
