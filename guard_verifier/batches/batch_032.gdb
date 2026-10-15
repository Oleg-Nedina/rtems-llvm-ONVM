set pagination off
set confirm off
target remote :4242
load

break *0x080110a0
commands
  silent
  set $hit_125 = $hit_125 + 1
  continue
end
set $hit_125 = 0

break *0x08011100
commands
  silent
  set $hit_126 = $hit_126 + 1
  continue
end
set $hit_126 = 0

break *0x08011146
commands
  silent
  set $hit_127 = $hit_127 + 1
  continue
end
set $hit_127 = 0

break *0x080111a8
commands
  silent
  set $hit_128 = $hit_128 + 1
  continue
end
set $hit_128 = 0

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 125, "RASM", "USER_EXTENSIONS", "rtems_fatal_source_text", "0x080110a0", $hit_125
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 126, "RASM", "CORE_SYSTEM", "rtems_configuration_get_stack_space_size", "0x08011100", $hit_126
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 127, "RASM", "CORE_SYSTEM", "_ISR_Is_in_progress", "0x08011146", $hit_127
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 128, "RASM", "CLASSIC_API", "_Semaphore_Post_binary", "0x080111a8", $hit_128
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
