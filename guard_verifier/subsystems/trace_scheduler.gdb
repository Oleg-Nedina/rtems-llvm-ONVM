set pagination off
set confirm off
target remote :4242
load

set $hit_13 = 0
set $hit_14 = 0
set $hit_15 = 0
set $hit_16 = 0
set $hit_17 = 0
set $hit_19 = 0
set $hit_20 = 0
set $hit_21 = 0
set $hit_22 = 0
set $hit_23 = 0
set $hit_24 = 0
set $hit_25 = 0
set $hit_122 = 0

break *0x0800c1f0
commands
  silent
  set $hit_13 = $hit_13 + 1
  if $hit_13 >= 5
    disable 1
  end
  continue
end

break *0x0800c21e
commands
  silent
  set $hit_14 = $hit_14 + 1
  if $hit_14 >= 5
    disable 2
  end
  continue
end

break *0x0800c248
commands
  silent
  set $hit_15 = $hit_15 + 1
  if $hit_15 >= 5
    disable 3
  end
  continue
end

break *0x0800c26c
commands
  silent
  set $hit_16 = $hit_16 + 1
  if $hit_16 >= 5
    disable 4
  end
  continue
end

break *0x0800c292
commands
  silent
  set $hit_17 = $hit_17 + 1
  if $hit_17 >= 5
    disable 5
  end
  continue
end

break *0x0800c66a
commands
  silent
  set $hit_19 = $hit_19 + 1
  if $hit_19 >= 5
    disable 6
  end
  continue
end

break *0x0800c6e0
commands
  silent
  set $hit_20 = $hit_20 + 1
  if $hit_20 >= 5
    disable 7
  end
  continue
end

break *0x0800c820
commands
  silent
  set $hit_21 = $hit_21 + 1
  if $hit_21 >= 5
    disable 8
  end
  continue
end

break *0x0800caec
commands
  silent
  set $hit_22 = $hit_22 + 1
  if $hit_22 >= 5
    disable 9
  end
  continue
end

break *0x0800cc14
commands
  silent
  set $hit_23 = $hit_23 + 1
  if $hit_23 >= 5
    disable 10
  end
  continue
end

break *0x0800cdfe
commands
  silent
  set $hit_24 = $hit_24 + 1
  if $hit_24 >= 5
    disable 11
  end
  continue
end

break *0x0800cf14
commands
  silent
  set $hit_25 = $hit_25 + 1
  if $hit_25 >= 5
    disable 12
  end
  continue
end

break *0x08013b38
commands
  silent
  set $hit_122 = $hit_122 + 1
  if $hit_122 >= 5
    disable 13
  end
  continue
end

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 13, "RASM", "SCHEDULER", "_Scheduler_default_Map_priority", "0x0800c1f0", $hit_13
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 14, "RASM", "SCHEDULER", "_Scheduler_default_Unmap_priority", "0x0800c21e", $hit_14
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 15, "RASM", "SCHEDULER", "_Scheduler_default_Node_destroy", "0x0800c248", $hit_15
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 16, "RASM", "SCHEDULER", "_Scheduler_default_Release_job", "0x0800c26c", $hit_16
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 17, "RASM", "SCHEDULER", "_Scheduler_default_Cancel_job", "0x0800c292", $hit_17
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 19, "RASM", "SCHEDULER", "_Scheduler_priority_Initialize", "0x0800c66a", $hit_19
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 20, "RASM", "SCHEDULER", "_Scheduler_priority_Node_initialize", "0x0800c6e0", $hit_20
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 21, "RASM", "SCHEDULER", "_Scheduler_priority_Block", "0x0800c820", $hit_21
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 22, "RASM", "SCHEDULER", "_Scheduler_priority_Update_priority", "0x0800caec", $hit_22
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 23, "RASM", "SCHEDULER", "_Scheduler_priority_Schedule", "0x0800cc14", $hit_23
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 24, "RASM", "SCHEDULER", "_Scheduler_priority_Unblock", "0x0800cdfe", $hit_24
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 25, "RASM", "SCHEDULER", "_Scheduler_priority_Yield", "0x0800cf14", $hit_25
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 122, "RASM", "SCHEDULER", "_Scheduler_Handler_initialization", "0x08013b38", $hit_122
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
