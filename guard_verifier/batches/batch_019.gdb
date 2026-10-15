set pagination off
set confirm off
target remote :4242
load

set $hit_73 = 0
set $hit_74 = 0
set $hit_75 = 0
set $hit_76 = 0

break *0x0800f8e2
commands
  silent
  set $hit_73 = $hit_73 + 1
  if $hit_73 >= 5
    disable 1
  end
  continue
end

break *0x0800f956
commands
  silent
  set $hit_74 = $hit_74 + 1
  if $hit_74 >= 5
    disable 2
  end
  continue
end

break *0x0800f9de
commands
  silent
  set $hit_75 = $hit_75 + 1
  if $hit_75 >= 5
    disable 3
  end
  continue
end

break *0x0800fabe
commands
  silent
  set $hit_76 = $hit_76 + 1
  if $hit_76 >= 5
    disable 4
  end
  continue
end

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 73, "RASM", "WATCHDOG_TIMERS", "_Timespec_Divide_by_integer", "0x0800f8e2", $hit_73
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 74, "RASM", "WATCHDOG_TIMERS", "_Timespec_From_ticks", "0x0800f956", $hit_74
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 75, "RASM", "WATCHDOG_TIMERS", "_Timespec_Is_valid", "0x0800f9de", $hit_75
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 76, "RASM", "WATCHDOG_TIMERS", "_Timespec_Less_than", "0x0800fabe", $hit_76
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
