set pagination off
set confirm off
target remote :4242
load

set $hit_1 = 0
set $hit_2 = 0
set $hit_3 = 0
set $hit_8 = 0
set $hit_9 = 0
set $hit_10 = 0
set $hit_12 = 0
set $hit_66 = 0
set $hit_67 = 0
set $hit_95 = 0
set $hit_96 = 0
set $hit_97 = 0
set $hit_98 = 0
set $hit_99 = 0
set $hit_100 = 0
set $hit_101 = 0
set $hit_102 = 0
set $hit_103 = 0
set $hit_104 = 0
set $hit_105 = 0
set $hit_106 = 0
set $hit_107 = 0
set $hit_110 = 0
set $hit_111 = 0
set $hit_112 = 0
set $hit_113 = 0
set $hit_114 = 0
set $hit_119 = 0
set $hit_120 = 0
set $hit_121 = 0
set $hit_142 = 0
set $hit_143 = 0
set $hit_145 = 0

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

break *0x0800b8e2
commands
  silent
  set $hit_8 = $hit_8 + 1
  if $hit_8 >= 5
    disable 4
  end
  continue
end

break *0x0800ba80
commands
  silent
  set $hit_9 = $hit_9 + 1
  if $hit_9 >= 5
    disable 5
  end
  continue
end

break *0x0800bab8
commands
  silent
  set $hit_10 = $hit_10 + 1
  if $hit_10 >= 5
    disable 6
  end
  continue
end

break *0x0800bb5e
commands
  silent
  set $hit_12 = $hit_12 + 1
  if $hit_12 >= 5
    disable 7
  end
  continue
end

break *0x0800f498
commands
  silent
  set $hit_66 = $hit_66 + 1
  if $hit_66 >= 5
    disable 8
  end
  continue
end

break *0x0800f4c8
commands
  silent
  set $hit_67 = $hit_67 + 1
  if $hit_67 >= 5
    disable 9
  end
  continue
end

break *0x08010bb4
commands
  silent
  set $hit_95 = $hit_95 + 1
  if $hit_95 >= 5
    disable 10
  end
  continue
end

break *0x08010bf6
commands
  silent
  set $hit_96 = $hit_96 + 1
  if $hit_96 >= 5
    disable 11
  end
  continue
end

break *0x08010c18
commands
  silent
  set $hit_97 = $hit_97 + 1
  if $hit_97 >= 5
    disable 12
  end
  continue
end

break *0x08011da6
commands
  silent
  set $hit_98 = $hit_98 + 1
  if $hit_98 >= 5
    disable 13
  end
  continue
end

break *0x08011dde
commands
  silent
  set $hit_99 = $hit_99 + 1
  if $hit_99 >= 5
    disable 14
  end
  continue
end

break *0x08011f5c
commands
  silent
  set $hit_100 = $hit_100 + 1
  if $hit_100 >= 5
    disable 15
  end
  continue
end

break *0x08011fd0
commands
  silent
  set $hit_101 = $hit_101 + 1
  if $hit_101 >= 5
    disable 16
  end
  continue
end

break *0x08012014
commands
  silent
  set $hit_102 = $hit_102 + 1
  if $hit_102 >= 5
    disable 17
  end
  continue
end

break *0x0801204e
commands
  silent
  set $hit_103 = $hit_103 + 1
  if $hit_103 >= 5
    disable 18
  end
  continue
end

break *0x080120ac
commands
  silent
  set $hit_104 = $hit_104 + 1
  if $hit_104 >= 5
    disable 19
  end
  continue
end

break *0x08012104
commands
  silent
  set $hit_105 = $hit_105 + 1
  if $hit_105 >= 5
    disable 20
  end
  continue
end

break *0x08012216
commands
  silent
  set $hit_106 = $hit_106 + 1
  if $hit_106 >= 5
    disable 21
  end
  continue
end

break *0x080123e8
commands
  silent
  set $hit_107 = $hit_107 + 1
  if $hit_107 >= 5
    disable 22
  end
  continue
end

break *0x080129fc
commands
  silent
  set $hit_110 = $hit_110 + 1
  if $hit_110 >= 5
    disable 23
  end
  continue
end

break *0x08012a6e
commands
  silent
  set $hit_111 = $hit_111 + 1
  if $hit_111 >= 5
    disable 24
  end
  continue
end

break *0x08012b10
commands
  silent
  set $hit_112 = $hit_112 + 1
  if $hit_112 >= 5
    disable 25
  end
  continue
end

break *0x08012ba6
commands
  silent
  set $hit_113 = $hit_113 + 1
  if $hit_113 >= 5
    disable 26
  end
  continue
end

break *0x08012ca0
commands
  silent
  set $hit_114 = $hit_114 + 1
  if $hit_114 >= 5
    disable 27
  end
  continue
end

break *0x08013246
commands
  silent
  set $hit_119 = $hit_119 + 1
  if $hit_119 >= 5
    disable 28
  end
  continue
end

break *0x08013a38
commands
  silent
  set $hit_120 = $hit_120 + 1
  if $hit_120 >= 5
    disable 29
  end
  continue
end

break *0x08013af0
commands
  silent
  set $hit_121 = $hit_121 + 1
  if $hit_121 >= 5
    disable 30
  end
  continue
end

break *0x08016ff4
commands
  silent
  set $hit_142 = $hit_142 + 1
  if $hit_142 >= 5
    disable 31
  end
  continue
end

break *0x08017062
commands
  silent
  set $hit_143 = $hit_143 + 1
  if $hit_143 >= 5
    disable 32
  end
  continue
end

break *0x08024fd4
commands
  silent
  set $hit_145 = $hit_145 + 1
  if $hit_145 >= 5
    disable 33
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
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 8, "RASM", "CORE_SYSTEM", "_CORE_message_queue_Seize", "0x0800b8e2", $hit_8
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 9, "RASM", "CORE_SYSTEM", "_CORE_message_queue_Submit", "0x0800ba80", $hit_9
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 10, "RASM", "CORE_SYSTEM", "_CORE_message_queue_Workspace_allocate", "0x0800bab8", $hit_10
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 12, "RASM", "CORE_SYSTEM", "_ISR_Is_in_progress", "0x0800bb5e", $hit_12
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 66, "RASM", "CORE_SYSTEM", "_Stack_Allocate", "0x0800f498", $hit_66
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 67, "RASM", "CORE_SYSTEM", "_Stack_Free", "0x0800f4c8", $hit_67
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 95, "RASM", "CORE_SYSTEM", "_Workspace_Allocate", "0x08010bb4", $hit_95
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 96, "RASM", "CORE_SYSTEM", "_Workspace_Free", "0x08010bf6", $hit_96
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 97, "RASM", "CORE_SYSTEM", "_Workspace_Malloc_initialize_unified", "0x08010c18", $hit_97
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 98, "RASM", "CORE_SYSTEM", "_Message_queue_Create", "0x08011da6", $hit_98
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 99, "RASM", "CORE_SYSTEM", "_Message_queue_Manager_initialization", "0x08011dde", $hit_99
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 100, "RASM", "CORE_SYSTEM", "rtems_initialize_data_structures", "0x08011f5c", $hit_100
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 101, "RASM", "CORE_SYSTEM", "rtems_initialize_executive", "0x08011fd0", $hit_101
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 102, "RASM", "CORE_SYSTEM", "_RTEMS_Lock_allocator", "0x08012014", $hit_102
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 103, "RASM", "CORE_SYSTEM", "_RTEMS_Unlock_allocator", "0x0801204e", $hit_103
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 104, "RASM", "CORE_SYSTEM", "_API_Mutex_Lock", "0x080120ac", $hit_104
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 105, "RASM", "CORE_SYSTEM", "_API_Mutex_Unlock", "0x08012104", $hit_105
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 106, "RASM", "CORE_SYSTEM", "_CORE_message_queue_Initialize", "0x08012216", $hit_106
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 107, "RASM", "CORE_SYSTEM", "_CORE_message_queue_Insert_message", "0x080123e8", $hit_107
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 110, "RASM", "CORE_SYSTEM", "_ISR_Handler_initialization", "0x080129fc", $hit_110
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 111, "RASM", "CORE_SYSTEM", "_Mutex_Acquire", "0x08012a6e", $hit_111
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 112, "RASM", "CORE_SYSTEM", "_Mutex_Release", "0x08012b10", $hit_112
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 113, "RASM", "CORE_SYSTEM", "_Mutex_recursive_Acquire", "0x08012ba6", $hit_113
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 114, "RASM", "CORE_SYSTEM", "_Mutex_recursive_Release", "0x08012ca0", $hit_114
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 119, "RASM", "CORE_SYSTEM", "_RBTree_Extract", "0x08013246", $hit_119
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 120, "RASM", "CORE_SYSTEM", "_RBTree_Insert_color", "0x08013a38", $hit_120
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 121, "RASM", "CORE_SYSTEM", "_RBTree_Minimum", "0x08013af0", $hit_121
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 142, "RASM", "CORE_SYSTEM", "stm32f4_gpio_set_config", "0x08016ff4", $hit_142
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 143, "RASM", "CORE_SYSTEM", "stm32f4_gpio_set_config_array", "0x08017062", $hit_143
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 145, "RASM", "CORE_SYSTEM", "rtems_configuration_get_stack_space_size", "0x08024fd4", $hit_145
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
