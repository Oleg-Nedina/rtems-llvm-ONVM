set pagination off
set confirm off
target remote :4242
load

set $hit_53 = 0
set $hit_54 = 0
set $hit_55 = 0
set $hit_56 = 0

break *0x0800ea86
commands
  silent
  set $hit_53 = $hit_53 + 1
  if $hit_53 >= 5
    disable 1
  end
  continue
end

break *0x0800eb94
commands
  silent
  set $hit_54 = $hit_54 + 1
  if $hit_54 >= 5
    disable 2
  end
  continue
end

break *0x0800ed6c
commands
  silent
  set $hit_55 = $hit_55 + 1
  if $hit_55 >= 5
    disable 3
  end
  continue
end

break *0x0800ee86
commands
  silent
  set $hit_56 = $hit_56 + 1
  if $hit_56 >= 5
    disable 4
  end
  continue
end

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 53, "RASM", "THREAD_LIFECYCLE", "_Thread_Wait_for_join", "0x0800ea86", $hit_53
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 54, "RASM", "USER_EXTENSIONS", "_User_extensions_Destroy_iterators", "0x0800eb94", $hit_54
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 55, "RASM", "THREAD_LIFECYCLE", "_Thread_Cancel_ret", "0x0800ed6c", $hit_55
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 56, "RASM", "THREAD_LIFECYCLE", "_Thread_Make_zombie_dup", "0x0800ee86", $hit_56
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
