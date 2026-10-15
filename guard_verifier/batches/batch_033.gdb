set pagination off
set confirm off
target remote :4242
load

set $hit_129 = 0
set $hit_130 = 0
set $hit_131 = 0
set $hit_132 = 0

break *0x080143dc
commands
  silent
  set $hit_129 = $hit_129 + 1
  if $hit_129 >= 5
    disable 1
  end
  continue
end

break *0x08014418
commands
  silent
  set $hit_130 = $hit_130 + 1
  if $hit_130 >= 5
    disable 2
  end
  continue
end

break *0x08014536
commands
  silent
  set $hit_131 = $hit_131 + 1
  if $hit_131 >= 5
    disable 3
  end
  continue
end

break *0x0801493c
commands
  silent
  set $hit_132 = $hit_132 + 1
  if $hit_132 >= 5
    disable 4
  end
  continue
end

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 129, "EDDI", "THREAD_LIFECYCLE", "_Thread_Create_idle", "0x080143dc", $hit_129
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 130, "RASM", "THREAD_LIFECYCLE", "_Thread_Entry_adaptor_idle", "0x08014418", $hit_130
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 131, "RASM", "THREAD_LIFECYCLE", "_Thread_Free", "0x08014536", $hit_131
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 132, "RASM", "THREAD_LIFECYCLE", "_Thread_Load_environment", "0x0801493c", $hit_132
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
