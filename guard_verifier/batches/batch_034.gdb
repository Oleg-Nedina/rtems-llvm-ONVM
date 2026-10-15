set pagination off
set confirm off
target remote :4242
load

set $hit_133 = 0
set $hit_134 = 0
set $hit_135 = 0
set $hit_136 = 0

break *0x080149a2
commands
  silent
  set $hit_133 = $hit_133 + 1
  if $hit_133 >= 5
    disable 1
  end
  continue
end

break *0x08014b90
commands
  silent
  set $hit_134 = $hit_134 + 1
  if $hit_134 >= 5
    disable 2
  end
  continue
end

break *0x08014c58
commands
  silent
  set $hit_135 = $hit_135 + 1
  if $hit_135 >= 5
    disable 3
  end
  continue
end

break *0x08014c9a
commands
  silent
  set $hit_136 = $hit_136 + 1
  if $hit_136 >= 5
    disable 4
  end
  continue
end

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 133, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Object_initialize", "0x080149a2", $hit_133
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 134, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Flush_critical", "0x08014b90", $hit_134
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 135, "RASM", "THREAD_LIFECYCLE", "_Thread_CPU_budget_consume_and_yield", "0x08014c58", $hit_135
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 136, "RASM", "THREAD_LIFECYCLE", "_Thread_CPU_budget_set_to_ticks_per_timeslice", "0x08014c9a", $hit_136
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
