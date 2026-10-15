set pagination off
set confirm off
target remote :4242
load

set $hit_101 = 0
set $hit_102 = 0
set $hit_103 = 0
set $hit_104 = 0

break *0x08011fd0
commands
  silent
  set $hit_101 = $hit_101 + 1
  if $hit_101 >= 5
    disable 1
  end
  continue
end

break *0x08012014
commands
  silent
  set $hit_102 = $hit_102 + 1
  if $hit_102 >= 5
    disable 2
  end
  continue
end

break *0x0801204e
commands
  silent
  set $hit_103 = $hit_103 + 1
  if $hit_103 >= 5
    disable 3
  end
  continue
end

break *0x080120ac
commands
  silent
  set $hit_104 = $hit_104 + 1
  if $hit_104 >= 5
    disable 4
  end
  continue
end

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 101, "RASM", "CORE_SYSTEM", "rtems_initialize_executive", "0x08011fd0", $hit_101
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 102, "RASM", "CORE_SYSTEM", "_RTEMS_Lock_allocator", "0x08012014", $hit_102
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 103, "RASM", "CORE_SYSTEM", "_RTEMS_Unlock_allocator", "0x0801204e", $hit_103
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 104, "RASM", "CORE_SYSTEM", "_API_Mutex_Lock", "0x080120ac", $hit_104
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
