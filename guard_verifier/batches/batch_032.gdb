set pagination off
set confirm off
target remote :4242
load

set $hit_125 = 0
set $hit_126 = 0
set $hit_127 = 0
set $hit_128 = 0

break *0x08014106
commands
  silent
  set $hit_125 = $hit_125 + 1
  if $hit_125 >= 5
    disable 1
  end
  continue
end

break *0x080141a0
commands
  silent
  set $hit_126 = $hit_126 + 1
  if $hit_126 >= 5
    disable 2
  end
  continue
end

break *0x0801424a
commands
  silent
  set $hit_127 = $hit_127 + 1
  if $hit_127 >= 5
    disable 3
  end
  continue
end

break *0x080143dc
commands
  silent
  set $hit_128 = $hit_128 + 1
  if $hit_128 >= 5
    disable 4
  end
  continue
end

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 125, "RASM", "THREAD_LIFECYCLE", "_Thread_Priority_update", "0x08014106", $hit_125
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 126, "RASM", "THREAD_LIFECYCLE", "_Thread_Clear_state_locked", "0x080141a0", $hit_126
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 127, "RASM", "THREAD_LIFECYCLE", "_Thread_Clear_state", "0x0801424a", $hit_127
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 128, "RASM", "THREAD_LIFECYCLE", "_Thread_Create_idle", "0x080143dc", $hit_128
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
