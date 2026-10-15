set pagination off
set confirm off
target remote :4242
load

break *0x08004452
commands
  silent
  set $hit_1 = $hit_1 + 1
  continue
end
set $hit_1 = 0

break *0x08004664
commands
  silent
  set $hit_2 = $hit_2 + 1
  continue
end
set $hit_2 = 0

break *0x080046c6
commands
  silent
  set $hit_3 = $hit_3 + 1
  continue
end
set $hit_3 = 0

break *0x08004c7a
commands
  silent
  set $hit_4 = $hit_4 + 1
  continue
end
set $hit_4 = 0

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 1, "RASM", "CLASSIC_API", "rtems_task_start", "0x08004452", $hit_1
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 2, "RASM", "OBJECTS_MEMORY", "_Chain_Initialize", "0x08004664", $hit_2
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 3, "RASM", "USER_EXTENSIONS", "_User_extensions_Fatal", "0x080046c6", $hit_3
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 4, "RASM", "OBJECTS_MEMORY", "_Objects_Allocate_static", "0x08004c7a", $hit_4
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
