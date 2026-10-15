set pagination off
set confirm off
target remote :4242
load

break *0x0800d110
commands
  silent
  set $hit_117 = $hit_117 + 1
  continue
end
set $hit_117 = 0

break *0x0800d300
commands
  silent
  set $hit_118 = $hit_118 + 1
  continue
end
set $hit_118 = 0

break *0x0800d3c8
commands
  silent
  set $hit_119 = $hit_119 + 1
  continue
end
set $hit_119 = 0

break *0x0800d40a
commands
  silent
  set $hit_120 = $hit_120 + 1
  continue
end
set $hit_120 = 0

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 117, "RASM", "CORE_SYSTEM", "_RBTree_Minimum", "0x0800d110", $hit_117
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 118, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Flush_critical", "0x0800d300", $hit_118
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 119, "RASM", "THREAD_LIFECYCLE", "_Thread_CPU_budget_consume_and_yield", "0x0800d3c8", $hit_119
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 120, "RASM", "THREAD_LIFECYCLE", "_Thread_CPU_budget_set_to_ticks_per_timeslice", "0x0800d40a", $hit_120
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
