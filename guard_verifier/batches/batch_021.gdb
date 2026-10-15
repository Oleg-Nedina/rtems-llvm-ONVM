set pagination off
set confirm off
target remote :4242
load

break *0x0800a5ea
commands
  silent
  set $hit_81 = $hit_81 + 1
  continue
end
set $hit_81 = 0

break *0x0800a614
commands
  silent
  set $hit_82 = $hit_82 + 1
  continue
end
set $hit_82 = 0

break *0x0800a76c
commands
  silent
  set $hit_83 = $hit_83 + 1
  continue
end
set $hit_83 = 0

break *0x0800a910
commands
  silent
  set $hit_84 = $hit_84 + 1
  continue
end
set $hit_84 = 0

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 81, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Surrender_no_priority", "0x0800a5ea", $hit_81
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 82, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Do_nothing_priority_actions", "0x0800a614", $hit_82
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 83, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Priority_priority_actions", "0x0800a76c", $hit_83
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 84, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Priority_enqueue", "0x0800a910", $hit_84
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
