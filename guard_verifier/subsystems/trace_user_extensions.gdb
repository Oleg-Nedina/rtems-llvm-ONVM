set pagination off
set confirm off
target remote :4242
load

break *0x080046c6
commands
  silent
  set $hit_3 = $hit_3 + 1
  continue
end
set $hit_3 = 0

break *0x080064f4
commands
  silent
  set $hit_31 = $hit_31 + 1
  continue
end
set $hit_31 = 0

break *0x08006750
commands
  silent
  set $hit_38 = $hit_38 + 1
  continue
end
set $hit_38 = 0

break *0x08006a80
commands
  silent
  set $hit_40 = $hit_40 + 1
  continue
end
set $hit_40 = 0

break *0x08006a80
commands
  silent
  set $hit_41 = $hit_41 + 1
  continue
end
set $hit_41 = 0

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

break *0x0800d49c
commands
  silent
  set $hit_121 = $hit_121 + 1
  continue
end
set $hit_121 = 0

break *0x080110a0
commands
  silent
  set $hit_125 = $hit_125 + 1
  continue
end
set $hit_125 = 0

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 3, "RASM", "USER_EXTENSIONS", "_User_extensions_Fatal", "0x080046c6", $hit_3
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 31, "RASM", "USER_EXTENSIONS", "_User_extensions_Handler_initialization", "0x080064f4", $hit_31
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 38, "RASM", "USER_EXTENSIONS", "_User_extensions_Fatal_visitor", "0x08006750", $hit_38
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 40, "RASM", "USER_EXTENSIONS", "_User_extensions_Iterate", "0x08006a80", $hit_40
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 41, "EDDI", "USER_EXTENSIONS", "_User_extensions_Iterate", "0x08006a80", $hit_41
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 101, "RASM", "USER_EXTENSIONS", "_User_extensions_Destroy_iterators_dup", "0x0800bba2", $hit_101
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 102, "EDDI", "USER_EXTENSIONS", "_User_extensions_Destroy_iterators_dup", "0x0800bba2", $hit_102
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 121, "RASM", "USER_EXTENSIONS", "_User_extensions_Add_set", "0x0800d49c", $hit_121
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 125, "RASM", "USER_EXTENSIONS", "rtems_fatal_source_text", "0x080110a0", $hit_125
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
