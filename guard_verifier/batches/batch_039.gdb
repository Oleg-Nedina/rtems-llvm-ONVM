set pagination off
set confirm off
target remote :4242
load

set $hit_153 = 0

break *0x08025a9a
commands
  silent
  set $hit_153 = $hit_153 + 1
  if $hit_153 >= 5
    disable 1
  end
  continue
end

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 153, "RASM", "OBJECTS_MEMORY", "_Objects_Name_to_string", "0x08025a9a", $hit_153
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
