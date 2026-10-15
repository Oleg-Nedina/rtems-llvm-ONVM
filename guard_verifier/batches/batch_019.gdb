set pagination off
set confirm off
target remote :4242
load

break *0x08009bb8
commands
  silent
  set $hit_73 = $hit_73 + 1
  continue
end
set $hit_73 = 0

break *0x08009cd6
commands
  silent
  set $hit_74 = $hit_74 + 1
  continue
end
set $hit_74 = 0

break *0x0800a114
commands
  silent
  set $hit_75 = $hit_75 + 1
  continue
end
set $hit_75 = 0

break *0x0800a1a4
commands
  silent
  set $hit_76 = $hit_76 + 1
  continue
end
set $hit_76 = 0

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 73, "RASM", "THREAD_LIFECYCLE", "_Thread_Entry_adaptor_idle", "0x08009bb8", $hit_73
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 74, "RASM", "THREAD_LIFECYCLE", "_Thread_Free", "0x08009cd6", $hit_74
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 75, "RASM", "THREAD_LIFECYCLE", "_Thread_Initialize", "0x0800a114", $hit_75
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 76, "RASM", "THREAD_LIFECYCLE", "_Thread_Load_environment", "0x0800a1a4", $hit_76
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
