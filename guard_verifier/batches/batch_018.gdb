set pagination off
set confirm off
target remote :4242
load

break *0x080098fc
commands
  silent
  set $hit_69 = $hit_69 + 1
  continue
end
set $hit_69 = 0

break *0x080099a6
commands
  silent
  set $hit_70 = $hit_70 + 1
  continue
end
set $hit_70 = 0

break *0x08009b7c
commands
  silent
  set $hit_71 = $hit_71 + 1
  continue
end
set $hit_71 = 0

break *0x08009b7c
commands
  silent
  set $hit_72 = $hit_72 + 1
  continue
end
set $hit_72 = 0

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 69, "RASM", "THREAD_LIFECYCLE", "_Thread_Clear_state_locked", "0x080098fc", $hit_69
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 70, "RASM", "THREAD_LIFECYCLE", "_Thread_Clear_state", "0x080099a6", $hit_70
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 71, "RASM", "THREAD_LIFECYCLE", "_Thread_Create_idle", "0x08009b7c", $hit_71
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 72, "EDDI", "THREAD_LIFECYCLE", "_Thread_Create_idle", "0x08009b7c", $hit_72
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
