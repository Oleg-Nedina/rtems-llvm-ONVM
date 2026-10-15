set pagination off
set confirm off
target remote :4242
load

set $hit_137 = 0
set $hit_138 = 0
set $hit_139 = 0
set $hit_140 = 0

break *0x08014d58
commands
  silent
  set $hit_137 = $hit_137 + 1
  if $hit_137 >= 5
    disable 1
  end
  continue
end

break *0x08015c98
commands
  silent
  set $hit_138 = $hit_138 + 1
  if $hit_138 >= 5
    disable 2
  end
  continue
end

break *0x08015e10
commands
  silent
  set $hit_139 = $hit_139 + 1
  if $hit_139 >= 5
    disable 3
  end
  continue
end

break *0x08015f3a
commands
  silent
  set $hit_140 = $hit_140 + 1
  if $hit_140 >= 5
    disable 4
  end
  continue
end

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 137, "RASM", "USER_EXTENSIONS", "_User_extensions_Add_set", "0x08014d58", $hit_137
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 138, "RASM", "OBJECTS_MEMORY", "_Heap_Initialize", "0x08015c98", $hit_138
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 139, "RASM", "OBJECTS_MEMORY", "_Heap_Block_allocate", "0x08015e10", $hit_139
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 140, "RASM", "OBJECTS_MEMORY", "_Heap_Block_split", "0x08015f3a", $hit_140
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
