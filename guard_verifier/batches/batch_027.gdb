set pagination off
set confirm off
target remote :4242
load

set $hit_105 = 0
set $hit_106 = 0
set $hit_107 = 0
set $hit_108 = 0

break *0x08012104
commands
  silent
  set $hit_105 = $hit_105 + 1
  if $hit_105 >= 5
    disable 1
  end
  continue
end

break *0x08012216
commands
  silent
  set $hit_106 = $hit_106 + 1
  if $hit_106 >= 5
    disable 2
  end
  continue
end

break *0x080123e8
commands
  silent
  set $hit_107 = $hit_107 + 1
  if $hit_107 >= 5
    disable 3
  end
  continue
end

break *0x080126e8
commands
  silent
  set $hit_108 = $hit_108 + 1
  if $hit_108 >= 5
    disable 4
  end
  continue
end

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 105, "RASM", "CORE_SYSTEM", "_API_Mutex_Unlock", "0x08012104", $hit_105
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 106, "RASM", "CORE_SYSTEM", "_CORE_message_queue_Initialize", "0x08012216", $hit_106
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 107, "RASM", "CORE_SYSTEM", "_CORE_message_queue_Insert_message", "0x080123e8", $hit_107
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 108, "RASM", "OBJECTS_MEMORY", "_Heap_Allocate_aligned_with_boundary", "0x080126e8", $hit_108
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
