set pagination off
set confirm off
target remote :4242
load

set $hit_117 = 0
set $hit_118 = 0
set $hit_119 = 0
set $hit_120 = 0

break *0x0801302a
commands
  silent
  set $hit_117 = $hit_117 + 1
  if $hit_117 >= 5
    disable 1
  end
  continue
end

break *0x08013064
commands
  silent
  set $hit_118 = $hit_118 + 1
  if $hit_118 >= 5
    disable 2
  end
  continue
end

break *0x08013246
commands
  silent
  set $hit_119 = $hit_119 + 1
  if $hit_119 >= 5
    disable 3
  end
  continue
end

break *0x08013a38
commands
  silent
  set $hit_120 = $hit_120 + 1
  if $hit_120 >= 5
    disable 4
  end
  continue
end

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 117, "RASM", "OBJECTS_MEMORY", "_Protected_heap_Free", "0x0801302a", $hit_117
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 118, "RASM", "OBJECTS_MEMORY", "_Protected_heap_Get_free_information", "0x08013064", $hit_118
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 119, "RASM", "CORE_SYSTEM", "_RBTree_Extract", "0x08013246", $hit_119
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 120, "RASM", "CORE_SYSTEM", "_RBTree_Insert_color", "0x08013a38", $hit_120
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
