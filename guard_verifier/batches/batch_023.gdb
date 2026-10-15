set pagination off
set confirm off
target remote :4242
load

set $hit_89 = 0
set $hit_90 = 0
set $hit_91 = 0
set $hit_92 = 0

break *0x080103aa
commands
  silent
  set $hit_89 = $hit_89 + 1
  if $hit_89 >= 5
    disable 1
  end
  continue
end

break *0x0801068c
commands
  silent
  set $hit_90 = $hit_90 + 1
  set $hit_91 = $hit_91 + 1
  if $hit_90 >= 5
    disable 2
  end
  continue
end

break *0x080107e8
commands
  silent
  set $hit_92 = $hit_92 + 1
  if $hit_92 >= 5
    disable 3
  end
  continue
end

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 89, "RASM", "THREAD_LIFECYCLE", "_User_extensions_Thread_terminate_visitor", "0x080103aa", $hit_89
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 90, "RASM", "USER_EXTENSIONS", "_User_extensions_Iterate", "0x0801068c", $hit_90
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 91, "EDDI", "USER_EXTENSIONS", "_User_extensions_Iterate", "0x0801068c", $hit_91
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 92, "RASM", "WATCHDOG_TIMERS", "_Watchdog_Insert", "0x080107e8", $hit_92
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
