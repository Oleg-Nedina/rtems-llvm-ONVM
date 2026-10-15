set pagination off
set confirm off
target remote :4242
load

set $hit_21 = 0
set $hit_22 = 0
set $hit_23 = 0
set $hit_24 = 0

break *0x0800c820
commands
  silent
  set $hit_21 = $hit_21 + 1
  if $hit_21 >= 5
    disable 1
  end
  continue
end

break *0x0800caec
commands
  silent
  set $hit_22 = $hit_22 + 1
  if $hit_22 >= 5
    disable 2
  end
  continue
end

break *0x0800cc14
commands
  silent
  set $hit_23 = $hit_23 + 1
  if $hit_23 >= 5
    disable 3
  end
  continue
end

break *0x0800cdfe
commands
  silent
  set $hit_24 = $hit_24 + 1
  if $hit_24 >= 5
    disable 4
  end
  continue
end

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 21, "RASM", "SCHEDULER", "_Scheduler_priority_Block", "0x0800c820", $hit_21
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 22, "RASM", "SCHEDULER", "_Scheduler_priority_Update_priority", "0x0800caec", $hit_22
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 23, "RASM", "SCHEDULER", "_Scheduler_priority_Schedule", "0x0800cc14", $hit_23
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 24, "RASM", "SCHEDULER", "_Scheduler_priority_Unblock", "0x0800cdfe", $hit_24
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
