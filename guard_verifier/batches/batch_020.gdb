set pagination off
set confirm off
target remote :4242
load

set $hit_77 = 0
set $hit_78 = 0
set $hit_79 = 0
set $hit_80 = 0

break *0x0800fb4c
commands
  silent
  set $hit_77 = $hit_77 + 1
  if $hit_77 >= 5
    disable 1
  end
  continue
end

break *0x0800fbe0
commands
  silent
  set $hit_78 = $hit_78 + 1
  if $hit_78 >= 5
    disable 2
  end
  continue
end

break *0x0800fd2e
commands
  silent
  set $hit_79 = $hit_79 + 1
  set $hit_80 = $hit_80 + 1
  if $hit_79 >= 5
    disable 3
  end
  continue
end

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 77, "RASM", "WATCHDOG_TIMERS", "_Timespec_Subtract", "0x0800fb4c", $hit_77
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 78, "RASM", "WATCHDOG_TIMERS", "_Timespec_To_ticks", "0x0800fbe0", $hit_78
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 79, "RASM", "THREAD_LIFECYCLE", "_TLS_Get_allocation_size", "0x0800fd2e", $hit_79
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 80, "EDDI", "THREAD_LIFECYCLE", "_TLS_Get_allocation_size", "0x0800fd2e", $hit_80
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
