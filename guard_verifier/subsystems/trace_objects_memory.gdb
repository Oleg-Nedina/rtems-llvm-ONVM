set pagination off
set confirm off
target remote :4242
load

set $hit_108 = 0
set $hit_109 = 0
set $hit_115 = 0
set $hit_116 = 0
set $hit_117 = 0
set $hit_118 = 0
set $hit_138 = 0
set $hit_139 = 0
set $hit_140 = 0
set $hit_141 = 0
set $hit_146 = 0
set $hit_149 = 0

break *0x080126e8
commands
  silent
  set $hit_108 = $hit_108 + 1
  if $hit_108 >= 5
    disable 1
  end
  continue
end

break *0x080129b4
commands
  silent
  set $hit_109 = $hit_109 + 1
  if $hit_109 >= 5
    disable 2
  end
  continue
end

break *0x08012d1a
commands
  silent
  set $hit_115 = $hit_115 + 1
  if $hit_115 >= 5
    disable 3
  end
  continue
end

break *0x08012d3c
commands
  silent
  set $hit_116 = $hit_116 + 1
  if $hit_116 >= 5
    disable 4
  end
  continue
end

break *0x0801302a
commands
  silent
  set $hit_117 = $hit_117 + 1
  if $hit_117 >= 5
    disable 5
  end
  continue
end

break *0x08013064
commands
  silent
  set $hit_118 = $hit_118 + 1
  if $hit_118 >= 5
    disable 6
  end
  continue
end

break *0x08015c98
commands
  silent
  set $hit_138 = $hit_138 + 1
  if $hit_138 >= 5
    disable 7
  end
  continue
end

break *0x08015e10
commands
  silent
  set $hit_139 = $hit_139 + 1
  if $hit_139 >= 5
    disable 8
  end
  continue
end

break *0x08015f3a
commands
  silent
  set $hit_140 = $hit_140 + 1
  if $hit_140 >= 5
    disable 9
  end
  continue
end

break *0x080160fc
commands
  silent
  set $hit_141 = $hit_141 + 1
  if $hit_141 >= 5
    disable 10
  end
  continue
end

break *0x08025118
commands
  silent
  set $hit_146 = $hit_146 + 1
  if $hit_146 >= 5
    disable 11
  end
  continue
end

break *0x0802583a
commands
  silent
  set $hit_149 = $hit_149 + 1
  if $hit_149 >= 5
    disable 12
  end
  continue
end

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 108, "RASM", "OBJECTS_MEMORY", "_Heap_Allocate_aligned_with_boundary", "0x080126e8", $hit_108
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 109, "RASM", "OBJECTS_MEMORY", "_Heap_Free", "0x080129b4", $hit_109
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 115, "RASM", "OBJECTS_MEMORY", "_Objects_Close", "0x08012d1a", $hit_115
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 116, "RASM", "OBJECTS_MEMORY", "_Objects_Free_nothing", "0x08012d3c", $hit_116
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 117, "RASM", "OBJECTS_MEMORY", "_Protected_heap_Free", "0x0801302a", $hit_117
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 118, "RASM", "OBJECTS_MEMORY", "_Protected_heap_Get_free_information", "0x08013064", $hit_118
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 138, "RASM", "OBJECTS_MEMORY", "_Heap_Initialize", "0x08015c98", $hit_138
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 139, "RASM", "OBJECTS_MEMORY", "_Heap_Block_allocate", "0x08015e10", $hit_139
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 140, "RASM", "OBJECTS_MEMORY", "_Heap_Block_split", "0x08015f3a", $hit_140
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 141, "RASM", "OBJECTS_MEMORY", "_Heap_Get_free_information", "0x080160fc", $hit_141
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 146, "RASM", "OBJECTS_MEMORY", "_Heap_Resize_block", "0x08025118", $hit_146
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 149, "RASM", "OBJECTS_MEMORY", "_Objects_Name_to_string", "0x0802583a", $hit_149
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
