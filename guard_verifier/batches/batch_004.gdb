set pagination off
set confirm off
target remote :4242
load

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

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 13, "RASM", "SCHEDULER", "_Scheduler_priority_Node_initialize", "0x080051bc", $hit_13
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 14, "RASM", "SCHEDULER", "_Scheduler_priority_Block", "0x080052fc", $hit_14
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 15, "RASM", "SCHEDULER", "_Scheduler_priority_Update_priority", "0x080055c8", $hit_15
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 16, "RASM", "SCHEDULER", "_Scheduler_priority_Schedule", "0x080056f0", $hit_16
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
