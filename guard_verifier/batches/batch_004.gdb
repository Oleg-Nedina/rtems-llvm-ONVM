set pagination off
set confirm off
target remote :4242
load

set $hit_13 = 0
set $hit_14 = 0
set $hit_15 = 0
set $hit_16 = 0

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

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 13, "RASM", "SCHEDULER", "_Scheduler_default_Map_priority", "0x0800c1f0", $hit_13
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 14, "RASM", "SCHEDULER", "_Scheduler_default_Unmap_priority", "0x0800c21e", $hit_14
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 15, "RASM", "SCHEDULER", "_Scheduler_default_Node_destroy", "0x0800c248", $hit_15
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 16, "RASM", "SCHEDULER", "_Scheduler_default_Release_job", "0x0800c26c", $hit_16
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
