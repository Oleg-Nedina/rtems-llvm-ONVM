set pagination off
set confirm off
target remote :4242
load

break *0x0800bba2
commands
  silent
  set $hit_101 = $hit_101 + 1
  continue
end
set $hit_101 = 0

break *0x0800bba2
commands
  silent
  set $hit_102 = $hit_102 + 1
  continue
end
set $hit_102 = 0

break *0x0800bbe2
commands
  silent
  set $hit_103 = $hit_103 + 1
  continue
end
set $hit_103 = 0

break *0x0800bc24
commands
  silent
  set $hit_104 = $hit_104 + 1
  continue
end
set $hit_104 = 0

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 101, "RASM", "USER_EXTENSIONS", "_User_extensions_Destroy_iterators_dup", "0x0800bba2", $hit_101
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 102, "EDDI", "USER_EXTENSIONS", "_User_extensions_Destroy_iterators_dup", "0x0800bba2", $hit_102
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 103, "RASM", "THREAD_LIFECYCLE", "_Thread_Join_flush_filter_dup", "0x0800bbe2", $hit_103
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 104, "RASM", "CORE_SYSTEM", "_Stack_Allocate", "0x0800bc24", $hit_104
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
