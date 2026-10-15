set pagination off
set confirm off
target remote :4242
load

break *0x08006f08
commands
  silent
  set $hit_44 = $hit_44 + 1
  continue
end
set $hit_44 = 0

break *0x08006f30
commands
  silent
  set $hit_45 = $hit_45 + 1
  continue
end
set $hit_45 = 0

break *0x08007fe4
commands
  silent
  set $hit_48 = $hit_48 + 1
  continue
end
set $hit_48 = 0

break *0x08008058
commands
  silent
  set $hit_49 = $hit_49 + 1
  continue
end
set $hit_49 = 0

break *0x0800809c
commands
  silent
  set $hit_50 = $hit_50 + 1
  continue
end
set $hit_50 = 0

break *0x080080d6
commands
  silent
  set $hit_51 = $hit_51 + 1
  continue
end
set $hit_51 = 0

break *0x08008134
commands
  silent
  set $hit_52 = $hit_52 + 1
  continue
end
set $hit_52 = 0

break *0x0800818c
commands
  silent
  set $hit_53 = $hit_53 + 1
  continue
end
set $hit_53 = 0

break *0x08008508
commands
  silent
  set $hit_55 = $hit_55 + 1
  continue
end
set $hit_55 = 0

break *0x08008584
commands
  silent
  set $hit_56 = $hit_56 + 1
  continue
end
set $hit_56 = 0

break *0x080086ae
commands
  silent
  set $hit_57 = $hit_57 + 1
  continue
end
set $hit_57 = 0

break *0x080089f2
commands
  silent
  set $hit_61 = $hit_61 + 1
  continue
end
set $hit_61 = 0

break *0x080091e4
commands
  silent
  set $hit_62 = $hit_62 + 1
  continue
end
set $hit_62 = 0

break *0x0800bc24
commands
  silent
  set $hit_104 = $hit_104 + 1
  continue
end
set $hit_104 = 0

break *0x0800bc54
commands
  silent
  set $hit_105 = $hit_105 + 1
  continue
end
set $hit_105 = 0

break *0x0800d110
commands
  silent
  set $hit_117 = $hit_117 + 1
  continue
end
set $hit_117 = 0

break *0x0800d4da
commands
  silent
  set $hit_122 = $hit_122 + 1
  continue
end
set $hit_122 = 0

break *0x0800e3cc
commands
  silent
  set $hit_123 = $hit_123 + 1
  continue
end
set $hit_123 = 0

break *0x0800e43a
commands
  silent
  set $hit_124 = $hit_124 + 1
  continue
end
set $hit_124 = 0

break *0x08011100
commands
  silent
  set $hit_126 = $hit_126 + 1
  continue
end
set $hit_126 = 0

break *0x08011146
commands
  silent
  set $hit_127 = $hit_127 + 1
  continue
end
set $hit_127 = 0

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 44, "RASM", "CORE_SYSTEM", "_Workspace_Allocate", "0x08006f08", $hit_44
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 45, "RASM", "CORE_SYSTEM", "_Workspace_Malloc_initialize_unified", "0x08006f30", $hit_45
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 48, "RASM", "CORE_SYSTEM", "rtems_initialize_data_structures", "0x08007fe4", $hit_48
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 49, "RASM", "CORE_SYSTEM", "rtems_initialize_executive", "0x08008058", $hit_49
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 50, "RASM", "CORE_SYSTEM", "_RTEMS_Lock_allocator", "0x0800809c", $hit_50
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 51, "RASM", "CORE_SYSTEM", "_RTEMS_Unlock_allocator", "0x080080d6", $hit_51
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 52, "RASM", "CORE_SYSTEM", "_API_Mutex_Lock", "0x08008134", $hit_52
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 53, "RASM", "CORE_SYSTEM", "_API_Mutex_Unlock", "0x0800818c", $hit_53
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 55, "RASM", "CORE_SYSTEM", "_ISR_Handler_initialization", "0x08008508", $hit_55
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 56, "RASM", "CORE_SYSTEM", "_Mutex_recursive_Acquire", "0x08008584", $hit_56
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 57, "RASM", "CORE_SYSTEM", "_Mutex_recursive_Release", "0x080086ae", $hit_57
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 61, "RASM", "CORE_SYSTEM", "_RBTree_Extract", "0x080089f2", $hit_61
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 62, "RASM", "CORE_SYSTEM", "_RBTree_Insert_color", "0x080091e4", $hit_62
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 104, "RASM", "CORE_SYSTEM", "_Stack_Allocate", "0x0800bc24", $hit_104
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 105, "RASM", "CORE_SYSTEM", "_Stack_Free", "0x0800bc54", $hit_105
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 117, "RASM", "CORE_SYSTEM", "_RBTree_Minimum", "0x0800d110", $hit_117
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 122, "RASM", "CORE_SYSTEM", "_Workspace_Free", "0x0800d4da", $hit_122
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 123, "RASM", "CORE_SYSTEM", "stm32f4_gpio_set_config", "0x0800e3cc", $hit_123
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 124, "RASM", "CORE_SYSTEM", "stm32f4_gpio_set_config_array", "0x0800e43a", $hit_124
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 126, "RASM", "CORE_SYSTEM", "rtems_configuration_get_stack_space_size", "0x08011100", $hit_126
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 127, "RASM", "CORE_SYSTEM", "_ISR_Is_in_progress", "0x08011146", $hit_127
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
