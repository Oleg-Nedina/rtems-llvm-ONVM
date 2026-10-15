set pagination off
set confirm off
target remote :4242
load

break *0x0800c650
commands
  silent
  set $hit_109 = $hit_109 + 1
  continue
end
set $hit_109 = 0

break *0x0800c7c8
commands
  silent
  set $hit_110 = $hit_110 + 1
  continue
end
set $hit_110 = 0

break *0x0800c8f2
commands
  silent
  set $hit_111 = $hit_111 + 1
  continue
end
set $hit_111 = 0

break *0x0800cb84
commands
  silent
  set $hit_112 = $hit_112 + 1
  continue
end
set $hit_112 = 0

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 109, "RASM", "OBJECTS_MEMORY", "_Heap_Initialize", "0x0800c650", $hit_109
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 110, "RASM", "OBJECTS_MEMORY", "_Heap_Block_allocate", "0x0800c7c8", $hit_110
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 111, "RASM", "OBJECTS_MEMORY", "_Heap_Block_split", "0x0800c8f2", $hit_111
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 112, "RASM", "OBJECTS_MEMORY", "_Heap_Free", "0x0800cb84", $hit_112
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
