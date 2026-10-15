set pagination off
set confirm off
target remote :4242
load

break *0x08006a80
commands
  silent
  set $hit_41 = $hit_41 + 1
  continue
end
set $hit_41 = 0

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

break *0x08006f08
commands
  silent
  set $hit_44 = $hit_44 + 1
  continue
end
set $hit_44 = 0

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 41, "EDDI", "USER_EXTENSIONS", "_User_extensions_Iterate", "0x08006a80", $hit_41
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 42, "RASM", "WATCHDOG_TIMERS", "_Watchdog_Insert", "0x08006bdc", $hit_42
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 43, "RASM", "WATCHDOG_TIMERS", "_Watchdog_Tick", "0x08006eb8", $hit_43
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 44, "RASM", "CORE_SYSTEM", "_Workspace_Allocate", "0x08006f08", $hit_44
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
