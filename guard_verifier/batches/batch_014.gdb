set pagination off
set confirm off
target remote :4242
load

break *0x0800818c
commands
  silent
  set $hit_53 = $hit_53 + 1
  continue
end
set $hit_53 = 0

break *0x08008488
commands
  silent
  set $hit_54 = $hit_54 + 1
  continue
end
set $hit_54 = 0

break *0x08008508
commands
  silent
  set $hit_55 = $hit_55 + 1
  continue
end
set $hit_55 = 0

break *0x08008584
commands
  silent
  set $hit_56 = $hit_56 + 1
  continue
end
set $hit_56 = 0

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 53, "RASM", "CORE_SYSTEM", "_API_Mutex_Unlock", "0x0800818c", $hit_53
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 54, "RASM", "OBJECTS_MEMORY", "_Heap_Allocate_aligned_with_boundary", "0x08008488", $hit_54
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 55, "RASM", "CORE_SYSTEM", "_ISR_Handler_initialization", "0x08008508", $hit_55
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 56, "RASM", "CORE_SYSTEM", "_Mutex_recursive_Acquire", "0x08008584", $hit_56
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
