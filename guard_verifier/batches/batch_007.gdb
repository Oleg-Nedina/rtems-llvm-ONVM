set pagination off
set confirm off
target remote :4242
load

break *0x08005e2e
commands
  silent
  set $hit_25 = $hit_25 + 1
  continue
end
set $hit_25 = 0

break *0x08005eae
commands
  silent
  set $hit_26 = $hit_26 + 1
  continue
end
set $hit_26 = 0

break *0x08005f6a
commands
  silent
  set $hit_27 = $hit_27 + 1
  continue
end
set $hit_27 = 0

break *0x08006074
commands
  silent
  set $hit_28 = $hit_28 + 1
  continue
end
set $hit_28 = 0

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 25, "RASM", "THREAD_LIFECYCLE", "_Thread_Set_state_locked", "0x08005e2e", $hit_25
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 26, "RASM", "THREAD_LIFECYCLE", "_Thread_Set_state", "0x08005eae", $hit_26
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 27, "RASM", "THREAD_LIFECYCLE", "_Thread_Start", "0x08005f6a", $hit_27
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 28, "RASM", "THREAD_LIFECYCLE", "_Thread_Continue", "0x08006074", $hit_28
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
