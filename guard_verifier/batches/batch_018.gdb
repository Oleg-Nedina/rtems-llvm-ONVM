set pagination off
set confirm off
target remote :4242
load

set $hit_69 = 0
set $hit_70 = 0
set $hit_71 = 0
set $hit_72 = 0

break *0x0800f670
commands
  silent
  set $hit_69 = $hit_69 + 1
  if $hit_69 >= 5
    disable 1
  end
  continue
end

break *0x0800f6ec
commands
  silent
  set $hit_70 = $hit_70 + 1
  if $hit_70 >= 5
    disable 2
  end
  continue
end

break *0x0800f7ac
commands
  silent
  set $hit_71 = $hit_71 + 1
  if $hit_71 >= 5
    disable 3
  end
  continue
end

break *0x0800f878
commands
  silent
  set $hit_72 = $hit_72 + 1
  if $hit_72 >= 5
    disable 4
  end
  continue
end

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 69, "RASM", "THREAD_LIFECYCLE", "_Thread_Timeout", "0x0800f670", $hit_69
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 70, "RASM", "THREAD_LIFECYCLE", "_Thread_Yield", "0x0800f6ec", $hit_70
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 71, "RASM", "WATCHDOG_TIMERS", "_Timespec_Add_to", "0x0800f7ac", $hit_71
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 72, "RASM", "WATCHDOG_TIMERS", "_Timespec_Divide", "0x0800f878", $hit_72
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
