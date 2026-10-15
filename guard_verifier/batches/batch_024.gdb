set pagination off
set confirm off
target remote :4242
load

set $hit_93 = 0
set $hit_94 = 0
set $hit_95 = 0
set $hit_96 = 0

break *0x0801088e
commands
  silent
  set $hit_93 = $hit_93 + 1
  if $hit_93 >= 5
    disable 1
  end
  continue
end

break *0x08010b64
commands
  silent
  set $hit_94 = $hit_94 + 1
  if $hit_94 >= 5
    disable 2
  end
  continue
end

break *0x08010bb4
commands
  silent
  set $hit_95 = $hit_95 + 1
  if $hit_95 >= 5
    disable 3
  end
  continue
end

break *0x08010bf6
commands
  silent
  set $hit_96 = $hit_96 + 1
  if $hit_96 >= 5
    disable 4
  end
  continue
end

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 93, "RASM", "WATCHDOG_TIMERS", "_Watchdog_Remove", "0x0801088e", $hit_93
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 94, "RASM", "WATCHDOG_TIMERS", "_Watchdog_Tick", "0x08010b64", $hit_94
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 95, "RASM", "CORE_SYSTEM", "_Workspace_Allocate", "0x08010bb4", $hit_95
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 96, "RASM", "CORE_SYSTEM", "_Workspace_Free", "0x08010bf6", $hit_96
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
