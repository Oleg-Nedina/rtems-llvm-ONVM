set pagination off
set confirm off
target remote :4242
load

set $hit_57 = 0
set $hit_58 = 0
set $hit_59 = 0
set $hit_60 = 0

break *0x0800f014
commands
  silent
  set $hit_57 = $hit_57 + 1
  set $hit_58 = $hit_58 + 1
  if $hit_57 >= 5
    disable 1
  end
  continue
end

break *0x0800f13e
commands
  silent
  set $hit_59 = $hit_59 + 1
  set $hit_60 = $hit_60 + 1
  if $hit_59 >= 5
    disable 2
  end
  continue
end

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 57, "EDDI", "THREAD_LIFECYCLE", "_Thread_Life_action_handler_dup", "0x0800f014", $hit_57
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 58, "RASM", "THREAD_LIFECYCLE", "_Thread_Life_action_handler_dup", "0x0800f014", $hit_58
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 59, "RASM", "THREAD_LIFECYCLE", "_Thread_Wait_for_join_dup", "0x0800f13e", $hit_59
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 60, "EDDI", "THREAD_LIFECYCLE", "_Thread_Wait_for_join_dup", "0x0800f13e", $hit_60
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
