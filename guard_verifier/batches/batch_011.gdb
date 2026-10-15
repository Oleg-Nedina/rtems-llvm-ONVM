set pagination off
set confirm off
target remote :4242
load

set $hit_41 = 0
set $hit_42 = 0
set $hit_43 = 0
set $hit_44 = 0

break *0x0800dafe
commands
  silent
  set $hit_41 = $hit_41 + 1
  if $hit_41 >= 5
    disable 1
  end
  continue
end

break *0x0800db80
commands
  silent
  set $hit_42 = $hit_42 + 1
  if $hit_42 >= 5
    disable 2
  end
  continue
end

break *0x0800dbb6
commands
  silent
  set $hit_43 = $hit_43 + 1
  if $hit_43 >= 5
    disable 3
  end
  continue
end

break *0x0800dd7a
commands
  silent
  set $hit_44 = $hit_44 + 1
  if $hit_44 >= 5
    disable 4
  end
  continue
end

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 41, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Priority_extract", "0x0800dafe", $hit_41
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 42, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Priority_surrender", "0x0800db80", $hit_42
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 43, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Priority_first", "0x0800dbb6", $hit_43
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 44, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Priority_inherit_priority_actions", "0x0800dd7a", $hit_44
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
