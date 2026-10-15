set pagination off
set confirm off
target remote :4242
load

break *0x080089f2
commands
  silent
  set $hit_61 = $hit_61 + 1
  continue
end
set $hit_61 = 0

break *0x080091e4
commands
  silent
  set $hit_62 = $hit_62 + 1
  continue
end
set $hit_62 = 0

break *0x08009230
commands
  silent
  set $hit_63 = $hit_63 + 1
  continue
end
set $hit_63 = 0

break *0x0800926a
commands
  silent
  set $hit_64 = $hit_64 + 1
  continue
end
set $hit_64 = 0

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 61, "RASM", "CORE_SYSTEM", "_RBTree_Extract", "0x080089f2", $hit_61
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 62, "RASM", "CORE_SYSTEM", "_RBTree_Insert_color", "0x080091e4", $hit_62
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 63, "RASM", "SCHEDULER", "_Scheduler_Handler_initialization", "0x08009230", $hit_63
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 64, "RASM", "THREAD_LIFECYCLE", "_Thread_Initialize_information", "0x0800926a", $hit_64
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
