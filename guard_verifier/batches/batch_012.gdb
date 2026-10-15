set pagination off
set confirm off
target remote :4242
load

break *0x08006f30
commands
  silent
  set $hit_45 = $hit_45 + 1
  continue
end
set $hit_45 = 0

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

break *0x08007fe4
commands
  silent
  set $hit_48 = $hit_48 + 1
  continue
end
set $hit_48 = 0

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 45, "RASM", "CORE_SYSTEM", "_Workspace_Malloc_initialize_unified", "0x08006f30", $hit_45
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 46, "RASM", "CLASSIC_API", "rtems_task_create", "0x08007f34", $hit_46
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 47, "RASM", "CLASSIC_API", "_RTEMS_tasks_Allocate_and_prepare_stack", "0x08007fa0", $hit_47
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 48, "RASM", "CORE_SYSTEM", "rtems_initialize_data_structures", "0x08007fe4", $hit_48
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
