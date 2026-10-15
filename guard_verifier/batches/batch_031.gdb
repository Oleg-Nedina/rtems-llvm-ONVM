set pagination off
set confirm off
target remote :4242
load

break *0x0800d49c
commands
  silent
  set $hit_121 = $hit_121 + 1
  continue
end
set $hit_121 = 0

break *0x0800d4da
commands
  silent
  set $hit_122 = $hit_122 + 1
  continue
end
set $hit_122 = 0

break *0x0800e3cc
commands
  silent
  set $hit_123 = $hit_123 + 1
  continue
end
set $hit_123 = 0

break *0x0800e43a
commands
  silent
  set $hit_124 = $hit_124 + 1
  continue
end
set $hit_124 = 0

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 121, "RASM", "USER_EXTENSIONS", "_User_extensions_Add_set", "0x0800d49c", $hit_121
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 122, "RASM", "CORE_SYSTEM", "_Workspace_Free", "0x0800d4da", $hit_122
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 123, "RASM", "CORE_SYSTEM", "stm32f4_gpio_set_config", "0x0800e3cc", $hit_123
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 124, "RASM", "CORE_SYSTEM", "stm32f4_gpio_set_config_array", "0x0800e43a", $hit_124
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
