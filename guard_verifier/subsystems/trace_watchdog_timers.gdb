set pagination off
set confirm off
target remote :4242
load

set $hit_71 = 0
set $hit_72 = 0
set $hit_73 = 0
set $hit_74 = 0
set $hit_75 = 0
set $hit_76 = 0
set $hit_77 = 0
set $hit_78 = 0
set $hit_92 = 0
set $hit_93 = 0
set $hit_94 = 0

break *0x0800f7ac
commands
  silent
  set $hit_71 = $hit_71 + 1
  if $hit_71 >= 5
    disable 1
  end
  continue
end

break *0x0800f878
commands
  silent
  set $hit_72 = $hit_72 + 1
  if $hit_72 >= 5
    disable 2
  end
  continue
end

break *0x0800f8e2
commands
  silent
  set $hit_73 = $hit_73 + 1
  if $hit_73 >= 5
    disable 3
  end
  continue
end

break *0x0800f956
commands
  silent
  set $hit_74 = $hit_74 + 1
  if $hit_74 >= 5
    disable 4
  end
  continue
end

break *0x0800f9de
commands
  silent
  set $hit_75 = $hit_75 + 1
  if $hit_75 >= 5
    disable 5
  end
  continue
end

break *0x0800fabe
commands
  silent
  set $hit_76 = $hit_76 + 1
  if $hit_76 >= 5
    disable 6
  end
  continue
end

break *0x0800fb4c
commands
  silent
  set $hit_77 = $hit_77 + 1
  if $hit_77 >= 5
    disable 7
  end
  continue
end

break *0x0800fbe0
commands
  silent
  set $hit_78 = $hit_78 + 1
  if $hit_78 >= 5
    disable 8
  end
  continue
end

break *0x080107e8
commands
  silent
  set $hit_92 = $hit_92 + 1
  if $hit_92 >= 5
    disable 9
  end
  continue
end

break *0x0801088e
commands
  silent
  set $hit_93 = $hit_93 + 1
  if $hit_93 >= 5
    disable 10
  end
  continue
end

break *0x08010b64
commands
  silent
  set $hit_94 = $hit_94 + 1
  if $hit_94 >= 5
    disable 11
  end
  continue
end

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 71, "RASM", "WATCHDOG_TIMERS", "_Timespec_Add_to", "0x0800f7ac", $hit_71
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 72, "RASM", "WATCHDOG_TIMERS", "_Timespec_Divide", "0x0800f878", $hit_72
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 73, "RASM", "WATCHDOG_TIMERS", "_Timespec_Divide_by_integer", "0x0800f8e2", $hit_73
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 74, "RASM", "WATCHDOG_TIMERS", "_Timespec_From_ticks", "0x0800f956", $hit_74
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 75, "RASM", "WATCHDOG_TIMERS", "_Timespec_Is_valid", "0x0800f9de", $hit_75
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 76, "RASM", "WATCHDOG_TIMERS", "_Timespec_Less_than", "0x0800fabe", $hit_76
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 77, "RASM", "WATCHDOG_TIMERS", "_Timespec_Subtract", "0x0800fb4c", $hit_77
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 78, "RASM", "WATCHDOG_TIMERS", "_Timespec_To_ticks", "0x0800fbe0", $hit_78
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 92, "RASM", "WATCHDOG_TIMERS", "_Watchdog_Insert", "0x080107e8", $hit_92
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 93, "RASM", "WATCHDOG_TIMERS", "_Watchdog_Remove", "0x0801088e", $hit_93
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 94, "RASM", "WATCHDOG_TIMERS", "_Watchdog_Tick", "0x08010b64", $hit_94
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
