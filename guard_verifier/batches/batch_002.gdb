set pagination off
set confirm off
target remote :4242
load

set $hit_5 = 0
set $hit_6 = 0
set $hit_7 = 0
set $hit_8 = 0

break *0x0800b3b8
commands
  silent
  set $hit_5 = $hit_5 + 1
  if $hit_5 >= 5
    disable 1
  end
  continue
end

break *0x0800b476
commands
  silent
  set $hit_6 = $hit_6 + 1
  if $hit_6 >= 5
    disable 2
  end
  continue
end

break *0x0800b562
commands
  silent
  set $hit_7 = $hit_7 + 1
  if $hit_7 >= 5
    disable 3
  end
  continue
end

break *0x0800b8e2
commands
  silent
  set $hit_8 = $hit_8 + 1
  if $hit_8 >= 5
    disable 4
  end
  continue
end

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 5, "RASM", "CLASSIC_API", "_RTEMS_tasks_Allocate_and_prepare_stack", "0x0800b3b8", $hit_5
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 6, "RASM", "CLASSIC_API", "rtems_task_delete", "0x0800b476", $hit_6
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 7, "RASM", "CLASSIC_API", "rtems_task_start", "0x0800b562", $hit_7
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 8, "RASM", "CORE_SYSTEM", "_CORE_message_queue_Seize", "0x0800b8e2", $hit_8
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
