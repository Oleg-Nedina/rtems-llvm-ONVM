set pagination off
set confirm off
target remote :4242
load

break *0x08004caa
commands
  silent
  set $hit_5 = $hit_5 + 1
  continue
end
set $hit_5 = 0

break *0x08004ccc
commands
  silent
  set $hit_6 = $hit_6 + 1
  continue
end
set $hit_6 = 0

break *0x08004cfa
commands
  silent
  set $hit_7 = $hit_7 + 1
  continue
end
set $hit_7 = 0

break *0x08004d24
commands
  silent
  set $hit_8 = $hit_8 + 1
  continue
end
set $hit_8 = 0

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 5, "RASM", "OBJECTS_MEMORY", "_Objects_Free_static", "0x08004caa", $hit_5
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 6, "RASM", "SCHEDULER", "_Scheduler_default_Map_priority", "0x08004ccc", $hit_6
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 7, "RASM", "SCHEDULER", "_Scheduler_default_Unmap_priority", "0x08004cfa", $hit_7
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 8, "RASM", "SCHEDULER", "_Scheduler_default_Node_destroy", "0x08004d24", $hit_8
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
