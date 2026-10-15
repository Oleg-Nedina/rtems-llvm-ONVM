set pagination off
set confirm off
target remote :4242
load

break *0x080065c6
commands
  silent
  set $hit_33 = $hit_33 + 1
  continue
end
set $hit_33 = 0

break *0x08006616
commands
  silent
  set $hit_34 = $hit_34 + 1
  continue
end
set $hit_34 = 0

break *0x08006666
commands
  silent
  set $hit_35 = $hit_35 + 1
  continue
end
set $hit_35 = 0

break *0x080066b2
commands
  silent
  set $hit_36 = $hit_36 + 1
  continue
end
set $hit_36 = 0

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 33, "RASM", "THREAD_LIFECYCLE", "_User_extensions_Thread_delete_visitor", "0x080065c6", $hit_33
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 34, "RASM", "THREAD_LIFECYCLE", "_User_extensions_Thread_start_visitor", "0x08006616", $hit_34
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 35, "RASM", "THREAD_LIFECYCLE", "_User_extensions_Thread_restart_visitor", "0x08006666", $hit_35
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 36, "RASM", "THREAD_LIFECYCLE", "_User_extensions_Thread_begin_visitor", "0x080066b2", $hit_36
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
