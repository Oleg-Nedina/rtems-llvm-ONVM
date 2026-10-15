set pagination off
set confirm off
target remote :4242
load

set $hit_85 = 0
set $hit_86 = 0
set $hit_87 = 0
set $hit_88 = 0

break *0x08010272
commands
  silent
  set $hit_85 = $hit_85 + 1
  if $hit_85 >= 5
    disable 1
  end
  continue
end

break *0x080102be
commands
  silent
  set $hit_86 = $hit_86 + 1
  if $hit_86 >= 5
    disable 2
  end
  continue
end

break *0x0801030a
commands
  silent
  set $hit_87 = $hit_87 + 1
  if $hit_87 >= 5
    disable 3
  end
  continue
end

break *0x0801035c
commands
  silent
  set $hit_88 = $hit_88 + 1
  if $hit_88 >= 5
    disable 4
  end
  continue
end

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 85, "RASM", "THREAD_LIFECYCLE", "_User_extensions_Thread_restart_visitor", "0x08010272", $hit_85
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 86, "RASM", "THREAD_LIFECYCLE", "_User_extensions_Thread_begin_visitor", "0x080102be", $hit_86
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 87, "RASM", "THREAD_LIFECYCLE", "_User_extensions_Thread_exitted_visitor", "0x0801030a", $hit_87
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 88, "RASM", "USER_EXTENSIONS", "_User_extensions_Fatal_visitor", "0x0801035c", $hit_88
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
