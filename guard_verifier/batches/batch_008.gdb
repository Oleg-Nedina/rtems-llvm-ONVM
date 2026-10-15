set pagination off
set confirm off
target remote :4242
load

break *0x080060a8
commands
  silent
  set $hit_29 = $hit_29 + 1
  continue
end
set $hit_29 = 0

break *0x08006124
commands
  silent
  set $hit_30 = $hit_30 + 1
  continue
end
set $hit_30 = 0

break *0x080064f4
commands
  silent
  set $hit_31 = $hit_31 + 1
  continue
end
set $hit_31 = 0

break *0x08006576
commands
  silent
  set $hit_32 = $hit_32 + 1
  continue
end
set $hit_32 = 0

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 29, "RASM", "THREAD_LIFECYCLE", "_Thread_Timeout", "0x080060a8", $hit_29
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 30, "RASM", "THREAD_LIFECYCLE", "_Thread_Yield", "0x08006124", $hit_30
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 31, "RASM", "USER_EXTENSIONS", "_User_extensions_Handler_initialization", "0x080064f4", $hit_31
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 32, "RASM", "THREAD_LIFECYCLE", "_User_extensions_Thread_create_visitor", "0x08006576", $hit_32
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
