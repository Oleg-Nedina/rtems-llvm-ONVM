set pagination off
set confirm off
target remote :4242
load

set $hit_37 = 0
set $hit_38 = 0
set $hit_39 = 0
set $hit_40 = 0

break *0x0800d716
commands
  silent
  set $hit_37 = $hit_37 + 1
  if $hit_37 >= 5
    disable 1
  end
  continue
end

break *0x0800d784
commands
  silent
  set $hit_38 = $hit_38 + 1
  if $hit_38 >= 5
    disable 2
  end
  continue
end

break *0x0800d8dc
commands
  silent
  set $hit_39 = $hit_39 + 1
  if $hit_39 >= 5
    disable 3
  end
  continue
end

break *0x0800da80
commands
  silent
  set $hit_40 = $hit_40 + 1
  if $hit_40 >= 5
    disable 4
  end
  continue
end

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 37, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_FIFO_first", "0x0800d716", $hit_37
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 38, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_FIFO_surrender", "0x0800d784", $hit_38
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 39, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Priority_priority_actions", "0x0800d8dc", $hit_39
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 40, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Priority_enqueue", "0x0800da80", $hit_40
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
