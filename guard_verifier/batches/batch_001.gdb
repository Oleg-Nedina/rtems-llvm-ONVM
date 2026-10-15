set pagination off
set confirm off
target remote :4242
load

set $hit_1 = 0
set $hit_2 = 0
set $hit_3 = 0
set $hit_4 = 0

break *0x0800b138
commands
  silent
  set $hit_1 = $hit_1 + 1
  if $hit_1 >= 5
    disable 1
  end
  continue
end

break *0x0800b202
commands
  silent
  set $hit_2 = $hit_2 + 1
  if $hit_2 >= 5
    disable 2
  end
  continue
end

break *0x0800b2b0
commands
  silent
  set $hit_3 = $hit_3 + 1
  if $hit_3 >= 5
    disable 3
  end
  continue
end

break *0x0800b34c
commands
  silent
  set $hit_4 = $hit_4 + 1
  if $hit_4 >= 5
    disable 4
  end
  continue
end

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 1, "RASM", "CORE_SYSTEM", "rtems_message_queue_create", "0x0800b138", $hit_1
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 2, "RASM", "CORE_SYSTEM", "rtems_message_queue_receive", "0x0800b202", $hit_2
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 3, "RASM", "CORE_SYSTEM", "rtems_message_queue_send", "0x0800b2b0", $hit_3
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 4, "RASM", "CLASSIC_API", "rtems_task_create", "0x0800b34c", $hit_4
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
