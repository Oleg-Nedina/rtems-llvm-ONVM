set pagination off
set confirm off
target remote :4242
load

set $hit_29 = 0
set $hit_30 = 0
set $hit_31 = 0
set $hit_32 = 0

break *0x0800d1f4
commands
  silent
  set $hit_29 = $hit_29 + 1
  if $hit_29 >= 5
    disable 1
  end
  continue
end

break *0x0800d238
commands
  silent
  set $hit_30 = $hit_30 + 1
  if $hit_30 >= 5
    disable 2
  end
  continue
end

break *0x0800d25c
commands
  silent
  set $hit_31 = $hit_31 + 1
  if $hit_31 >= 5
    disable 3
  end
  continue
end

break *0x0800d288
commands
  silent
  set $hit_32 = $hit_32 + 1
  if $hit_32 >= 5
    disable 4
  end
  continue
end

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 29, "RASM", "THREAD_LIFECYCLE", "_User_extensions_Thread_begin_dup", "0x0800d1f4", $hit_29
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 30, "RASM", "THREAD_LIFECYCLE", "_User_extensions_Thread_exitted_dup", "0x0800d238", $hit_30
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 31, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Enqueue_do_nothing_extra", "0x0800d25c", $hit_31
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 32, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Deadlock_status", "0x0800d288", $hit_32
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
