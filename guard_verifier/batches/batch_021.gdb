set pagination off
set confirm off
target remote :4242
load

set $hit_81 = 0
set $hit_82 = 0
set $hit_83 = 0
set $hit_84 = 0

break *0x08010100
commands
  silent
  set $hit_81 = $hit_81 + 1
  if $hit_81 >= 5
    disable 1
  end
  continue
end

break *0x08010182
commands
  silent
  set $hit_82 = $hit_82 + 1
  if $hit_82 >= 5
    disable 2
  end
  continue
end

break *0x080101d2
commands
  silent
  set $hit_83 = $hit_83 + 1
  if $hit_83 >= 5
    disable 3
  end
  continue
end

break *0x08010222
commands
  silent
  set $hit_84 = $hit_84 + 1
  if $hit_84 >= 5
    disable 4
  end
  continue
end

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 81, "RASM", "USER_EXTENSIONS", "_User_extensions_Handler_initialization", "0x08010100", $hit_81
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 82, "RASM", "THREAD_LIFECYCLE", "_User_extensions_Thread_create_visitor", "0x08010182", $hit_82
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 83, "RASM", "THREAD_LIFECYCLE", "_User_extensions_Thread_delete_visitor", "0x080101d2", $hit_83
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 84, "RASM", "THREAD_LIFECYCLE", "_User_extensions_Thread_start_visitor", "0x08010222", $hit_84
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
