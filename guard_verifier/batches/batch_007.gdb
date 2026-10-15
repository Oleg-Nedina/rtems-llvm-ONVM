set pagination off
set confirm off
target remote :4242
load

set $hit_25 = 0
set $hit_26 = 0
set $hit_27 = 0
set $hit_28 = 0

break *0x0800cf14
commands
  silent
  set $hit_25 = $hit_25 + 1
  if $hit_25 >= 5
    disable 1
  end
  continue
end

break *0x0800cf5e
commands
  silent
  set $hit_26 = $hit_26 + 1
  if $hit_26 >= 5
    disable 2
  end
  continue
end

break *0x0800d07c
commands
  silent
  set $hit_27 = $hit_27 + 1
  if $hit_27 >= 5
    disable 3
  end
  continue
end

break *0x0800d106
commands
  silent
  set $hit_28 = $hit_28 + 1
  if $hit_28 >= 5
    disable 4
  end
  continue
end

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 25, "RASM", "SCHEDULER", "_Scheduler_priority_Yield", "0x0800cf14", $hit_25
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 26, "RASM", "THREAD_LIFECYCLE", "_Stack_Allocator_allocate_for_idle_workspace", "0x0800cf5e", $hit_26
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 27, "EDDI", "THREAD_LIFECYCLE", "_Thread_Do_dispatch", "0x0800d07c", $hit_27
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 28, "RASM", "THREAD_LIFECYCLE", "_Thread_Entry_adaptor_numeric", "0x0800d106", $hit_28
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
