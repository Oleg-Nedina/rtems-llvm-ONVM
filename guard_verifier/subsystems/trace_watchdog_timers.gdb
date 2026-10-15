set pagination off
set confirm off
target remote :4242
load

break *0x08006bdc
commands
  silent
  set $hit_42 = $hit_42 + 1
  continue
end
set $hit_42 = 0

break *0x08006eb8
commands
  silent
  set $hit_43 = $hit_43 + 1
  continue
end
set $hit_43 = 0

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
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 42, "RASM", "WATCHDOG_TIMERS", "_Watchdog_Insert", "0x08006bdc", $hit_42
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 43, "RASM", "WATCHDOG_TIMERS", "_Watchdog_Tick", "0x08006eb8", $hit_43
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 108, "RASM", "WATCHDOG_TIMERS", "_Watchdog_Remove", "0x0800be72", $hit_108
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
