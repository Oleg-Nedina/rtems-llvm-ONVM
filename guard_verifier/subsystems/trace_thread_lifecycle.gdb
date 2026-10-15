set pagination off
set confirm off
target remote :4242
load

set $hit_18 = 0
set $hit_26 = 0
set $hit_27 = 0
set $hit_28 = 0
set $hit_29 = 0
set $hit_30 = 0
set $hit_31 = 0
set $hit_32 = 0
set $hit_33 = 0
set $hit_34 = 0
set $hit_35 = 0
set $hit_36 = 0
set $hit_37 = 0
set $hit_38 = 0
set $hit_39 = 0
set $hit_40 = 0
set $hit_41 = 0
set $hit_42 = 0
set $hit_43 = 0
set $hit_44 = 0
set $hit_45 = 0
set $hit_46 = 0
set $hit_47 = 0
set $hit_48 = 0
set $hit_49 = 0
set $hit_50 = 0
set $hit_51 = 0
set $hit_52 = 0
set $hit_53 = 0
set $hit_55 = 0
set $hit_56 = 0
set $hit_57 = 0
set $hit_58 = 0
set $hit_59 = 0
set $hit_60 = 0
set $hit_63 = 0
set $hit_64 = 0
set $hit_65 = 0
set $hit_68 = 0
set $hit_69 = 0
set $hit_70 = 0
set $hit_79 = 0
set $hit_80 = 0
set $hit_82 = 0
set $hit_83 = 0
set $hit_84 = 0
set $hit_85 = 0
set $hit_86 = 0
set $hit_87 = 0
set $hit_89 = 0
set $hit_123 = 0
set $hit_124 = 0
set $hit_125 = 0
set $hit_126 = 0
set $hit_127 = 0
set $hit_128 = 0
set $hit_129 = 0
set $hit_130 = 0
set $hit_131 = 0
set $hit_132 = 0
set $hit_133 = 0
set $hit_134 = 0
set $hit_135 = 0
set $hit_136 = 0
set $hit_148 = 0

break *0x0800c2c2
commands
  silent
  set $hit_18 = $hit_18 + 1
  if $hit_18 >= 5
    disable 1
  end
  continue
end

break *0x0800cf5e
commands
  silent
  set $hit_26 = $hit_26 + 1
  if $hit_26 >= 5
    disable 2
  end
  continue
end

break *0x0800d07c
commands
  silent
  set $hit_27 = $hit_27 + 1
  if $hit_27 >= 5
    disable 3
  end
  continue
end

break *0x0800d106
commands
  silent
  set $hit_28 = $hit_28 + 1
  if $hit_28 >= 5
    disable 4
  end
  continue
end

break *0x0800d1f4
commands
  silent
  set $hit_29 = $hit_29 + 1
  if $hit_29 >= 5
    disable 5
  end
  continue
end

break *0x0800d238
commands
  silent
  set $hit_30 = $hit_30 + 1
  if $hit_30 >= 5
    disable 6
  end
  continue
end

break *0x0800d25c
commands
  silent
  set $hit_31 = $hit_31 + 1
  if $hit_31 >= 5
    disable 7
  end
  continue
end

break *0x0800d288
commands
  silent
  set $hit_32 = $hit_32 + 1
  if $hit_32 >= 5
    disable 8
  end
  continue
end

break *0x0800d3e6
commands
  silent
  set $hit_33 = $hit_33 + 1
  if $hit_33 >= 5
    disable 9
  end
  continue
end

break *0x0800d5c0
commands
  silent
  set $hit_34 = $hit_34 + 1
  if $hit_34 >= 5
    disable 10
  end
  continue
end

break *0x0800d67e
commands
  silent
  set $hit_35 = $hit_35 + 1
  if $hit_35 >= 5
    disable 11
  end
  continue
end

break *0x0800d6e8
commands
  silent
  set $hit_36 = $hit_36 + 1
  if $hit_36 >= 5
    disable 12
  end
  continue
end

break *0x0800d716
commands
  silent
  set $hit_37 = $hit_37 + 1
  if $hit_37 >= 5
    disable 13
  end
  continue
end

break *0x0800d784
commands
  silent
  set $hit_38 = $hit_38 + 1
  if $hit_38 >= 5
    disable 14
  end
  continue
end

break *0x0800d8dc
commands
  silent
  set $hit_39 = $hit_39 + 1
  if $hit_39 >= 5
    disable 15
  end
  continue
end

break *0x0800da80
commands
  silent
  set $hit_40 = $hit_40 + 1
  if $hit_40 >= 5
    disable 16
  end
  continue
end

break *0x0800dafe
commands
  silent
  set $hit_41 = $hit_41 + 1
  if $hit_41 >= 5
    disable 17
  end
  continue
end

break *0x0800db80
commands
  silent
  set $hit_42 = $hit_42 + 1
  if $hit_42 >= 5
    disable 18
  end
  continue
end

break *0x0800dbb6
commands
  silent
  set $hit_43 = $hit_43 + 1
  if $hit_43 >= 5
    disable 19
  end
  continue
end

break *0x0800dd7a
commands
  silent
  set $hit_44 = $hit_44 + 1
  if $hit_44 >= 5
    disable 20
  end
  continue
end

break *0x0800dfe0
commands
  silent
  set $hit_45 = $hit_45 + 1
  if $hit_45 >= 5
    disable 21
  end
  continue
end

break *0x0800e0e0
commands
  silent
  set $hit_46 = $hit_46 + 1
  if $hit_46 >= 5
    disable 22
  end
  continue
end

break *0x0800e3e2
commands
  silent
  set $hit_47 = $hit_47 + 1
  if $hit_47 >= 5
    disable 23
  end
  continue
end

break *0x0800e46a
commands
  silent
  set $hit_48 = $hit_48 + 1
  if $hit_48 >= 5
    disable 24
  end
  continue
end

break *0x0800e53a
commands
  silent
  set $hit_49 = $hit_49 + 1
  if $hit_49 >= 5
    disable 25
  end
  continue
end

break *0x0800e56c
commands
  silent
  set $hit_50 = $hit_50 + 1
  if $hit_50 >= 5
    disable 26
  end
  continue
end

break *0x0800e6ce
commands
  silent
  set $hit_51 = $hit_51 + 1
  if $hit_51 >= 5
    disable 27
  end
  continue
end

break *0x0800e7e0
commands
  silent
  set $hit_52 = $hit_52 + 1
  if $hit_52 >= 5
    disable 28
  end
  continue
end

break *0x0800ea86
commands
  silent
  set $hit_53 = $hit_53 + 1
  if $hit_53 >= 5
    disable 29
  end
  continue
end

break *0x0800ed6c
commands
  silent
  set $hit_55 = $hit_55 + 1
  if $hit_55 >= 5
    disable 30
  end
  continue
end

break *0x0800ee86
commands
  silent
  set $hit_56 = $hit_56 + 1
  if $hit_56 >= 5
    disable 31
  end
  continue
end

break *0x0800f014
commands
  silent
  set $hit_57 = $hit_57 + 1
  set $hit_58 = $hit_58 + 1
  if $hit_57 >= 5
    disable 32
  end
  continue
end

break *0x0800f13e
commands
  silent
  set $hit_59 = $hit_59 + 1
  set $hit_60 = $hit_60 + 1
  if $hit_59 >= 5
    disable 33
  end
  continue
end

break *0x0800f35e
commands
  silent
  set $hit_63 = $hit_63 + 1
  if $hit_63 >= 5
    disable 34
  end
  continue
end

break *0x0800f3d6
commands
  silent
  set $hit_64 = $hit_64 + 1
  if $hit_64 >= 5
    disable 35
  end
  continue
end

break *0x0800f456
commands
  silent
  set $hit_65 = $hit_65 + 1
  if $hit_65 >= 5
    disable 36
  end
  continue
end

break *0x0800f63c
commands
  silent
  set $hit_68 = $hit_68 + 1
  if $hit_68 >= 5
    disable 37
  end
  continue
end

break *0x0800f670
commands
  silent
  set $hit_69 = $hit_69 + 1
  if $hit_69 >= 5
    disable 38
  end
  continue
end

break *0x0800f6ec
commands
  silent
  set $hit_70 = $hit_70 + 1
  if $hit_70 >= 5
    disable 39
  end
  continue
end

break *0x0800fd2e
commands
  silent
  set $hit_79 = $hit_79 + 1
  set $hit_80 = $hit_80 + 1
  if $hit_79 >= 5
    disable 40
  end
  continue
end

break *0x08010182
commands
  silent
  set $hit_82 = $hit_82 + 1
  if $hit_82 >= 5
    disable 41
  end
  continue
end

break *0x080101d2
commands
  silent
  set $hit_83 = $hit_83 + 1
  if $hit_83 >= 5
    disable 42
  end
  continue
end

break *0x08010222
commands
  silent
  set $hit_84 = $hit_84 + 1
  if $hit_84 >= 5
    disable 43
  end
  continue
end

break *0x08010272
commands
  silent
  set $hit_85 = $hit_85 + 1
  if $hit_85 >= 5
    disable 44
  end
  continue
end

break *0x080102be
commands
  silent
  set $hit_86 = $hit_86 + 1
  if $hit_86 >= 5
    disable 45
  end
  continue
end

break *0x0801030a
commands
  silent
  set $hit_87 = $hit_87 + 1
  if $hit_87 >= 5
    disable 46
  end
  continue
end

break *0x080103aa
commands
  silent
  set $hit_89 = $hit_89 + 1
  if $hit_89 >= 5
    disable 47
  end
  continue
end

break *0x08013c00
commands
  silent
  set $hit_123 = $hit_123 + 1
  if $hit_123 >= 5
    disable 48
  end
  continue
end

break *0x08014058
commands
  silent
  set $hit_124 = $hit_124 + 1
  if $hit_124 >= 5
    disable 49
  end
  continue
end

break *0x08014106
commands
  silent
  set $hit_125 = $hit_125 + 1
  if $hit_125 >= 5
    disable 50
  end
  continue
end

break *0x080141a0
commands
  silent
  set $hit_126 = $hit_126 + 1
  if $hit_126 >= 5
    disable 51
  end
  continue
end

break *0x0801424a
commands
  silent
  set $hit_127 = $hit_127 + 1
  if $hit_127 >= 5
    disable 52
  end
  continue
end

break *0x080143dc
commands
  silent
  set $hit_128 = $hit_128 + 1
  set $hit_129 = $hit_129 + 1
  if $hit_128 >= 5
    disable 53
  end
  continue
end

break *0x08014418
commands
  silent
  set $hit_130 = $hit_130 + 1
  if $hit_130 >= 5
    disable 54
  end
  continue
end

break *0x08014536
commands
  silent
  set $hit_131 = $hit_131 + 1
  if $hit_131 >= 5
    disable 55
  end
  continue
end

break *0x0801493c
commands
  silent
  set $hit_132 = $hit_132 + 1
  if $hit_132 >= 5
    disable 56
  end
  continue
end

break *0x080149a2
commands
  silent
  set $hit_133 = $hit_133 + 1
  if $hit_133 >= 5
    disable 57
  end
  continue
end

break *0x08014b90
commands
  silent
  set $hit_134 = $hit_134 + 1
  if $hit_134 >= 5
    disable 58
  end
  continue
end

break *0x08014c58
commands
  silent
  set $hit_135 = $hit_135 + 1
  if $hit_135 >= 5
    disable 59
  end
  continue
end

break *0x08014c9a
commands
  silent
  set $hit_136 = $hit_136 + 1
  if $hit_136 >= 5
    disable 60
  end
  continue
end

break *0x08025224
commands
  silent
  set $hit_148 = $hit_148 + 1
  if $hit_148 >= 5
    disable 61
  end
  continue
end

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 18, "RASM", "THREAD_LIFECYCLE", "_Scheduler_default_Start_idle", "0x0800c2c2", $hit_18
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 26, "RASM", "THREAD_LIFECYCLE", "_Stack_Allocator_allocate_for_idle_workspace", "0x0800cf5e", $hit_26
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 27, "EDDI", "THREAD_LIFECYCLE", "_Thread_Do_dispatch", "0x0800d07c", $hit_27
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 28, "RASM", "THREAD_LIFECYCLE", "_Thread_Entry_adaptor_numeric", "0x0800d106", $hit_28
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 29, "RASM", "THREAD_LIFECYCLE", "_User_extensions_Thread_begin_dup", "0x0800d1f4", $hit_29
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 30, "RASM", "THREAD_LIFECYCLE", "_User_extensions_Thread_exitted_dup", "0x0800d238", $hit_30
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 31, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Enqueue_do_nothing_extra", "0x0800d25c", $hit_31
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 32, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Deadlock_status", "0x0800d288", $hit_32
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 33, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Extract_locked", "0x0800d3e6", $hit_33
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 34, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Do_nothing_priority_actions", "0x0800d5c0", $hit_34
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 35, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_FIFO_enqueue", "0x0800d67e", $hit_35
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 36, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_FIFO_extract", "0x0800d6e8", $hit_36
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 37, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_FIFO_first", "0x0800d716", $hit_37
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 38, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_FIFO_surrender", "0x0800d784", $hit_38
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 39, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Priority_priority_actions", "0x0800d8dc", $hit_39
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 40, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Priority_enqueue", "0x0800da80", $hit_40
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 41, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Priority_extract", "0x0800dafe", $hit_41
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 42, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Priority_surrender", "0x0800db80", $hit_42
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 43, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Priority_first", "0x0800dbb6", $hit_43
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 44, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Priority_inherit_priority_actions", "0x0800dd7a", $hit_44
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 45, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Priority_inherit_enqueue", "0x0800dfe0", $hit_45
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 46, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Priority_inherit_extract", "0x0800e0e0", $hit_46
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 47, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Priority_inherit_surrender", "0x0800e3e2", $hit_47
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 48, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Add_timeout_ticks", "0x0800e46a", $hit_48
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 49, "RASM", "THREAD_LIFECYCLE", "_Thread_Kill_zombies", "0x0800e53a", $hit_49
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 50, "RASM", "THREAD_LIFECYCLE", "_Thread_Clear_waiting_for_join_at_exit", "0x0800e56c", $hit_50
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 51, "RASM", "THREAD_LIFECYCLE", "_Thread_Make_zombie", "0x0800e6ce", $hit_51
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 52, "RASM", "THREAD_LIFECYCLE", "_Thread_Try_life_change_request", "0x0800e7e0", $hit_52
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 53, "RASM", "THREAD_LIFECYCLE", "_Thread_Wait_for_join", "0x0800ea86", $hit_53
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 55, "RASM", "THREAD_LIFECYCLE", "_Thread_Cancel_ret", "0x0800ed6c", $hit_55
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 56, "RASM", "THREAD_LIFECYCLE", "_Thread_Make_zombie_dup", "0x0800ee86", $hit_56
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 57, "EDDI", "THREAD_LIFECYCLE", "_Thread_Life_action_handler_dup", "0x0800f014", $hit_57
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 58, "RASM", "THREAD_LIFECYCLE", "_Thread_Life_action_handler_dup", "0x0800f014", $hit_58
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 59, "RASM", "THREAD_LIFECYCLE", "_Thread_Wait_for_join_dup", "0x0800f13e", $hit_59
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 60, "EDDI", "THREAD_LIFECYCLE", "_Thread_Wait_for_join_dup", "0x0800f13e", $hit_60
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 63, "RASM", "THREAD_LIFECYCLE", "_Thread_Join_flush_filter_dup", "0x0800f35e", $hit_63
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 64, "RASM", "THREAD_LIFECYCLE", "_Thread_Set_state_locked", "0x0800f3d6", $hit_64
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 65, "RASM", "THREAD_LIFECYCLE", "_Thread_Set_state", "0x0800f456", $hit_65
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 68, "RASM", "THREAD_LIFECYCLE", "_Thread_Continue", "0x0800f63c", $hit_68
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 69, "RASM", "THREAD_LIFECYCLE", "_Thread_Timeout", "0x0800f670", $hit_69
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 70, "RASM", "THREAD_LIFECYCLE", "_Thread_Yield", "0x0800f6ec", $hit_70
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 79, "RASM", "THREAD_LIFECYCLE", "_TLS_Get_allocation_size", "0x0800fd2e", $hit_79
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 80, "EDDI", "THREAD_LIFECYCLE", "_TLS_Get_allocation_size", "0x0800fd2e", $hit_80
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 82, "RASM", "THREAD_LIFECYCLE", "_User_extensions_Thread_create_visitor", "0x08010182", $hit_82
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 83, "RASM", "THREAD_LIFECYCLE", "_User_extensions_Thread_delete_visitor", "0x080101d2", $hit_83
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 84, "RASM", "THREAD_LIFECYCLE", "_User_extensions_Thread_start_visitor", "0x08010222", $hit_84
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 85, "RASM", "THREAD_LIFECYCLE", "_User_extensions_Thread_restart_visitor", "0x08010272", $hit_85
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 86, "RASM", "THREAD_LIFECYCLE", "_User_extensions_Thread_begin_visitor", "0x080102be", $hit_86
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 87, "RASM", "THREAD_LIFECYCLE", "_User_extensions_Thread_exitted_visitor", "0x0801030a", $hit_87
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 89, "RASM", "THREAD_LIFECYCLE", "_User_extensions_Thread_terminate_visitor", "0x080103aa", $hit_89
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 123, "RASM", "THREAD_LIFECYCLE", "_Thread_Priority_perform_actions", "0x08013c00", $hit_123
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 124, "RASM", "THREAD_LIFECYCLE", "_Thread_Priority_do_perform_actions", "0x08014058", $hit_124
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 125, "RASM", "THREAD_LIFECYCLE", "_Thread_Priority_update", "0x08014106", $hit_125
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 126, "RASM", "THREAD_LIFECYCLE", "_Thread_Clear_state_locked", "0x080141a0", $hit_126
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 127, "RASM", "THREAD_LIFECYCLE", "_Thread_Clear_state", "0x0801424a", $hit_127
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 128, "RASM", "THREAD_LIFECYCLE", "_Thread_Create_idle", "0x080143dc", $hit_128
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 129, "EDDI", "THREAD_LIFECYCLE", "_Thread_Create_idle", "0x080143dc", $hit_129
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 130, "RASM", "THREAD_LIFECYCLE", "_Thread_Entry_adaptor_idle", "0x08014418", $hit_130
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 131, "RASM", "THREAD_LIFECYCLE", "_Thread_Free", "0x08014536", $hit_131
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 132, "RASM", "THREAD_LIFECYCLE", "_Thread_Load_environment", "0x0801493c", $hit_132
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 133, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Object_initialize", "0x080149a2", $hit_133
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 134, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Flush_critical", "0x08014b90", $hit_134
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 135, "RASM", "THREAD_LIFECYCLE", "_Thread_CPU_budget_consume_and_yield", "0x08014c58", $hit_135
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 136, "RASM", "THREAD_LIFECYCLE", "_Thread_CPU_budget_set_to_ticks_per_timeslice", "0x08014c9a", $hit_136
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 148, "RASM", "THREAD_LIFECYCLE", "_Thread_Get_name", "0x08025224", $hit_148
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
