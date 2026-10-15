set pagination off
set confirm off
target remote :4242
load

set $hit_109 = 0
set $hit_110 = 0
set $hit_111 = 0
set $hit_112 = 0

break *0x080129b4
commands
  silent
  set $hit_109 = $hit_109 + 1
  if $hit_109 >= 5
    disable 1
  end
  continue
end

break *0x080129fc
commands
  silent
  set $hit_110 = $hit_110 + 1
  if $hit_110 >= 5
    disable 2
  end
  continue
end

break *0x08012a6e
commands
  silent
  set $hit_111 = $hit_111 + 1
  if $hit_111 >= 5
    disable 3
  end
  continue
end

break *0x08012b10
commands
  silent
  set $hit_112 = $hit_112 + 1
  if $hit_112 >= 5
    disable 4
  end
  continue
end

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 109, "RASM", "OBJECTS_MEMORY", "_Heap_Free", "0x080129b4", $hit_109
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 110, "RASM", "CORE_SYSTEM", "_ISR_Handler_initialization", "0x080129fc", $hit_110
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 111, "RASM", "CORE_SYSTEM", "_Mutex_Acquire", "0x08012a6e", $hit_111
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 112, "RASM", "CORE_SYSTEM", "_Mutex_Release", "0x08012b10", $hit_112
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
