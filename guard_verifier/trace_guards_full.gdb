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

break *0x08004664
commands
  silent
  set $hit_2 = $hit_2 + 1
  continue
end
set $hit_2 = 0

break *0x080046c6
commands
  silent
  set $hit_3 = $hit_3 + 1
  continue
end
set $hit_3 = 0

break *0x08004c7a
commands
  silent
  set $hit_4 = $hit_4 + 1
  continue
end
set $hit_4 = 0

break *0x08004caa
commands
  silent
  set $hit_5 = $hit_5 + 1
  continue
end
set $hit_5 = 0

break *0x08004ccc
commands
  silent
  set $hit_6 = $hit_6 + 1
  continue
end
set $hit_6 = 0

break *0x08004cfa
commands
  silent
  set $hit_7 = $hit_7 + 1
  continue
end
set $hit_7 = 0

break *0x08004d24
commands
  silent
  set $hit_8 = $hit_8 + 1
  continue
end
set $hit_8 = 0

break *0x08004d48
commands
  silent
  set $hit_9 = $hit_9 + 1
  continue
end
set $hit_9 = 0

break *0x08004d6e
commands
  silent
  set $hit_10 = $hit_10 + 1
  continue
end
set $hit_10 = 0

break *0x08004d9e
commands
  silent
  set $hit_11 = $hit_11 + 1
  continue
end
set $hit_11 = 0

break *0x08005146
commands
  silent
  set $hit_12 = $hit_12 + 1
  continue
end
set $hit_12 = 0

break *0x080051bc
commands
  silent
  set $hit_13 = $hit_13 + 1
  continue
end
set $hit_13 = 0

break *0x080052fc
commands
  silent
  set $hit_14 = $hit_14 + 1
  continue
end
set $hit_14 = 0

break *0x080055c8
commands
  silent
  set $hit_15 = $hit_15 + 1
  continue
end
set $hit_15 = 0

break *0x080056f0
commands
  silent
  set $hit_16 = $hit_16 + 1
  continue
end
set $hit_16 = 0

break *0x080058da
commands
  silent
  set $hit_17 = $hit_17 + 1
  continue
end
set $hit_17 = 0

break *0x080059f0
commands
  silent
  set $hit_18 = $hit_18 + 1
  continue
end
set $hit_18 = 0

break *0x08005a3a
commands
  silent
  set $hit_19 = $hit_19 + 1
  continue
end
set $hit_19 = 0

break *0x08005b58
commands
  silent
  set $hit_20 = $hit_20 + 1
  continue
end
set $hit_20 = 0

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

break *0x08005e2e
commands
  silent
  set $hit_25 = $hit_25 + 1
  continue
end
set $hit_25 = 0

break *0x08005eae
commands
  silent
  set $hit_26 = $hit_26 + 1
  continue
end
set $hit_26 = 0

break *0x08005f6a
commands
  silent
  set $hit_27 = $hit_27 + 1
  continue
end
set $hit_27 = 0

break *0x08006074
commands
  silent
  set $hit_28 = $hit_28 + 1
  continue
end
set $hit_28 = 0

break *0x080060a8
commands
  silent
  set $hit_29 = $hit_29 + 1
  continue
end
set $hit_29 = 0

break *0x08006124
commands
  silent
  set $hit_30 = $hit_30 + 1
  continue
end
set $hit_30 = 0

break *0x080064f4
commands
  silent
  set $hit_31 = $hit_31 + 1
  continue
end
set $hit_31 = 0

break *0x08006576
commands
  silent
  set $hit_32 = $hit_32 + 1
  continue
end
set $hit_32 = 0

break *0x080065c6
commands
  silent
  set $hit_33 = $hit_33 + 1
  continue
end
set $hit_33 = 0

break *0x08006616
commands
  silent
  set $hit_34 = $hit_34 + 1
  continue
end
set $hit_34 = 0

break *0x08006666
commands
  silent
  set $hit_35 = $hit_35 + 1
  continue
end
set $hit_35 = 0

break *0x080066b2
commands
  silent
  set $hit_36 = $hit_36 + 1
  continue
end
set $hit_36 = 0

break *0x080066fe
commands
  silent
  set $hit_37 = $hit_37 + 1
  continue
end
set $hit_37 = 0

break *0x08006750
commands
  silent
  set $hit_38 = $hit_38 + 1
  continue
end
set $hit_38 = 0

break *0x0800679e
commands
  silent
  set $hit_39 = $hit_39 + 1
  continue
end
set $hit_39 = 0

break *0x08006a80
commands
  silent
  set $hit_40 = $hit_40 + 1
  continue
end
set $hit_40 = 0

break *0x08006a80
commands
  silent
  set $hit_41 = $hit_41 + 1
  continue
end
set $hit_41 = 0

break *0x08006bdc
commands
  silent
  set $hit_42 = $hit_42 + 1
  continue
end
set $hit_42 = 0

break *0x08006eb8
commands
  silent
  set $hit_43 = $hit_43 + 1
  continue
end
set $hit_43 = 0

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

break *0x08008488
commands
  silent
  set $hit_54 = $hit_54 + 1
  continue
end
set $hit_54 = 0

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

break *0x08008786
commands
  silent
  set $hit_58 = $hit_58 + 1
  continue
end
set $hit_58 = 0

break *0x080087d6
commands
  silent
  set $hit_59 = $hit_59 + 1
  continue
end
set $hit_59 = 0

break *0x08008810
commands
  silent
  set $hit_60 = $hit_60 + 1
  continue
end
set $hit_60 = 0

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

break *0x08009230
commands
  silent
  set $hit_63 = $hit_63 + 1
  continue
end
set $hit_63 = 0

break *0x0800926a
commands
  silent
  set $hit_64 = $hit_64 + 1
  continue
end
set $hit_64 = 0

break *0x080092d2
commands
  silent
  set $hit_65 = $hit_65 + 1
  continue
end
set $hit_65 = 0

break *0x0800935c
commands
  silent
  set $hit_66 = $hit_66 + 1
  continue
end
set $hit_66 = 0

break *0x080097b4
commands
  silent
  set $hit_67 = $hit_67 + 1
  continue
end
set $hit_67 = 0

break *0x08009862
commands
  silent
  set $hit_68 = $hit_68 + 1
  continue
end
set $hit_68 = 0

break *0x080098fc
commands
  silent
  set $hit_69 = $hit_69 + 1
  continue
end
set $hit_69 = 0

break *0x080099a6
commands
  silent
  set $hit_70 = $hit_70 + 1
  continue
end
set $hit_70 = 0

break *0x08009b7c
commands
  silent
  set $hit_71 = $hit_71 + 1
  continue
end
set $hit_71 = 0

break *0x08009b7c
commands
  silent
  set $hit_72 = $hit_72 + 1
  continue
end
set $hit_72 = 0

break *0x08009bb8
commands
  silent
  set $hit_73 = $hit_73 + 1
  continue
end
set $hit_73 = 0

break *0x08009cd6
commands
  silent
  set $hit_74 = $hit_74 + 1
  continue
end
set $hit_74 = 0

break *0x0800a114
commands
  silent
  set $hit_75 = $hit_75 + 1
  continue
end
set $hit_75 = 0

break *0x0800a1a4
commands
  silent
  set $hit_76 = $hit_76 + 1
  continue
end
set $hit_76 = 0

break *0x0800a1f8
commands
  silent
  set $hit_77 = $hit_77 + 1
  continue
end
set $hit_77 = 0

break *0x0800a3ae
commands
  silent
  set $hit_78 = $hit_78 + 1
  continue
end
set $hit_78 = 0

break *0x0800a412
commands
  silent
  set $hit_79 = $hit_79 + 1
  continue
end
set $hit_79 = 0

break *0x0800a4e2
commands
  silent
  set $hit_80 = $hit_80 + 1
  continue
end
set $hit_80 = 0

break *0x0800a5ea
commands
  silent
  set $hit_81 = $hit_81 + 1
  continue
end
set $hit_81 = 0

break *0x0800a614
commands
  silent
  set $hit_82 = $hit_82 + 1
  continue
end
set $hit_82 = 0

break *0x0800a76c
commands
  silent
  set $hit_83 = $hit_83 + 1
  continue
end
set $hit_83 = 0

break *0x0800a910
commands
  silent
  set $hit_84 = $hit_84 + 1
  continue
end
set $hit_84 = 0

break *0x0800a98e
commands
  silent
  set $hit_85 = $hit_85 + 1
  continue
end
set $hit_85 = 0

break *0x0800aa10
commands
  silent
  set $hit_86 = $hit_86 + 1
  continue
end
set $hit_86 = 0

break *0x0800aa46
commands
  silent
  set $hit_87 = $hit_87 + 1
  continue
end
set $hit_87 = 0

break *0x0800ac0a
commands
  silent
  set $hit_88 = $hit_88 + 1
  continue
end
set $hit_88 = 0

break *0x0800ae70
commands
  silent
  set $hit_89 = $hit_89 + 1
  continue
end
set $hit_89 = 0

break *0x0800af70
commands
  silent
  set $hit_90 = $hit_90 + 1
  continue
end
set $hit_90 = 0

break *0x0800b272
commands
  silent
  set $hit_91 = $hit_91 + 1
  continue
end
set $hit_91 = 0

break *0x0800b34a
commands
  silent
  set $hit_92 = $hit_92 + 1
  continue
end
set $hit_92 = 0

break *0x0800b448
commands
  silent
  set $hit_93 = $hit_93 + 1
  continue
end
set $hit_93 = 0

break *0x0800b572
commands
  silent
  set $hit_94 = $hit_94 + 1
  continue
end
set $hit_94 = 0

break *0x0800b572
commands
  silent
  set $hit_95 = $hit_95 + 1
  continue
end
set $hit_95 = 0

break *0x0800b6e4
commands
  silent
  set $hit_96 = $hit_96 + 1
  continue
end
set $hit_96 = 0

break *0x0800b6e4
commands
  silent
  set $hit_97 = $hit_97 + 1
  continue
end
set $hit_97 = 0

break *0x0800b806
commands
  silent
  set $hit_98 = $hit_98 + 1
  continue
end
set $hit_98 = 0

break *0x0800b988
commands
  silent
  set $hit_99 = $hit_99 + 1
  continue
end
set $hit_99 = 0

break *0x0800b988
commands
  silent
  set $hit_100 = $hit_100 + 1
  continue
end
set $hit_100 = 0

break *0x0800bba2
commands
  silent
  set $hit_101 = $hit_101 + 1
  continue
end
set $hit_101 = 0

break *0x0800bba2
commands
  silent
  set $hit_102 = $hit_102 + 1
  continue
end
set $hit_102 = 0

break *0x0800bbe2
commands
  silent
  set $hit_103 = $hit_103 + 1
  continue
end
set $hit_103 = 0

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

break *0x0800bdce
commands
  silent
  set $hit_106 = $hit_106 + 1
  continue
end
set $hit_106 = 0

break *0x0800bdce
commands
  silent
  set $hit_107 = $hit_107 + 1
  continue
end
set $hit_107 = 0

break *0x0800be72
commands
  silent
  set $hit_108 = $hit_108 + 1
  continue
end
set $hit_108 = 0

break *0x0800c650
commands
  silent
  set $hit_109 = $hit_109 + 1
  continue
end
set $hit_109 = 0

break *0x0800c7c8
commands
  silent
  set $hit_110 = $hit_110 + 1
  continue
end
set $hit_110 = 0

break *0x0800c8f2
commands
  silent
  set $hit_111 = $hit_111 + 1
  continue
end
set $hit_111 = 0

break *0x0800cb84
commands
  silent
  set $hit_112 = $hit_112 + 1
  continue
end
set $hit_112 = 0

break *0x0800cd48
commands
  silent
  set $hit_113 = $hit_113 + 1
  continue
end
set $hit_113 = 0

break *0x0800cd7e
commands
  silent
  set $hit_114 = $hit_114 + 1
  continue
end
set $hit_114 = 0

break *0x0800cda0
commands
  silent
  set $hit_115 = $hit_115 + 1
  continue
end
set $hit_115 = 0

break *0x0800d05a
commands
  silent
  set $hit_116 = $hit_116 + 1
  continue
end
set $hit_116 = 0

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

break *0x0800d49c
commands
  silent
  set $hit_121 = $hit_121 + 1
  continue
end
set $hit_121 = 0

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

break *0x080110a0
commands
  silent
  set $hit_125 = $hit_125 + 1
  continue
end
set $hit_125 = 0

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

break *0x080111a8
commands
  silent
  set $hit_128 = $hit_128 + 1
  continue
end
set $hit_128 = 0

break *0x08011278
commands
  silent
  set $hit_129 = $hit_129 + 1
  continue
end
set $hit_129 = 0

break *0x08012136
commands
  silent
  set $hit_130 = $hit_130 + 1
  continue
end
set $hit_130 = 0

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 1, "RASM", "CLASSIC_API", "rtems_task_start", "0x08004452", $hit_1
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 2, "RASM", "OBJECTS_MEMORY", "_Chain_Initialize", "0x08004664", $hit_2
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 3, "RASM", "USER_EXTENSIONS", "_User_extensions_Fatal", "0x080046c6", $hit_3
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 4, "RASM", "OBJECTS_MEMORY", "_Objects_Allocate_static", "0x08004c7a", $hit_4
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 5, "RASM", "OBJECTS_MEMORY", "_Objects_Free_static", "0x08004caa", $hit_5
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 6, "RASM", "SCHEDULER", "_Scheduler_default_Map_priority", "0x08004ccc", $hit_6
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 7, "RASM", "SCHEDULER", "_Scheduler_default_Unmap_priority", "0x08004cfa", $hit_7
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 8, "RASM", "SCHEDULER", "_Scheduler_default_Node_destroy", "0x08004d24", $hit_8
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 9, "RASM", "SCHEDULER", "_Scheduler_default_Release_job", "0x08004d48", $hit_9
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 10, "RASM", "SCHEDULER", "_Scheduler_default_Cancel_job", "0x08004d6e", $hit_10
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 11, "RASM", "THREAD_LIFECYCLE", "_Scheduler_default_Start_idle", "0x08004d9e", $hit_11
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 12, "RASM", "SCHEDULER", "_Scheduler_priority_Initialize", "0x08005146", $hit_12
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 13, "RASM", "SCHEDULER", "_Scheduler_priority_Node_initialize", "0x080051bc", $hit_13
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 14, "RASM", "SCHEDULER", "_Scheduler_priority_Block", "0x080052fc", $hit_14
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 15, "RASM", "SCHEDULER", "_Scheduler_priority_Update_priority", "0x080055c8", $hit_15
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 16, "RASM", "SCHEDULER", "_Scheduler_priority_Schedule", "0x080056f0", $hit_16
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 17, "RASM", "SCHEDULER", "_Scheduler_priority_Unblock", "0x080058da", $hit_17
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 18, "RASM", "SCHEDULER", "_Scheduler_priority_Yield", "0x080059f0", $hit_18
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 19, "RASM", "THREAD_LIFECYCLE", "_Stack_Allocator_allocate_for_idle_workspace", "0x08005a3a", $hit_19
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 20, "EDDI", "THREAD_LIFECYCLE", "_Thread_Do_dispatch", "0x08005b58", $hit_20
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 21, "RASM", "THREAD_LIFECYCLE", "_Thread_Entry_adaptor_numeric", "0x08005be2", $hit_21
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 22, "RASM", "THREAD_LIFECYCLE", "_Thread_Get", "0x08005cc4", $hit_22
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 23, "RASM", "THREAD_LIFECYCLE", "_User_extensions_Thread_begin_dup", "0x08005d74", $hit_23
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 24, "RASM", "THREAD_LIFECYCLE", "_User_extensions_Thread_exitted_dup", "0x08005db8", $hit_24
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 25, "RASM", "THREAD_LIFECYCLE", "_Thread_Set_state_locked", "0x08005e2e", $hit_25
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 26, "RASM", "THREAD_LIFECYCLE", "_Thread_Set_state", "0x08005eae", $hit_26
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 27, "RASM", "THREAD_LIFECYCLE", "_Thread_Start", "0x08005f6a", $hit_27
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 28, "RASM", "THREAD_LIFECYCLE", "_Thread_Continue", "0x08006074", $hit_28
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 29, "RASM", "THREAD_LIFECYCLE", "_Thread_Timeout", "0x080060a8", $hit_29
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 30, "RASM", "THREAD_LIFECYCLE", "_Thread_Yield", "0x08006124", $hit_30
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 31, "RASM", "USER_EXTENSIONS", "_User_extensions_Handler_initialization", "0x080064f4", $hit_31
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 32, "RASM", "THREAD_LIFECYCLE", "_User_extensions_Thread_create_visitor", "0x08006576", $hit_32
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 33, "RASM", "THREAD_LIFECYCLE", "_User_extensions_Thread_delete_visitor", "0x080065c6", $hit_33
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 34, "RASM", "THREAD_LIFECYCLE", "_User_extensions_Thread_start_visitor", "0x08006616", $hit_34
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 35, "RASM", "THREAD_LIFECYCLE", "_User_extensions_Thread_restart_visitor", "0x08006666", $hit_35
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 36, "RASM", "THREAD_LIFECYCLE", "_User_extensions_Thread_begin_visitor", "0x080066b2", $hit_36
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 37, "RASM", "THREAD_LIFECYCLE", "_User_extensions_Thread_exitted_visitor", "0x080066fe", $hit_37
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 38, "RASM", "USER_EXTENSIONS", "_User_extensions_Fatal_visitor", "0x08006750", $hit_38
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 39, "RASM", "THREAD_LIFECYCLE", "_User_extensions_Thread_terminate_visitor", "0x0800679e", $hit_39
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 40, "RASM", "USER_EXTENSIONS", "_User_extensions_Iterate", "0x08006a80", $hit_40
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 41, "EDDI", "USER_EXTENSIONS", "_User_extensions_Iterate", "0x08006a80", $hit_41
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 42, "RASM", "WATCHDOG_TIMERS", "_Watchdog_Insert", "0x08006bdc", $hit_42
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 43, "RASM", "WATCHDOG_TIMERS", "_Watchdog_Tick", "0x08006eb8", $hit_43
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 44, "RASM", "CORE_SYSTEM", "_Workspace_Allocate", "0x08006f08", $hit_44
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 45, "RASM", "CORE_SYSTEM", "_Workspace_Malloc_initialize_unified", "0x08006f30", $hit_45
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 46, "RASM", "CLASSIC_API", "rtems_task_create", "0x08007f34", $hit_46
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 47, "RASM", "CLASSIC_API", "_RTEMS_tasks_Allocate_and_prepare_stack", "0x08007fa0", $hit_47
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 48, "RASM", "CORE_SYSTEM", "rtems_initialize_data_structures", "0x08007fe4", $hit_48
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 49, "RASM", "CORE_SYSTEM", "rtems_initialize_executive", "0x08008058", $hit_49
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 50, "RASM", "CORE_SYSTEM", "_RTEMS_Lock_allocator", "0x0800809c", $hit_50
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 51, "RASM", "CORE_SYSTEM", "_RTEMS_Unlock_allocator", "0x080080d6", $hit_51
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 52, "RASM", "CORE_SYSTEM", "_API_Mutex_Lock", "0x08008134", $hit_52
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 53, "RASM", "CORE_SYSTEM", "_API_Mutex_Unlock", "0x0800818c", $hit_53
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 54, "RASM", "OBJECTS_MEMORY", "_Heap_Allocate_aligned_with_boundary", "0x08008488", $hit_54
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 55, "RASM", "CORE_SYSTEM", "_ISR_Handler_initialization", "0x08008508", $hit_55
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 56, "RASM", "CORE_SYSTEM", "_Mutex_recursive_Acquire", "0x08008584", $hit_56
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 57, "RASM", "CORE_SYSTEM", "_Mutex_recursive_Release", "0x080086ae", $hit_57
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 58, "RASM", "OBJECTS_MEMORY", "_Objects_Get", "0x08008786", $hit_58
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 59, "RASM", "OBJECTS_MEMORY", "_Protected_heap_Free", "0x080087d6", $hit_59
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 60, "RASM", "OBJECTS_MEMORY", "_Protected_heap_Get_free_information", "0x08008810", $hit_60
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 61, "RASM", "CORE_SYSTEM", "_RBTree_Extract", "0x080089f2", $hit_61
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 62, "RASM", "CORE_SYSTEM", "_RBTree_Insert_color", "0x080091e4", $hit_62
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 63, "RASM", "SCHEDULER", "_Scheduler_Handler_initialization", "0x08009230", $hit_63
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 64, "RASM", "THREAD_LIFECYCLE", "_Thread_Initialize_information", "0x0800926a", $hit_64
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 65, "RASM", "THREAD_LIFECYCLE", "_Thread_Handler_initialization", "0x080092d2", $hit_65
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 66, "RASM", "THREAD_LIFECYCLE", "_Thread_Priority_perform_actions", "0x0800935c", $hit_66
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 67, "RASM", "THREAD_LIFECYCLE", "_Thread_Priority_do_perform_actions", "0x080097b4", $hit_67
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 68, "RASM", "THREAD_LIFECYCLE", "_Thread_Priority_update", "0x08009862", $hit_68
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 69, "RASM", "THREAD_LIFECYCLE", "_Thread_Clear_state_locked", "0x080098fc", $hit_69
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 70, "RASM", "THREAD_LIFECYCLE", "_Thread_Clear_state", "0x080099a6", $hit_70
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 71, "RASM", "THREAD_LIFECYCLE", "_Thread_Create_idle", "0x08009b7c", $hit_71
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 72, "EDDI", "THREAD_LIFECYCLE", "_Thread_Create_idle", "0x08009b7c", $hit_72
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 73, "RASM", "THREAD_LIFECYCLE", "_Thread_Entry_adaptor_idle", "0x08009bb8", $hit_73
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 74, "RASM", "THREAD_LIFECYCLE", "_Thread_Free", "0x08009cd6", $hit_74
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 75, "RASM", "THREAD_LIFECYCLE", "_Thread_Initialize", "0x0800a114", $hit_75
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 76, "RASM", "THREAD_LIFECYCLE", "_Thread_Load_environment", "0x0800a1a4", $hit_76
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 77, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Enqueue_do_nothing_extra", "0x0800a1f8", $hit_77
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 78, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Enqueue", "0x0800a3ae", $hit_78
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 79, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Extract_locked", "0x0800a412", $hit_79
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 80, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Surrender", "0x0800a4e2", $hit_80
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 81, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Surrender_no_priority", "0x0800a5ea", $hit_81
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 82, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Do_nothing_priority_actions", "0x0800a614", $hit_82
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 83, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Priority_priority_actions", "0x0800a76c", $hit_83
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 84, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Priority_enqueue", "0x0800a910", $hit_84
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 85, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Priority_extract", "0x0800a98e", $hit_85
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 86, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Priority_surrender", "0x0800aa10", $hit_86
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 87, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Priority_first", "0x0800aa46", $hit_87
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 88, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Priority_inherit_priority_actions", "0x0800ac0a", $hit_88
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 89, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Priority_inherit_enqueue", "0x0800ae70", $hit_89
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 90, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Priority_inherit_extract", "0x0800af70", $hit_90
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 91, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Priority_inherit_surrender", "0x0800b272", $hit_91
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 92, "RASM", "THREAD_LIFECYCLE", "_Thread_Kill_zombies", "0x0800b34a", $hit_92
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 93, "RASM", "THREAD_LIFECYCLE", "_Thread_Set_life_protection", "0x0800b448", $hit_93
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 94, "RASM", "THREAD_LIFECYCLE", "_Thread_Wait_for_join_dup", "0x0800b572", $hit_94
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 95, "EDDI", "THREAD_LIFECYCLE", "_Thread_Wait_for_join_dup", "0x0800b572", $hit_95
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 96, "RASM", "THREAD_LIFECYCLE", "_Thread_Change_life_locked_dup", "0x0800b6e4", $hit_96
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 97, "EDDI", "THREAD_LIFECYCLE", "_Thread_Change_life_locked_dup", "0x0800b6e4", $hit_97
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 98, "RASM", "THREAD_LIFECYCLE", "_Thread_Make_zombie_dup", "0x0800b806", $hit_98
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 99, "EDDI", "THREAD_LIFECYCLE", "_Thread_Life_action_handler_dup", "0x0800b988", $hit_99
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 100, "RASM", "THREAD_LIFECYCLE", "_Thread_Life_action_handler_dup", "0x0800b988", $hit_100
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 101, "RASM", "USER_EXTENSIONS", "_User_extensions_Destroy_iterators_dup", "0x0800bba2", $hit_101
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 102, "EDDI", "USER_EXTENSIONS", "_User_extensions_Destroy_iterators_dup", "0x0800bba2", $hit_102
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 103, "RASM", "THREAD_LIFECYCLE", "_Thread_Join_flush_filter_dup", "0x0800bbe2", $hit_103
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 104, "RASM", "CORE_SYSTEM", "_Stack_Allocate", "0x0800bc24", $hit_104
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 105, "RASM", "CORE_SYSTEM", "_Stack_Free", "0x0800bc54", $hit_105
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 106, "RASM", "THREAD_LIFECYCLE", "_TLS_Get_allocation_size", "0x0800bdce", $hit_106
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 107, "EDDI", "THREAD_LIFECYCLE", "_TLS_Get_allocation_size", "0x0800bdce", $hit_107
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 108, "RASM", "WATCHDOG_TIMERS", "_Watchdog_Remove", "0x0800be72", $hit_108
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 109, "RASM", "OBJECTS_MEMORY", "_Heap_Initialize", "0x0800c650", $hit_109
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 110, "RASM", "OBJECTS_MEMORY", "_Heap_Block_allocate", "0x0800c7c8", $hit_110
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 111, "RASM", "OBJECTS_MEMORY", "_Heap_Block_split", "0x0800c8f2", $hit_111
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 112, "RASM", "OBJECTS_MEMORY", "_Heap_Free", "0x0800cb84", $hit_112
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 113, "RASM", "OBJECTS_MEMORY", "_Heap_Get_free_information", "0x0800cd48", $hit_113
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 114, "RASM", "OBJECTS_MEMORY", "_Objects_Close", "0x0800cd7e", $hit_114
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 115, "RASM", "OBJECTS_MEMORY", "_Objects_Free_nothing", "0x0800cda0", $hit_115
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 116, "RASM", "OBJECTS_MEMORY", "_Objects_Initialize_information", "0x0800d05a", $hit_116
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 117, "RASM", "CORE_SYSTEM", "_RBTree_Minimum", "0x0800d110", $hit_117
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 118, "RASM", "THREAD_LIFECYCLE", "_Thread_queue_Flush_critical", "0x0800d300", $hit_118
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 119, "RASM", "THREAD_LIFECYCLE", "_Thread_CPU_budget_consume_and_yield", "0x0800d3c8", $hit_119
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 120, "RASM", "THREAD_LIFECYCLE", "_Thread_CPU_budget_set_to_ticks_per_timeslice", "0x0800d40a", $hit_120
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 121, "RASM", "USER_EXTENSIONS", "_User_extensions_Add_set", "0x0800d49c", $hit_121
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 122, "RASM", "CORE_SYSTEM", "_Workspace_Free", "0x0800d4da", $hit_122
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 123, "RASM", "CORE_SYSTEM", "stm32f4_gpio_set_config", "0x0800e3cc", $hit_123
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 124, "RASM", "CORE_SYSTEM", "stm32f4_gpio_set_config_array", "0x0800e43a", $hit_124
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 125, "RASM", "USER_EXTENSIONS", "rtems_fatal_source_text", "0x080110a0", $hit_125
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 126, "RASM", "CORE_SYSTEM", "rtems_configuration_get_stack_space_size", "0x08011100", $hit_126
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 127, "RASM", "CORE_SYSTEM", "_ISR_Is_in_progress", "0x08011146", $hit_127
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 128, "RASM", "CLASSIC_API", "_Semaphore_Post_binary", "0x080111a8", $hit_128
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 129, "RASM", "THREAD_LIFECYCLE", "_Thread_Get_name", "0x08011278", $hit_129
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 130, "RASM", "OBJECTS_MEMORY", "_Objects_Name_to_string", "0x08012136", $hit_130
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
