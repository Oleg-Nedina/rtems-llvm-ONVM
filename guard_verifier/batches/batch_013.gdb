set pagination off
set confirm off
target remote :4242
load

break *0x08008058
commands
  silent
  set $hit_49 = $hit_49 + 1
  continue
end
set $hit_49 = 0

break *0x0800809c
commands
  silent
  set $hit_50 = $hit_50 + 1
  continue
end
set $hit_50 = 0

break *0x080080d6
commands
  silent
  set $hit_51 = $hit_51 + 1
  continue
end
set $hit_51 = 0

break *0x08008134
commands
  silent
  set $hit_52 = $hit_52 + 1
  continue
end
set $hit_52 = 0

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 49, "RASM", "CORE_SYSTEM", "rtems_initialize_executive", "0x08008058", $hit_49
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 50, "RASM", "CORE_SYSTEM", "_RTEMS_Lock_allocator", "0x0800809c", $hit_50
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 51, "RASM", "CORE_SYSTEM", "_RTEMS_Unlock_allocator", "0x080080d6", $hit_51
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 52, "RASM", "CORE_SYSTEM", "_API_Mutex_Lock", "0x08008134", $hit_52
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
