set pagination off
set confirm off
target remote :4242
load

set $hit_61 = 0
set $hit_62 = 0
set $hit_63 = 0
set $hit_64 = 0

break *0x0800f31e
commands
  silent
  set $hit_61 = $hit_61 + 1
  set $hit_62 = $hit_62 + 1
  if $hit_61 >= 5
    disable 1
  end
  continue
end

break *0x0800f35e
commands
  silent
  set $hit_63 = $hit_63 + 1
  if $hit_63 >= 5
    disable 2
  end
  continue
end

break *0x0800f3d6
commands
  silent
  set $hit_64 = $hit_64 + 1
  if $hit_64 >= 5
    disable 3
  end
  continue
end

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 61, "RASM", "USER_EXTENSIONS", "_User_extensions_Destroy_iterators_dup", "0x0800f31e", $hit_61
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 62, "EDDI", "USER_EXTENSIONS", "_User_extensions_Destroy_iterators_dup", "0x0800f31e", $hit_62
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 63, "RASM", "THREAD_LIFECYCLE", "_Thread_Join_flush_filter_dup", "0x0800f35e", $hit_63
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 64, "RASM", "THREAD_LIFECYCLE", "_Thread_Set_state_locked", "0x0800f3d6", $hit_64
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
