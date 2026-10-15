set pagination off
set confirm off
target remote :4242
load

set $hit_9 = 0
set $hit_10 = 0
set $hit_11 = 0
set $hit_12 = 0

break *0x0800ba80
commands
  silent
  set $hit_9 = $hit_9 + 1
  if $hit_9 >= 5
    disable 1
  end
  continue
end

break *0x0800bab8
commands
  silent
  set $hit_10 = $hit_10 + 1
  if $hit_10 >= 5
    disable 2
  end
  continue
end

break *0x0800bb16
commands
  silent
  set $hit_11 = $hit_11 + 1
  if $hit_11 >= 5
    disable 3
  end
  continue
end

break *0x0800bb5e
commands
  silent
  set $hit_12 = $hit_12 + 1
  if $hit_12 >= 5
    disable 4
  end
  continue
end

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 9, "RASM", "CORE_SYSTEM", "_CORE_message_queue_Submit", "0x0800ba80", $hit_9
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 10, "RASM", "CORE_SYSTEM", "_CORE_message_queue_Workspace_allocate", "0x0800bab8", $hit_10
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 11, "RASM", "USER_EXTENSIONS", "_User_extensions_Fatal", "0x0800bb16", $hit_11
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 12, "RASM", "CORE_SYSTEM", "_ISR_Is_in_progress", "0x0800bb5e", $hit_12
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
