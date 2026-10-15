# Report di Copertura Dinamica Controlli di Sicurezza (EDDI + RASM)

**Target:** STM32F407VG Discovery (ARM Cortex-M4 @ 168 MHz)
**Guard Points Totali a Catalogo:** 149
**Guard Points Testati:** 149 (100.0%)
**Guard Points Attivi (Eseguiti):** 86 (57.7%)
**Guard Points Dormienti:** 63 (42.3%)

## 1. Sintesi per Tipo di Protezione

| Tipo di Protezione | Checkpoint Totali | Checkpoint Attivi | Copertura % |
|---|---|---|---|
| **RASM (Control-Flow Integrity)** | 142 | 83 | 58.5% |
| **EDDI (Data-Flow Integrity)** | 7 | 3 | 42.9% |
| **Totale Combinato** | **149** | **86** | **57.7%** |

## 2. Copertura per Sottosistema RTEMS

| Sottosistema RTEMS | Guard Totali | Guard Attivi | Copertura % |
|---|---|---|---|
| `CLASSIC_API` | 5 | 3 | 60.0% |
| `CORE_SYSTEM` | 33 | 24 | 72.7% |
| `OBJECTS_MEMORY` | 12 | 8 | 66.7% |
| `SCHEDULER` | 13 | 7 | 53.8% |
| `THREAD_LIFECYCLE` | 65 | 29 | 44.6% |
| `USER_EXTENSIONS` | 10 | 5 | 50.0% |
| `WATCHDOG_TIMERS` | 11 | 10 | 90.9% |

## 3. Elenco Completo Guard Points Attivi

| ID | Tipo | Sottosistema | Funzione | Indirizzo Check | Esecuzioni Effettive |
|---|---|---|---|---|---|
| 2 | `RASM` | `CORE_SYSTEM` | `rtems_message_queue_receive` | `0x0800b202` | **5** |
| 3 | `RASM` | `CORE_SYSTEM` | `rtems_message_queue_send` | `0x0800b2b0` | **5** |
| 4 | `RASM` | `CLASSIC_API` | `rtems_task_create` | `0x0800b34c` | **5** |
| 5 | `RASM` | `CLASSIC_API` | `_RTEMS_tasks_Allocate_and_prepare_stack` | `0x0800b3b8` | **5** |
| 7 | `RASM` | `CLASSIC_API` | `rtems_task_start` | `0x0800b562` | **5** |
| 8 | `RASM` | `CORE_SYSTEM` | `_CORE_message_queue_Seize` | `0x0800b8e2` | **5** |
| 9 | `RASM` | `CORE_SYSTEM` | `_CORE_message_queue_Submit` | `0x0800ba80` | **5** |
| 13 | `RASM` | `SCHEDULER` | `_Scheduler_default_Map_priority` | `0x0800c1f0` | **5** |
| 20 | `RASM` | `SCHEDULER` | `_Scheduler_priority_Node_initialize` | `0x0800c6e0` | **5** |
| 21 | `RASM` | `SCHEDULER` | `_Scheduler_priority_Block` | `0x0800c820` | **5** |
| 24 | `RASM` | `SCHEDULER` | `_Scheduler_priority_Unblock` | `0x0800cdfe` | **5** |
| 29 | `RASM` | `THREAD_LIFECYCLE` | `_User_extensions_Thread_begin_dup` | `0x0800d1f4` | **5** |
| 35 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_queue_FIFO_enqueue` | `0x0800d67e` | **5** |
| 38 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_queue_FIFO_surrender` | `0x0800d784` | **5** |
| 48 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_queue_Add_timeout_ticks` | `0x0800e46a` | **5** |
| 49 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Kill_zombies` | `0x0800e53a` | **5** |
| 51 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Make_zombie` | `0x0800e6ce` | **5** |
| 53 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Wait_for_join` | `0x0800ea86` | **5** |
| 65 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Set_state` | `0x0800f456` | **5** |
| 66 | `RASM` | `CORE_SYSTEM` | `_Stack_Allocate` | `0x0800f498` | **5** |
| 68 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Continue` | `0x0800f63c` | **5** |
| 71 | `RASM` | `WATCHDOG_TIMERS` | `_Timespec_Add_to` | `0x0800f7ac` | **5** |
| 72 | `RASM` | `WATCHDOG_TIMERS` | `_Timespec_Divide` | `0x0800f878` | **5** |
| 73 | `RASM` | `WATCHDOG_TIMERS` | `_Timespec_Divide_by_integer` | `0x0800f8e2` | **5** |
| 74 | `RASM` | `WATCHDOG_TIMERS` | `_Timespec_From_ticks` | `0x0800f956` | **5** |
| 75 | `RASM` | `WATCHDOG_TIMERS` | `_Timespec_Is_valid` | `0x0800f9de` | **5** |
| 76 | `RASM` | `WATCHDOG_TIMERS` | `_Timespec_Less_than` | `0x0800fabe` | **5** |
| 77 | `RASM` | `WATCHDOG_TIMERS` | `_Timespec_Subtract` | `0x0800fb4c` | **5** |
| 78 | `RASM` | `WATCHDOG_TIMERS` | `_Timespec_To_ticks` | `0x0800fbe0` | **5** |
| 79 | `RASM` | `THREAD_LIFECYCLE` | `_TLS_Get_allocation_size` | `0x0800fd2e` | **5** |
| 80 | `EDDI` | `THREAD_LIFECYCLE` | `_TLS_Get_allocation_size` | `0x0800fd2e` | **5** |
| 82 | `RASM` | `THREAD_LIFECYCLE` | `_User_extensions_Thread_create_visitor` | `0x08010182` | **5** |
| 84 | `RASM` | `THREAD_LIFECYCLE` | `_User_extensions_Thread_start_visitor` | `0x08010222` | **5** |
| 86 | `RASM` | `THREAD_LIFECYCLE` | `_User_extensions_Thread_begin_visitor` | `0x080102be` | **5** |
| 89 | `RASM` | `THREAD_LIFECYCLE` | `_User_extensions_Thread_terminate_visitor` | `0x080103aa` | **5** |
| 90 | `RASM` | `USER_EXTENSIONS` | `_User_extensions_Iterate` | `0x0801068c` | **5** |
| 91 | `EDDI` | `USER_EXTENSIONS` | `_User_extensions_Iterate` | `0x0801068c` | **5** |
| 93 | `RASM` | `WATCHDOG_TIMERS` | `_Watchdog_Remove` | `0x0801088e` | **5** |
| 94 | `RASM` | `WATCHDOG_TIMERS` | `_Watchdog_Tick` | `0x08010b64` | **5** |
| 95 | `RASM` | `CORE_SYSTEM` | `_Workspace_Allocate` | `0x08010bb4` | **5** |
| 102 | `RASM` | `CORE_SYSTEM` | `_RTEMS_Lock_allocator` | `0x08012014` | **5** |
| 103 | `RASM` | `CORE_SYSTEM` | `_RTEMS_Unlock_allocator` | `0x0801204e` | **5** |
| 104 | `RASM` | `CORE_SYSTEM` | `_API_Mutex_Lock` | `0x080120ac` | **5** |
| 105 | `RASM` | `CORE_SYSTEM` | `_API_Mutex_Unlock` | `0x08012104` | **5** |
| 108 | `RASM` | `OBJECTS_MEMORY` | `_Heap_Allocate_aligned_with_boundary` | `0x080126e8` | **5** |
| 109 | `RASM` | `OBJECTS_MEMORY` | `_Heap_Free` | `0x080129b4` | **5** |
| 113 | `RASM` | `CORE_SYSTEM` | `_Mutex_recursive_Acquire` | `0x08012ba6` | **5** |
| 114 | `RASM` | `CORE_SYSTEM` | `_Mutex_recursive_Release` | `0x08012ca0` | **5** |
| 115 | `RASM` | `OBJECTS_MEMORY` | `_Objects_Close` | `0x08012d1a` | **5** |
| 117 | `RASM` | `OBJECTS_MEMORY` | `_Protected_heap_Free` | `0x0801302a` | **5** |
| 125 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Priority_update` | `0x08014106` | **5** |
| 126 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Clear_state_locked` | `0x080141a0` | **5** |
| 127 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Clear_state` | `0x0801424a` | **5** |
| 132 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Load_environment` | `0x0801493c` | **5** |
| 134 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_queue_Flush_critical` | `0x08014b90` | **5** |
| 135 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_CPU_budget_consume_and_yield` | `0x08014c58` | **5** |
| 136 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_CPU_budget_set_to_ticks_per_timeslice` | `0x08014c9a` | **5** |
| 139 | `RASM` | `OBJECTS_MEMORY` | `_Heap_Block_allocate` | `0x08015e10` | **5** |
| 140 | `RASM` | `OBJECTS_MEMORY` | `_Heap_Block_split` | `0x08015f3a` | **5** |
| 25 | `RASM` | `SCHEDULER` | `_Scheduler_priority_Yield` | `0x0800cf14` | **2** |
| 70 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Yield` | `0x0800f6ec` | **2** |
| 88 | `RASM` | `USER_EXTENSIONS` | `_User_extensions_Fatal_visitor` | `0x0801035c` | **2** |
| 142 | `RASM` | `CORE_SYSTEM` | `stm32f4_gpio_set_config` | `0x08016ff4` | **2** |
| 1 | `RASM` | `CORE_SYSTEM` | `rtems_message_queue_create` | `0x0800b138` | **1** |
| 10 | `RASM` | `CORE_SYSTEM` | `_CORE_message_queue_Workspace_allocate` | `0x0800bab8` | **1** |
| 18 | `RASM` | `THREAD_LIFECYCLE` | `_Scheduler_default_Start_idle` | `0x0800c2c2` | **1** |
| 19 | `RASM` | `SCHEDULER` | `_Scheduler_priority_Initialize` | `0x0800c66a` | **1** |
| 26 | `RASM` | `THREAD_LIFECYCLE` | `_Stack_Allocator_allocate_for_idle_workspace` | `0x0800cf5e` | **1** |
| 81 | `RASM` | `USER_EXTENSIONS` | `_User_extensions_Handler_initialization` | `0x08010100` | **1** |
| 97 | `RASM` | `CORE_SYSTEM` | `_Workspace_Malloc_initialize_unified` | `0x08010c18` | **1** |
| 98 | `RASM` | `CORE_SYSTEM` | `_Message_queue_Create` | `0x08011da6` | **1** |
| 99 | `RASM` | `CORE_SYSTEM` | `_Message_queue_Manager_initialization` | `0x08011dde` | **1** |
| 100 | `RASM` | `CORE_SYSTEM` | `rtems_initialize_data_structures` | `0x08011f5c` | **1** |
| 101 | `RASM` | `CORE_SYSTEM` | `rtems_initialize_executive` | `0x08011fd0` | **1** |
| 106 | `RASM` | `CORE_SYSTEM` | `_CORE_message_queue_Initialize` | `0x08012216` | **1** |
| 110 | `RASM` | `CORE_SYSTEM` | `_ISR_Handler_initialization` | `0x080129fc` | **1** |
| 122 | `RASM` | `SCHEDULER` | `_Scheduler_Handler_initialization` | `0x08013b38` | **1** |
| 128 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Create_idle` | `0x080143dc` | **1** |
| 129 | `EDDI` | `THREAD_LIFECYCLE` | `_Thread_Create_idle` | `0x080143dc` | **1** |
| 133 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_queue_Object_initialize` | `0x080149a2` | **1** |
| 137 | `RASM` | `USER_EXTENSIONS` | `_User_extensions_Add_set` | `0x08014d58` | **1** |
| 138 | `RASM` | `OBJECTS_MEMORY` | `_Heap_Initialize` | `0x08015c98` | **1** |
| 143 | `RASM` | `CORE_SYSTEM` | `stm32f4_gpio_set_config_array` | `0x08017062` | **1** |
| 145 | `RASM` | `CORE_SYSTEM` | `rtems_configuration_get_stack_space_size` | `0x08024fd4` | **1** |
| 148 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Get_name` | `0x08025224` | **1** |
| 149 | `RASM` | `OBJECTS_MEMORY` | `_Objects_Name_to_string` | `0x0802583a` | **1** |

## 4. Elenco Completo Guard Points Dormienti

| ID | Tipo | Sottosistema | Funzione | Indirizzo Check | Stato |
|---|---|---|---|---|---|
| 6 | `RASM` | `CLASSIC_API` | `rtems_task_delete` | `0x0800b476` | Inattivo (0 hit) |
| 11 | `RASM` | `USER_EXTENSIONS` | `_User_extensions_Fatal` | `0x0800bb16` | Inattivo (0 hit) |
| 12 | `RASM` | `CORE_SYSTEM` | `_ISR_Is_in_progress` | `0x0800bb5e` | Inattivo (0 hit) |
| 14 | `RASM` | `SCHEDULER` | `_Scheduler_default_Unmap_priority` | `0x0800c21e` | Inattivo (0 hit) |
| 15 | `RASM` | `SCHEDULER` | `_Scheduler_default_Node_destroy` | `0x0800c248` | Inattivo (0 hit) |
| 16 | `RASM` | `SCHEDULER` | `_Scheduler_default_Release_job` | `0x0800c26c` | Inattivo (0 hit) |
| 17 | `RASM` | `SCHEDULER` | `_Scheduler_default_Cancel_job` | `0x0800c292` | Inattivo (0 hit) |
| 22 | `RASM` | `SCHEDULER` | `_Scheduler_priority_Update_priority` | `0x0800caec` | Inattivo (0 hit) |
| 23 | `RASM` | `SCHEDULER` | `_Scheduler_priority_Schedule` | `0x0800cc14` | Inattivo (0 hit) |
| 27 | `EDDI` | `THREAD_LIFECYCLE` | `_Thread_Do_dispatch` | `0x0800d07c` | Inattivo (0 hit) |
| 28 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Entry_adaptor_numeric` | `0x0800d106` | Inattivo (0 hit) |
| 30 | `RASM` | `THREAD_LIFECYCLE` | `_User_extensions_Thread_exitted_dup` | `0x0800d238` | Inattivo (0 hit) |
| 31 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_queue_Enqueue_do_nothing_extra` | `0x0800d25c` | Inattivo (0 hit) |
| 32 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_queue_Deadlock_status` | `0x0800d288` | Inattivo (0 hit) |
| 33 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_queue_Extract_locked` | `0x0800d3e6` | Inattivo (0 hit) |
| 34 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_queue_Do_nothing_priority_actions` | `0x0800d5c0` | Inattivo (0 hit) |
| 36 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_queue_FIFO_extract` | `0x0800d6e8` | Inattivo (0 hit) |
| 37 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_queue_FIFO_first` | `0x0800d716` | Inattivo (0 hit) |
| 39 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_queue_Priority_priority_actions` | `0x0800d8dc` | Inattivo (0 hit) |
| 40 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_queue_Priority_enqueue` | `0x0800da80` | Inattivo (0 hit) |
| 41 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_queue_Priority_extract` | `0x0800dafe` | Inattivo (0 hit) |
| 42 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_queue_Priority_surrender` | `0x0800db80` | Inattivo (0 hit) |
| 43 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_queue_Priority_first` | `0x0800dbb6` | Inattivo (0 hit) |
| 44 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_queue_Priority_inherit_priority_actions` | `0x0800dd7a` | Inattivo (0 hit) |
| 45 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_queue_Priority_inherit_enqueue` | `0x0800dfe0` | Inattivo (0 hit) |
| 46 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_queue_Priority_inherit_extract` | `0x0800e0e0` | Inattivo (0 hit) |
| 47 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_queue_Priority_inherit_surrender` | `0x0800e3e2` | Inattivo (0 hit) |
| 50 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Clear_waiting_for_join_at_exit` | `0x0800e56c` | Inattivo (0 hit) |
| 52 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Try_life_change_request` | `0x0800e7e0` | Inattivo (0 hit) |
| 54 | `RASM` | `USER_EXTENSIONS` | `_User_extensions_Destroy_iterators` | `0x0800eb94` | Inattivo (0 hit) |
| 55 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Cancel_ret` | `0x0800ed6c` | Inattivo (0 hit) |
| 56 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Make_zombie_dup` | `0x0800ee86` | Inattivo (0 hit) |
| 57 | `EDDI` | `THREAD_LIFECYCLE` | `_Thread_Life_action_handler_dup` | `0x0800f014` | Inattivo (0 hit) |
| 58 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Life_action_handler_dup` | `0x0800f014` | Inattivo (0 hit) |
| 59 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Wait_for_join_dup` | `0x0800f13e` | Inattivo (0 hit) |
| 60 | `EDDI` | `THREAD_LIFECYCLE` | `_Thread_Wait_for_join_dup` | `0x0800f13e` | Inattivo (0 hit) |
| 61 | `RASM` | `USER_EXTENSIONS` | `_User_extensions_Destroy_iterators_dup` | `0x0800f31e` | Inattivo (0 hit) |
| 62 | `EDDI` | `USER_EXTENSIONS` | `_User_extensions_Destroy_iterators_dup` | `0x0800f31e` | Inattivo (0 hit) |
| 63 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Join_flush_filter_dup` | `0x0800f35e` | Inattivo (0 hit) |
| 64 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Set_state_locked` | `0x0800f3d6` | Inattivo (0 hit) |
| 67 | `RASM` | `CORE_SYSTEM` | `_Stack_Free` | `0x0800f4c8` | Inattivo (0 hit) |
| 69 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Timeout` | `0x0800f670` | Inattivo (0 hit) |
| 83 | `RASM` | `THREAD_LIFECYCLE` | `_User_extensions_Thread_delete_visitor` | `0x080101d2` | Inattivo (0 hit) |
| 85 | `RASM` | `THREAD_LIFECYCLE` | `_User_extensions_Thread_restart_visitor` | `0x08010272` | Inattivo (0 hit) |
| 87 | `RASM` | `THREAD_LIFECYCLE` | `_User_extensions_Thread_exitted_visitor` | `0x0801030a` | Inattivo (0 hit) |
| 92 | `RASM` | `WATCHDOG_TIMERS` | `_Watchdog_Insert` | `0x080107e8` | Inattivo (0 hit) |
| 96 | `RASM` | `CORE_SYSTEM` | `_Workspace_Free` | `0x08010bf6` | Inattivo (0 hit) |
| 107 | `RASM` | `CORE_SYSTEM` | `_CORE_message_queue_Insert_message` | `0x080123e8` | Inattivo (0 hit) |
| 111 | `RASM` | `CORE_SYSTEM` | `_Mutex_Acquire` | `0x08012a6e` | Inattivo (0 hit) |
| 112 | `RASM` | `CORE_SYSTEM` | `_Mutex_Release` | `0x08012b10` | Inattivo (0 hit) |
| 116 | `RASM` | `OBJECTS_MEMORY` | `_Objects_Free_nothing` | `0x08012d3c` | Inattivo (0 hit) |
| 118 | `RASM` | `OBJECTS_MEMORY` | `_Protected_heap_Get_free_information` | `0x08013064` | Inattivo (0 hit) |
| 119 | `RASM` | `CORE_SYSTEM` | `_RBTree_Extract` | `0x08013246` | Inattivo (0 hit) |
| 120 | `RASM` | `CORE_SYSTEM` | `_RBTree_Insert_color` | `0x08013a38` | Inattivo (0 hit) |
| 121 | `RASM` | `CORE_SYSTEM` | `_RBTree_Minimum` | `0x08013af0` | Inattivo (0 hit) |
| 123 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Priority_perform_actions` | `0x08013c00` | Inattivo (0 hit) |
| 124 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Priority_do_perform_actions` | `0x08014058` | Inattivo (0 hit) |
| 130 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Entry_adaptor_idle` | `0x08014418` | Inattivo (0 hit) |
| 131 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Free` | `0x08014536` | Inattivo (0 hit) |
| 141 | `RASM` | `OBJECTS_MEMORY` | `_Heap_Get_free_information` | `0x080160fc` | Inattivo (0 hit) |
| 144 | `RASM` | `USER_EXTENSIONS` | `rtems_fatal_source_text` | `0x08024f74` | Inattivo (0 hit) |
| 146 | `RASM` | `OBJECTS_MEMORY` | `_Heap_Resize_block` | `0x08025118` | Inattivo (0 hit) |
| 147 | `RASM` | `CLASSIC_API` | `_Semaphore_Post_binary` | `0x08025182` | Inattivo (0 hit) |

## 5. Dettaglio Guardie EDDI (Data-Flow Integrity)

| ID | Sottosistema | Funzione | Indirizzo Check | Esecuzioni | Condizione di Attivazione |
|---|---|---|---|---|---|
| 27 | `THREAD_LIFECYCLE` | `_Thread_Do_dispatch` | `0x0800d07c` | **0** | Richiede Multi-Tasking / Context Switch / Thread Join |
| 57 | `THREAD_LIFECYCLE` | `_Thread_Life_action_handler_dup` | `0x0800f014` | **0** | Richiede Multi-Tasking / Context Switch / Thread Join |
| 60 | `THREAD_LIFECYCLE` | `_Thread_Wait_for_join_dup` | `0x0800f13e` | **0** | Richiede Multi-Tasking / Context Switch / Thread Join |
| 62 | `USER_EXTENSIONS` | `_User_extensions_Destroy_iterators_dup` | `0x0800f31e` | **0** | Richiede Multi-Tasking / Context Switch / Thread Join |
| 80 | `THREAD_LIFECYCLE` | `_TLS_Get_allocation_size` | `0x0800fd2e` | **5** | Eseguito a runtime |
| 91 | `USER_EXTENSIONS` | `_User_extensions_Iterate` | `0x0801068c` | **5** | Eseguito a runtime |
| 129 | `THREAD_LIFECYCLE` | `_Thread_Create_idle` | `0x080143dc` | **1** | Eseguito a runtime |

