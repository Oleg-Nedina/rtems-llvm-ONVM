set pagination off
set confirm off
target remote :4242
load

break *0x08005be2
commands
  silent
  set $hit_21 = $hit_21 + 1
  continue
end
set $hit_21 = 0

break *0x08005cc4
commands
  silent
  set $hit_22 = $hit_22 + 1
  continue
end
set $hit_22 = 0

break *0x08005d74
commands
  silent
  set $hit_23 = $hit_23 + 1
  continue
end
set $hit_23 = 0

break *0x08005db8
commands
  silent
  set $hit_24 = $hit_24 + 1
  continue
end
set $hit_24 = 0

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 21, "RASM", "THREAD_LIFECYCLE", "_Thread_Entry_adaptor_numeric", "0x08005be2", $hit_21
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 22, "RASM", "THREAD_LIFECYCLE", "_Thread_Get", "0x08005cc4", $hit_22
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 23, "RASM", "THREAD_LIFECYCLE", "_User_extensions_Thread_begin_dup", "0x08005d74", $hit_23
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 24, "RASM", "THREAD_LIFECYCLE", "_User_extensions_Thread_exitted_dup", "0x08005db8", $hit_24
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
