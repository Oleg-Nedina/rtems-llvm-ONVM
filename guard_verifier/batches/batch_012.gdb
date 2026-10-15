set pagination off
set confirm off
target remote :4242
load

set $hit_45 = 0
set $hit_46 = 0
set $hit_47 = 0
set $hit_48 = 0

break *0x0800dfe0
commands
  silent
  set $hit_45 = $hit_45 + 1
  if $hit_45 >= 5
    disable 1
  end
  continue
end

break *0x0800e0e0
commands
  silent
  set $hit_46 = $hit_46 + 1
  if $hit_46 >= 5
    disable 2
  end
  continue
end

break *0x0800e3e2
commands
  silent
  set $hit_47 = $hit_47 + 1
  if $hit_47 >= 5
    disable 3
  end
  continue
end

break *0x0800e46a
commands
  silent
  set $hit_48 = $hit_48 + 1
  if $hit_48 >= 5
    disable 4
  end
  continue
end

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 45, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Priority_inherit_enqueue", "0x0800dfe0", $hit_45
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 46, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Priority_inherit_extract", "0x0800e0e0", $hit_46
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 47, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Priority_inherit_surrender", "0x0800e3e2", $hit_47
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 48, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Add_timeout_ticks", "0x0800e46a", $hit_48
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
