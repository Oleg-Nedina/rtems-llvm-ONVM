set pagination off
set confirm off
target remote :4242
load

break *0x080086ae
commands
  silent
  set $hit_57 = $hit_57 + 1
  continue
end
set $hit_57 = 0

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

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 57, "RASM", "CORE_SYSTEM", "_Mutex_recursive_Release", "0x080086ae", $hit_57
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 58, "RASM", "OBJECTS_MEMORY", "_Objects_Get", "0x08008786", $hit_58
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 59, "RASM", "OBJECTS_MEMORY", "_Protected_heap_Free", "0x080087d6", $hit_59
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 60, "RASM", "OBJECTS_MEMORY", "_Protected_heap_Get_free_information", "0x08008810", $hit_60
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
