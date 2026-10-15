set pagination off
set confirm off
target remote :4242
load

break *0x0800a98e
commands
  silent
  set $hit_85 = $hit_85 + 1
  continue
end
set $hit_85 = 0

break *0x0800aa10
commands
  silent
  set $hit_86 = $hit_86 + 1
  continue
end
set $hit_86 = 0

break *0x0800aa46
commands
  silent
  set $hit_87 = $hit_87 + 1
  continue
end
set $hit_87 = 0

break *0x0800ac0a
commands
  silent
  set $hit_88 = $hit_88 + 1
  continue
end
set $hit_88 = 0

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 85, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Priority_extract", "0x0800a98e", $hit_85
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 86, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Priority_surrender", "0x0800aa10", $hit_86
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 87, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Priority_first", "0x0800aa46", $hit_87
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 88, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Priority_inherit_priority_actions", "0x0800ac0a", $hit_88
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
