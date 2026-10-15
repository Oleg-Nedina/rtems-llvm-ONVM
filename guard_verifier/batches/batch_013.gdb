set pagination off
set confirm off
target remote :4242
load

set $hit_49 = 0
set $hit_50 = 0
set $hit_51 = 0
set $hit_52 = 0

break *0x0800e53a
commands
  silent
  set $hit_49 = $hit_49 + 1
  if $hit_49 >= 5
    disable 1
  end
  continue
end

break *0x0800e56c
commands
  silent
  set $hit_50 = $hit_50 + 1
  if $hit_50 >= 5
    disable 2
  end
  continue
end

break *0x0800e6ce
commands
  silent
  set $hit_51 = $hit_51 + 1
  if $hit_51 >= 5
    disable 3
  end
  continue
end

break *0x0800e7e0
commands
  silent
  set $hit_52 = $hit_52 + 1
  if $hit_52 >= 5
    disable 4
  end
  continue
end

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 49, "RASM", "THREAD_LIFECYCLE", "_Thread_Kill_zombies", "0x0800e53a", $hit_49
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 50, "RASM", "THREAD_LIFECYCLE", "_Thread_Clear_waiting_for_join_at_exit", "0x0800e56c", $hit_50
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 51, "RASM", "THREAD_LIFECYCLE", "_Thread_Make_zombie", "0x0800e6ce", $hit_51
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 52, "RASM", "THREAD_LIFECYCLE", "_Thread_Try_life_change_request", "0x0800e7e0", $hit_52
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
