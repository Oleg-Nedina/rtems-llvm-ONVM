set pagination off
set confirm off
target remote :4242
load

set $hit_97 = 0
set $hit_98 = 0
set $hit_99 = 0
set $hit_100 = 0

break *0x08010c18
commands
  silent
  set $hit_97 = $hit_97 + 1
  if $hit_97 >= 5
    disable 1
  end
  continue
end

break *0x08011da6
commands
  silent
  set $hit_98 = $hit_98 + 1
  if $hit_98 >= 5
    disable 2
  end
  continue
end

break *0x08011dde
commands
  silent
  set $hit_99 = $hit_99 + 1
  if $hit_99 >= 5
    disable 3
  end
  continue
end

break *0x08011f5c
commands
  silent
  set $hit_100 = $hit_100 + 1
  if $hit_100 >= 5
    disable 4
  end
  continue
end

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 97, "RASM", "CORE_SYSTEM", "_Workspace_Malloc_initialize_unified", "0x08010c18", $hit_97
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 98, "RASM", "CORE_SYSTEM", "_Message_queue_Create", "0x08011da6", $hit_98
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 99, "RASM", "CORE_SYSTEM", "_Message_queue_Manager_initialization", "0x08011dde", $hit_99
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 100, "RASM", "CORE_SYSTEM", "rtems_initialize_data_structures", "0x08011f5c", $hit_100
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
