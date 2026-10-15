set pagination off
set confirm off
target remote :4242
load

break *0x0800a1f8
commands
  silent
  set $hit_77 = $hit_77 + 1
  continue
end
set $hit_77 = 0

break *0x0800a3ae
commands
  silent
  set $hit_78 = $hit_78 + 1
  continue
end
set $hit_78 = 0

break *0x0800a412
commands
  silent
  set $hit_79 = $hit_79 + 1
  continue
end
set $hit_79 = 0

break *0x0800a4e2
commands
  silent
  set $hit_80 = $hit_80 + 1
  continue
end
set $hit_80 = 0

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 77, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Enqueue_do_nothing_extra", "0x0800a1f8", $hit_77
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 78, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Enqueue", "0x0800a3ae", $hit_78
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 79, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Extract_locked", "0x0800a412", $hit_79
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 80, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Surrender", "0x0800a4e2", $hit_80
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
