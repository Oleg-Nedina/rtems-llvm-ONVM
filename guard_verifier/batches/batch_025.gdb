set pagination off
set confirm off
target remote :4242
load

break *0x0800b6e4
commands
  silent
  set $hit_97 = $hit_97 + 1
  continue
end
set $hit_97 = 0

break *0x0800b806
commands
  silent
  set $hit_98 = $hit_98 + 1
  continue
end
set $hit_98 = 0

break *0x0800b988
commands
  silent
  set $hit_99 = $hit_99 + 1
  continue
end
set $hit_99 = 0

break *0x0800b988
commands
  silent
  set $hit_100 = $hit_100 + 1
  continue
end
set $hit_100 = 0

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 97, "EDDI", "THREAD_LIFECYCLE", "_Thread_Change_life_locked_dup", "0x0800b6e4", $hit_97
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 98, "RASM", "THREAD_LIFECYCLE", "_Thread_Make_zombie_dup", "0x0800b806", $hit_98
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 99, "EDDI", "THREAD_LIFECYCLE", "_Thread_Life_action_handler_dup", "0x0800b988", $hit_99
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 100, "RASM", "THREAD_LIFECYCLE", "_Thread_Life_action_handler_dup", "0x0800b988", $hit_100
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
