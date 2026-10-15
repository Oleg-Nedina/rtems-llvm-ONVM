set pagination off
set confirm off
target remote :4242
load

break *0x080092d2
commands
  silent
  set $hit_65 = $hit_65 + 1
  continue
end
set $hit_65 = 0

break *0x0800935c
commands
  silent
  set $hit_66 = $hit_66 + 1
  continue
end
set $hit_66 = 0

break *0x080097b4
commands
  silent
  set $hit_67 = $hit_67 + 1
  continue
end
set $hit_67 = 0

break *0x08009862
commands
  silent
  set $hit_68 = $hit_68 + 1
  continue
end
set $hit_68 = 0

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 65, "RASM", "THREAD_LIFECYCLE", "_Thread_Handler_initialization", "0x080092d2", $hit_65
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 66, "RASM", "THREAD_LIFECYCLE", "_Thread_Priority_perform_actions", "0x0800935c", $hit_66
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 67, "RASM", "THREAD_LIFECYCLE", "_Thread_Priority_do_perform_actions", "0x080097b4", $hit_67
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 68, "RASM", "THREAD_LIFECYCLE", "_Thread_Priority_update", "0x08009862", $hit_68
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
