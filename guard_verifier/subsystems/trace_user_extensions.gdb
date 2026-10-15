set pagination off
set confirm off
target remote :4242
load

set $hit_11 = 0
set $hit_54 = 0
set $hit_61 = 0
set $hit_62 = 0
set $hit_81 = 0
set $hit_88 = 0
set $hit_90 = 0
set $hit_91 = 0
set $hit_137 = 0
set $hit_144 = 0

break *0x0800bb16
commands
  silent
  set $hit_11 = $hit_11 + 1
  if $hit_11 >= 5
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

break *0x0800f31e
commands
  silent
  set $hit_61 = $hit_61 + 1
  set $hit_62 = $hit_62 + 1
  if $hit_61 >= 5
    disable 3
  end
  continue
end

break *0x08010100
commands
  silent
  set $hit_81 = $hit_81 + 1
  if $hit_81 >= 5
    disable 4
  end
  continue
end

break *0x0801035c
commands
  silent
  set $hit_88 = $hit_88 + 1
  if $hit_88 >= 5
    disable 5
  end
  continue
end

break *0x0801068c
commands
  silent
  set $hit_90 = $hit_90 + 1
  set $hit_91 = $hit_91 + 1
  if $hit_90 >= 5
    disable 6
  end
  continue
end

break *0x08014d58
commands
  silent
  set $hit_137 = $hit_137 + 1
  if $hit_137 >= 5
    disable 7
  end
  continue
end

break *0x08024f74
commands
  silent
  set $hit_144 = $hit_144 + 1
  if $hit_144 >= 5
    disable 8
  end
  continue
end

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 11, "RASM", "USER_EXTENSIONS", "_User_extensions_Fatal", "0x0800bb16", $hit_11
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 54, "RASM", "USER_EXTENSIONS", "_User_extensions_Destroy_iterators", "0x0800eb94", $hit_54
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 61, "RASM", "USER_EXTENSIONS", "_User_extensions_Destroy_iterators_dup", "0x0800f31e", $hit_61
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 62, "EDDI", "USER_EXTENSIONS", "_User_extensions_Destroy_iterators_dup", "0x0800f31e", $hit_62
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 81, "RASM", "USER_EXTENSIONS", "_User_extensions_Handler_initialization", "0x08010100", $hit_81
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 88, "RASM", "USER_EXTENSIONS", "_User_extensions_Fatal_visitor", "0x0801035c", $hit_88
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 90, "RASM", "USER_EXTENSIONS", "_User_extensions_Iterate", "0x0801068c", $hit_90
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 91, "EDDI", "USER_EXTENSIONS", "_User_extensions_Iterate", "0x0801068c", $hit_91
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 137, "RASM", "USER_EXTENSIONS", "_User_extensions_Add_set", "0x08014d58", $hit_137
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 144, "RASM", "USER_EXTENSIONS", "rtems_fatal_source_text", "0x08024f74", $hit_144
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
