set pagination off
set confirm off
target remote :4242
load

break *0x0800cd48
commands
  silent
  set $hit_113 = $hit_113 + 1
  continue
end
set $hit_113 = 0

break *0x0800cd7e
commands
  silent
  set $hit_114 = $hit_114 + 1
  continue
end
set $hit_114 = 0

break *0x0800cda0
commands
  silent
  set $hit_115 = $hit_115 + 1
  continue
end
set $hit_115 = 0

break *0x0800d05a
commands
  silent
  set $hit_116 = $hit_116 + 1
  continue
end
set $hit_116 = 0

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 113, "RASM", "OBJECTS_MEMORY", "_Heap_Get_free_information", "0x0800cd48", $hit_113
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 114, "RASM", "OBJECTS_MEMORY", "_Objects_Close", "0x0800cd7e", $hit_114
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 115, "RASM", "OBJECTS_MEMORY", "_Objects_Free_nothing", "0x0800cda0", $hit_115
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 116, "RASM", "OBJECTS_MEMORY", "_Objects_Initialize_information", "0x0800d05a", $hit_116
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
