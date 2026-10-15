set pagination off
set confirm off
target remote :4242
load

break *0x0800ae70
commands
  silent
  set $hit_89 = $hit_89 + 1
  continue
end
set $hit_89 = 0

break *0x0800af70
commands
  silent
  set $hit_90 = $hit_90 + 1
  continue
end
set $hit_90 = 0

break *0x0800b272
commands
  silent
  set $hit_91 = $hit_91 + 1
  continue
end
set $hit_91 = 0

break *0x0800b34a
commands
  silent
  set $hit_92 = $hit_92 + 1
  continue
end
set $hit_92 = 0

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 89, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Priority_inherit_enqueue", "0x0800ae70", $hit_89
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 90, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Priority_inherit_extract", "0x0800af70", $hit_90
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 91, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Priority_inherit_surrender", "0x0800b272", $hit_91
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 92, "RASM", "THREAD_LIFECYCLE", "_Thread_Kill_zombies", "0x0800b34a", $hit_92
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
