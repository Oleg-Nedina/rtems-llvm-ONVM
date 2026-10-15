set pagination off
set confirm off
target remote :4242
load

break *0x08004452
commands
  silent
  set $hit_1 = $hit_1 + 1
  continue
end
set $hit_1 = 0

break *0x08007f34
commands
  silent
  set $hit_46 = $hit_46 + 1
  continue
end
set $hit_46 = 0

break *0x08007fa0
commands
  silent
  set $hit_47 = $hit_47 + 1
  continue
end
set $hit_47 = 0

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
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 1, "RASM", "CLASSIC_API", "rtems_task_start", "0x08004452", $hit_1
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 46, "RASM", "CLASSIC_API", "rtems_task_create", "0x08007f34", $hit_46
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 47, "RASM", "CLASSIC_API", "_RTEMS_tasks_Allocate_and_prepare_stack", "0x08007fa0", $hit_47
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 128, "RASM", "CLASSIC_API", "_Semaphore_Post_binary", "0x080111a8", $hit_128
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
