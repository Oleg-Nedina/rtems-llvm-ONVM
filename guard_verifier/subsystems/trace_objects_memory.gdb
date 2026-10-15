set pagination off
set confirm off
target remote :4242
load

break *0x08004664
commands
  silent
  set $hit_2 = $hit_2 + 1
  continue
end
set $hit_2 = 0

break *0x08004c7a
commands
  silent
  set $hit_4 = $hit_4 + 1
  continue
end
set $hit_4 = 0

break *0x08004caa
commands
  silent
  set $hit_5 = $hit_5 + 1
  continue
end
set $hit_5 = 0

break *0x08008488
commands
  silent
  set $hit_54 = $hit_54 + 1
  continue
end
set $hit_54 = 0

break *0x08008786
commands
  silent
  set $hit_58 = $hit_58 + 1
  continue
end
set $hit_58 = 0

break *0x080087d6
commands
  silent
  set $hit_59 = $hit_59 + 1
  continue
end
set $hit_59 = 0

break *0x08008810
commands
  silent
  set $hit_60 = $hit_60 + 1
  continue
end
set $hit_60 = 0

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

break *0x08012136
commands
  silent
  set $hit_130 = $hit_130 + 1
  continue
end
set $hit_130 = 0

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 2, "RASM", "OBJECTS_MEMORY", "_Chain_Initialize", "0x08004664", $hit_2
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 4, "RASM", "OBJECTS_MEMORY", "_Objects_Allocate_static", "0x08004c7a", $hit_4
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 5, "RASM", "OBJECTS_MEMORY", "_Objects_Free_static", "0x08004caa", $hit_5
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 54, "RASM", "OBJECTS_MEMORY", "_Heap_Allocate_aligned_with_boundary", "0x08008488", $hit_54
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 58, "RASM", "OBJECTS_MEMORY", "_Objects_Get", "0x08008786", $hit_58
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 59, "RASM", "OBJECTS_MEMORY", "_Protected_heap_Free", "0x080087d6", $hit_59
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 60, "RASM", "OBJECTS_MEMORY", "_Protected_heap_Get_free_information", "0x08008810", $hit_60
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 109, "RASM", "OBJECTS_MEMORY", "_Heap_Initialize", "0x0800c650", $hit_109
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 110, "RASM", "OBJECTS_MEMORY", "_Heap_Block_allocate", "0x0800c7c8", $hit_110
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 111, "RASM", "OBJECTS_MEMORY", "_Heap_Block_split", "0x0800c8f2", $hit_111
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 112, "RASM", "OBJECTS_MEMORY", "_Heap_Free", "0x0800cb84", $hit_112
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 113, "RASM", "OBJECTS_MEMORY", "_Heap_Get_free_information", "0x0800cd48", $hit_113
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 114, "RASM", "OBJECTS_MEMORY", "_Objects_Close", "0x0800cd7e", $hit_114
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 115, "RASM", "OBJECTS_MEMORY", "_Objects_Free_nothing", "0x0800cda0", $hit_115
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 116, "RASM", "OBJECTS_MEMORY", "_Objects_Initialize_information", "0x0800d05a", $hit_116
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 130, "RASM", "OBJECTS_MEMORY", "_Objects_Name_to_string", "0x08012136", $hit_130
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
