set pagination off
set confirm off
target remote :4242
load

break *0x0800b448
commands
  silent
  set $hit_93 = $hit_93 + 1
  continue
end
set $hit_93 = 0

break *0x0800b572
commands
  silent
  set $hit_94 = $hit_94 + 1
  continue
end
set $hit_94 = 0

break *0x0800b572
commands
  silent
  set $hit_95 = $hit_95 + 1
  continue
end
set $hit_95 = 0

break *0x0800b6e4
commands
  silent
  set $hit_96 = $hit_96 + 1
  continue
end
set $hit_96 = 0

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 93, "RASM", "THREAD_LIFECYCLE", "_Thread_Set_life_protection", "0x0800b448", $hit_93
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 94, "RASM", "THREAD_LIFECYCLE", "_Thread_Wait_for_join_dup", "0x0800b572", $hit_94
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 95, "EDDI", "THREAD_LIFECYCLE", "_Thread_Wait_for_join_dup", "0x0800b572", $hit_95
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 96, "RASM", "THREAD_LIFECYCLE", "_Thread_Change_life_locked_dup", "0x0800b6e4", $hit_96
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
