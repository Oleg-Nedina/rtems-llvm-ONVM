set pagination off
set confirm off
target remote :4242
load

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

break *0x08004d48
commands
  silent
  set $hit_9 = $hit_9 + 1
  continue
end
set $hit_9 = 0

break *0x08004d6e
commands
  silent
  set $hit_10 = $hit_10 + 1
  continue
end
set $hit_10 = 0

break *0x08005146
commands
  silent
  set $hit_12 = $hit_12 + 1
  continue
end
set $hit_12 = 0

break *0x080051bc
commands
  silent
  set $hit_13 = $hit_13 + 1
  continue
end
set $hit_13 = 0

break *0x080052fc
commands
  silent
  set $hit_14 = $hit_14 + 1
  continue
end
set $hit_14 = 0

break *0x080055c8
commands
  silent
  set $hit_15 = $hit_15 + 1
  continue
end
set $hit_15 = 0

break *0x080056f0
commands
  silent
  set $hit_16 = $hit_16 + 1
  continue
end
set $hit_16 = 0

break *0x080058da
commands
  silent
  set $hit_17 = $hit_17 + 1
  continue
end
set $hit_17 = 0

break *0x080059f0
commands
  silent
  set $hit_18 = $hit_18 + 1
  continue
end
set $hit_18 = 0

break *0x08009230
commands
  silent
  set $hit_63 = $hit_63 + 1
  continue
end
set $hit_63 = 0

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 6, "RASM", "SCHEDULER", "_Scheduler_default_Map_priority", "0x08004ccc", $hit_6
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 7, "RASM", "SCHEDULER", "_Scheduler_default_Unmap_priority", "0x08004cfa", $hit_7
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 8, "RASM", "SCHEDULER", "_Scheduler_default_Node_destroy", "0x08004d24", $hit_8
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 9, "RASM", "SCHEDULER", "_Scheduler_default_Release_job", "0x08004d48", $hit_9
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 10, "RASM", "SCHEDULER", "_Scheduler_default_Cancel_job", "0x08004d6e", $hit_10
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 12, "RASM", "SCHEDULER", "_Scheduler_priority_Initialize", "0x08005146", $hit_12
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 13, "RASM", "SCHEDULER", "_Scheduler_priority_Node_initialize", "0x080051bc", $hit_13
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 14, "RASM", "SCHEDULER", "_Scheduler_priority_Block", "0x080052fc", $hit_14
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 15, "RASM", "SCHEDULER", "_Scheduler_priority_Update_priority", "0x080055c8", $hit_15
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 16, "RASM", "SCHEDULER", "_Scheduler_priority_Schedule", "0x080056f0", $hit_16
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 17, "RASM", "SCHEDULER", "_Scheduler_priority_Unblock", "0x080058da", $hit_17
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 18, "RASM", "SCHEDULER", "_Scheduler_priority_Yield", "0x080059f0", $hit_18
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 63, "RASM", "SCHEDULER", "_Scheduler_Handler_initialization", "0x08009230", $hit_63
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
