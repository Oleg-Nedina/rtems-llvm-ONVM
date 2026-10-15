set pagination off
set confirm off
target remote :4242
load

break *0x080066fe
commands
  silent
  set $hit_37 = $hit_37 + 1
  continue
end
set $hit_37 = 0

break *0x08006750
commands
  silent
  set $hit_38 = $hit_38 + 1
  continue
end
set $hit_38 = 0

break *0x0800679e
commands
  silent
  set $hit_39 = $hit_39 + 1
  continue
end
set $hit_39 = 0

break *0x08006a80
commands
  silent
  set $hit_40 = $hit_40 + 1
  continue
end
set $hit_40 = 0

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 37, "RASM", "THREAD_LIFECYCLE", "_User_extensions_Thread_exitted_visitor", "0x080066fe", $hit_37
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 38, "RASM", "USER_EXTENSIONS", "_User_extensions_Fatal_visitor", "0x08006750", $hit_38
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 39, "RASM", "THREAD_LIFECYCLE", "_User_extensions_Thread_terminate_visitor", "0x0800679e", $hit_39
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 40, "RASM", "USER_EXTENSIONS", "_User_extensions_Iterate", "0x08006a80", $hit_40
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
