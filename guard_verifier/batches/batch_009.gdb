set pagination off
set confirm off
target remote :4242
load

set $hit_33 = 0
set $hit_34 = 0
set $hit_35 = 0
set $hit_36 = 0

break *0x0800d3e6
commands
  silent
  set $hit_33 = $hit_33 + 1
  if $hit_33 >= 5
    disable 1
  end
  continue
end

break *0x0800d5c0
commands
  silent
  set $hit_34 = $hit_34 + 1
  if $hit_34 >= 5
    disable 2
  end
  continue
end

break *0x0800d67e
commands
  silent
  set $hit_35 = $hit_35 + 1
  if $hit_35 >= 5
    disable 3
  end
  continue
end

break *0x0800d6e8
commands
  silent
  set $hit_36 = $hit_36 + 1
  if $hit_36 >= 5
    disable 4
  end
  continue
end

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 33, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Extract_locked", "0x0800d3e6", $hit_33
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 34, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Do_nothing_priority_actions", "0x0800d5c0", $hit_34
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 35, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_FIFO_enqueue", "0x0800d67e", $hit_35
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 36, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_FIFO_extract", "0x0800d6e8", $hit_36
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
