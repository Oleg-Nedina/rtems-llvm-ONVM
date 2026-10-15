set pagination off
set confirm off
target remote :4242
load

set $hit_113 = 0
set $hit_114 = 0
set $hit_115 = 0
set $hit_116 = 0

break *0x08012ba6
commands
  silent
  set $hit_113 = $hit_113 + 1
  if $hit_113 >= 5
    disable 1
  end
  continue
end

break *0x08012ca0
commands
  silent
  set $hit_114 = $hit_114 + 1
  if $hit_114 >= 5
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

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 113, "RASM", "CORE_SYSTEM", "_Mutex_recursive_Acquire", "0x08012ba6", $hit_113
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 114, "RASM", "CORE_SYSTEM", "_Mutex_recursive_Release", "0x08012ca0", $hit_114
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 115, "RASM", "OBJECTS_MEMORY", "_Objects_Close", "0x08012d1a", $hit_115
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 116, "RASM", "OBJECTS_MEMORY", "_Objects_Free_nothing", "0x08012d3c", $hit_116
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
