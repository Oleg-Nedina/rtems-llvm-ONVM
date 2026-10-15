set pagination off
set confirm off
target remote :4242
load

set $hit_65 = 0
set $hit_66 = 0
set $hit_67 = 0
set $hit_68 = 0

break *0x0800f456
commands
  silent
  set $hit_65 = $hit_65 + 1
  if $hit_65 >= 5
    disable 1
  end
  continue
end

break *0x0800f498
commands
  silent
  set $hit_66 = $hit_66 + 1
  if $hit_66 >= 5
    disable 2
  end
  continue
end

break *0x0800f4c8
commands
  silent
  set $hit_67 = $hit_67 + 1
  if $hit_67 >= 5
    disable 3
  end
  continue
end

break *0x0800f63c
commands
  silent
  set $hit_68 = $hit_68 + 1
  if $hit_68 >= 5
    disable 4
  end
  continue
end

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 65, "RASM", "THREAD_LIFECYCLE", "_Thread_Set_state", "0x0800f456", $hit_65
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 66, "RASM", "CORE_SYSTEM", "_Stack_Allocate", "0x0800f498", $hit_66
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 67, "RASM", "CORE_SYSTEM", "_Stack_Free", "0x0800f4c8", $hit_67
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 68, "RASM", "THREAD_LIFECYCLE", "_Thread_Continue", "0x0800f63c", $hit_68
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
