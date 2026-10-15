set pagination off
set confirm off
target remote :4242
load

break *0x08011278
commands
  silent
  set $hit_129 = $hit_129 + 1
  continue
end
set $hit_129 = 0

break *0x08012136
commands
  silent
  set $hit_130 = $hit_130 + 1
  continue
end
set $hit_130 = 0

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 129, "RASM", "THREAD_LIFECYCLE", "_Thread_Get_name", "0x08011278", $hit_129
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 130, "RASM", "OBJECTS_MEMORY", "_Objects_Name_to_string", "0x08012136", $hit_130
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
