set pagination off
set confirm off
target remote :4242
load

set $hit_121 = 0
set $hit_122 = 0
set $hit_123 = 0
set $hit_124 = 0

break *0x08013af0
commands
  silent
  set $hit_121 = $hit_121 + 1
  if $hit_121 >= 5
    disable 1
  end
  continue
end

break *0x08013b38
commands
  silent
  set $hit_122 = $hit_122 + 1
  if $hit_122 >= 5
    disable 2
  end
  continue
end

break *0x08013c00
commands
  silent
  set $hit_123 = $hit_123 + 1
  if $hit_123 >= 5
    disable 3
  end
  continue
end

break *0x08014058
commands
  silent
  set $hit_124 = $hit_124 + 1
  if $hit_124 >= 5
    disable 4
  end
  continue
end

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 121, "RASM", "CORE_SYSTEM", "_RBTree_Minimum", "0x08013af0", $hit_121
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 122, "RASM", "SCHEDULER", "_Scheduler_Handler_initialization", "0x08013b38", $hit_122
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 123, "RASM", "THREAD_LIFECYCLE", "_Thread_Priority_perform_actions", "0x08013c00", $hit_123
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 124, "RASM", "THREAD_LIFECYCLE", "_Thread_Priority_do_perform_actions", "0x08014058", $hit_124
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
