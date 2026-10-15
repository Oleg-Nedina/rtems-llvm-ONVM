set pagination off
set confirm off
target remote :4242
load

set $hit_141 = 0
set $hit_142 = 0
set $hit_143 = 0
set $hit_144 = 0

break *0x080160fc
commands
  silent
  set $hit_141 = $hit_141 + 1
  if $hit_141 >= 5
    disable 1
  end
  continue
end

break *0x08016ff4
commands
  silent
  set $hit_142 = $hit_142 + 1
  if $hit_142 >= 5
    disable 2
  end
  continue
end

break *0x08017062
commands
  silent
  set $hit_143 = $hit_143 + 1
  if $hit_143 >= 5
    disable 3
  end
  continue
end

break *0x08024f74
commands
  silent
  set $hit_144 = $hit_144 + 1
  if $hit_144 >= 5
    disable 4
  end
  continue
end

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 141, "RASM", "OBJECTS_MEMORY", "_Heap_Get_free_information", "0x080160fc", $hit_141
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 142, "RASM", "CORE_SYSTEM", "stm32f4_gpio_set_config", "0x08016ff4", $hit_142
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 143, "RASM", "CORE_SYSTEM", "stm32f4_gpio_set_config_array", "0x08017062", $hit_143
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 144, "RASM", "USER_EXTENSIONS", "rtems_fatal_source_text", "0x08024f74", $hit_144
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
