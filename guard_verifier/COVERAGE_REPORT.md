# Report di Copertura Dinamica Controlli di Sicurezza (EDDI + RASM)

**Target:** STM32F407VG Discovery (ARM Cortex-M4 @ 168 MHz)
**Guard Points Totali a Catalogo:** 161
**Guard Points Testati:** 161 (100.0%)
**Guard Points Attivi (Eseguiti):** 126 (78.3%)
**Guard Points Dormienti:** 35 (21.7%)

## 1. Sintesi per Tipo di Protezione

| Tipo di Protezione | Checkpoint Totali | Checkpoint Attivi | Copertura % |
|---|---|---|---|
| **RASM (Control-Flow Integrity)** | 154 | 123 | 79.9% |
| **EDDI (Data-Flow Integrity)** | 7 | 3 | 42.9% |
| **Totale Combinato** | **161** | **126** | **78.3%** |

## 2. Copertura per Sottosistema RTEMS

| Sottosistema RTEMS | Guard Totali | Guard Attivi | Copertura % |
|---|---|---|---|
| `CLASSIC_API` | 10 | 9 | 90.0% |
| `CORE_SYSTEM` | 35 | 33 | 94.3% |
| `OBJECTS_MEMORY` | 12 | 10 | 83.3% |
| `SCHEDULER` | 13 | 13 | 100.0% |
| `THREAD_LIFECYCLE` | 70 | 44 | 62.9% |
| `USER_EXTENSIONS` | 10 | 6 | 60.0% |
| `WATCHDOG_TIMERS` | 11 | 11 | 100.0% |

## 3. Elenco Completo Guard Points Attivi

| ID | Tipo | Sottosistema | Funzione | Indirizzo Check | Esecuzioni Effettive |
|---|---|---|---|---|---|
| 2 | `RASM` | `CORE_SYSTEM` | `rtems_message_queue_receive` | `0x0800b492` | **5** |
| 3 | `RASM` | `CORE_SYSTEM` | `rtems_message_queue_send` | `0x0800b540` | **5** |
| 9 | `RASM` | `CLASSIC_API` | `rtems_task_create` | `0x0800c338` | **5** |
| 10 | `RASM` | `CLASSIC_API` | `_RTEMS_tasks_Allocate_and_prepare_stack` | `0x0800c3a4` | **5** |
| 12 | `RASM` | `CLASSIC_API` | `rtems_task_start` | `0x0800c60a` | **5** |
| 14 | `RASM` | `CORE_SYSTEM` | `_RTEMS_Lock_allocator` | `0x0800c734` | **5** |
| 15 | `RASM` | `CORE_SYSTEM` | `_RTEMS_Unlock_allocator` | `0x0800c76e` | **5** |
| 16 | `RASM` | `CORE_SYSTEM` | `_API_Mutex_Lock` | `0x0800c7cc` | **5** |
| 17 | `RASM` | `CORE_SYSTEM` | `_API_Mutex_Unlock` | `0x0800c824` | **5** |
| 18 | `RASM` | `CORE_SYSTEM` | `_CORE_message_queue_Seize` | `0x0800cb1a` | **5** |
| 19 | `RASM` | `CORE_SYSTEM` | `_CORE_message_queue_Submit` | `0x0800ccb8` | **5** |
| 27 | `RASM` | `CORE_SYSTEM` | `_Mutex_recursive_Acquire` | `0x0800d5e6` | **5** |
| 28 | `RASM` | `CORE_SYSTEM` | `_Mutex_recursive_Release` | `0x0800d6d4` | **5** |
| 30 | `RASM` | `SCHEDULER` | `_Scheduler_default_Map_priority` | `0x0800da90` | **5** |
| 32 | `RASM` | `SCHEDULER` | `_Scheduler_default_Node_destroy` | `0x0800dae8` | **5** |
| 37 | `RASM` | `SCHEDULER` | `_Scheduler_priority_Node_initialize` | `0x0800df80` | **5** |
| 38 | `RASM` | `SCHEDULER` | `_Scheduler_priority_Block` | `0x0800e0c0` | **5** |
| 41 | `RASM` | `SCHEDULER` | `_Scheduler_priority_Unblock` | `0x0800e69e` | **5** |
| 51 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Priority_update` | `0x0800ef7e` | **5** |
| 54 | `RASM` | `THREAD_LIFECYCLE` | `_User_extensions_Thread_begin_dup` | `0x0800f20c` | **5** |
| 62 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_queue_FIFO_enqueue` | `0x0800f816` | **5** |
| 65 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_queue_FIFO_surrender` | `0x0800f91c` | **5** |
| 75 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_queue_Add_timeout_ticks` | `0x08010602` | **5** |
| 76 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Kill_zombies` | `0x080106d2` | **5** |
| 78 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Make_zombie` | `0x08010866` | **5** |
| 80 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Wait_for_join` | `0x08010c1e` | **5** |
| 92 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Set_state` | `0x080115ee` | **5** |
| 93 | `RASM` | `CORE_SYSTEM` | `_Stack_Allocate` | `0x08011630` | **5** |
| 94 | `RASM` | `CORE_SYSTEM` | `_Stack_Free` | `0x08011660` | **5** |
| 95 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Continue` | `0x080117d4` | **5** |
| 96 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Timeout` | `0x08011808` | **5** |
| 98 | `RASM` | `WATCHDOG_TIMERS` | `_Timespec_Add_to` | `0x08011944` | **5** |
| 99 | `RASM` | `WATCHDOG_TIMERS` | `_Timespec_Divide` | `0x08011a08` | **5** |
| 100 | `RASM` | `WATCHDOG_TIMERS` | `_Timespec_Divide_by_integer` | `0x08011a72` | **5** |
| 101 | `RASM` | `WATCHDOG_TIMERS` | `_Timespec_From_ticks` | `0x08011ae6` | **5** |
| 102 | `RASM` | `WATCHDOG_TIMERS` | `_Timespec_Is_valid` | `0x08011b6e` | **5** |
| 103 | `RASM` | `WATCHDOG_TIMERS` | `_Timespec_Less_than` | `0x08011c4e` | **5** |
| 104 | `RASM` | `WATCHDOG_TIMERS` | `_Timespec_Subtract` | `0x08011cdc` | **5** |
| 105 | `RASM` | `WATCHDOG_TIMERS` | `_Timespec_To_ticks` | `0x08011d70` | **5** |
| 106 | `RASM` | `THREAD_LIFECYCLE` | `_TLS_Get_allocation_size` | `0x08011ebe` | **5** |
| 107 | `EDDI` | `THREAD_LIFECYCLE` | `_TLS_Get_allocation_size` | `0x08011ebe` | **5** |
| 109 | `RASM` | `THREAD_LIFECYCLE` | `_User_extensions_Thread_create_visitor` | `0x08012312` | **5** |
| 110 | `RASM` | `THREAD_LIFECYCLE` | `_User_extensions_Thread_delete_visitor` | `0x08012362` | **5** |
| 111 | `RASM` | `THREAD_LIFECYCLE` | `_User_extensions_Thread_start_visitor` | `0x080123b2` | **5** |
| 113 | `RASM` | `THREAD_LIFECYCLE` | `_User_extensions_Thread_begin_visitor` | `0x0801244e` | **5** |
| 116 | `RASM` | `THREAD_LIFECYCLE` | `_User_extensions_Thread_terminate_visitor` | `0x0801253a` | **5** |
| 117 | `RASM` | `USER_EXTENSIONS` | `_User_extensions_Iterate` | `0x0801281c` | **5** |
| 118 | `EDDI` | `USER_EXTENSIONS` | `_User_extensions_Iterate` | `0x0801281c` | **5** |
| 119 | `RASM` | `WATCHDOG_TIMERS` | `_Watchdog_Insert` | `0x08012978` | **5** |
| 120 | `RASM` | `WATCHDOG_TIMERS` | `_Watchdog_Remove` | `0x08012a1e` | **5** |
| 121 | `RASM` | `WATCHDOG_TIMERS` | `_Watchdog_Tick` | `0x08012cf4` | **5** |
| 122 | `RASM` | `CORE_SYSTEM` | `_Workspace_Allocate` | `0x08012d44` | **5** |
| 123 | `RASM` | `CORE_SYSTEM` | `_Workspace_Free` | `0x08012d86` | **5** |
| 131 | `RASM` | `OBJECTS_MEMORY` | `_Heap_Allocate_aligned_with_boundary` | `0x08014750` | **5** |
| 132 | `RASM` | `OBJECTS_MEMORY` | `_Heap_Free` | `0x08014a1c` | **5** |
| 135 | `RASM` | `OBJECTS_MEMORY` | `_Objects_Close` | `0x08014c5a` | **5** |
| 137 | `RASM` | `OBJECTS_MEMORY` | `_Protected_heap_Free` | `0x08014cb6` | **5** |
| 138 | `RASM` | `CORE_SYSTEM` | `_RBTree_Extract` | `0x08014e9a` | **5** |
| 139 | `RASM` | `CORE_SYSTEM` | `_RBTree_Insert_color` | `0x0801568c` | **5** |
| 140 | `RASM` | `CORE_SYSTEM` | `_RBTree_Minimum` | `0x08015744` | **5** |
| 142 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Clear_state_locked` | `0x08015864` | **5** |
| 143 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Clear_state` | `0x0801590e` | **5** |
| 147 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Free` | `0x08015bfa` | **5** |
| 148 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Load_environment` | `0x08015ff8` | **5** |
| 149 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_queue_Flush_critical` | `0x08016218` | **5** |
| 150 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_CPU_budget_consume_and_yield` | `0x080162e0` | **5** |
| 151 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_CPU_budget_set_to_ticks_per_timeslice` | `0x08016322` | **5** |
| 154 | `RASM` | `OBJECTS_MEMORY` | `_Heap_Block_allocate` | `0x08017498` | **5** |
| 155 | `RASM` | `OBJECTS_MEMORY` | `_Heap_Block_split` | `0x080175c2` | **5** |
| 114 | `RASM` | `THREAD_LIFECYCLE` | `_User_extensions_Thread_exitted_visitor` | `0x0801249a` | **4** |
| 7 | `RASM` | `CLASSIC_API` | `rtems_semaphore_obtain` | `0x0800be46` | **3** |
| 31 | `RASM` | `SCHEDULER` | `_Scheduler_default_Unmap_priority` | `0x0800dabe` | **3** |
| 39 | `RASM` | `SCHEDULER` | `_Scheduler_priority_Update_priority` | `0x0800e38c` | **3** |
| 46 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Priority_do_perform_actions` | `0x0800ed68` | **3** |
| 48 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Priority_apply` | `0x0800ee64` | **3** |
| 50 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Priority_changed` | `0x0800eed4` | **3** |
| 67 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_queue_Priority_enqueue` | `0x0800fc18` | **3** |
| 8 | `RASM` | `CLASSIC_API` | `rtems_semaphore_release` | `0x0800c2a2` | **2** |
| 42 | `RASM` | `SCHEDULER` | `_Scheduler_priority_Yield` | `0x0800e7b4` | **2** |
| 56 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_queue_Object_initialize` | `0x0800f286` | **2** |
| 61 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_queue_Do_nothing_priority_actions` | `0x0800f758` | **2** |
| 69 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_queue_Priority_surrender` | `0x0800fd18` | **2** |
| 97 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Yield` | `0x08011884` | **2** |
| 115 | `RASM` | `USER_EXTENSIONS` | `_User_extensions_Fatal_visitor` | `0x080124ec` | **2** |
| 156 | `RASM` | `CORE_SYSTEM` | `stm32f4_gpio_set_config` | `0x080184b8` | **2** |
| 1 | `RASM` | `CORE_SYSTEM` | `rtems_message_queue_create` | `0x0800b3c8` | **1** |
| 4 | `RASM` | `CLASSIC_API` | `rtems_semaphore_create` | `0x0800b96a` | **1** |
| 6 | `RASM` | `CLASSIC_API` | `_Semaphore_Manager_initialization` | `0x0800ba4a` | **1** |
| 13 | `RASM` | `USER_EXTENSIONS` | `rtems_fatal_source_text` | `0x0800c6fc` | **1** |
| 20 | `RASM` | `CORE_SYSTEM` | `_CORE_message_queue_Workspace_allocate` | `0x0800ccf0` | **1** |
| 22 | `RASM` | `CLASSIC_API` | `_CORE_semaphore_Initialize` | `0x0800cd96` | **1** |
| 24 | `RASM` | `CORE_SYSTEM` | `_ISR_Is_in_progress` | `0x0800ce3a` | **1** |
| 25 | `RASM` | `CORE_SYSTEM` | `_Mutex_Acquire` | `0x0800d4b2` | **1** |
| 26 | `RASM` | `CORE_SYSTEM` | `_Mutex_Release` | `0x0800d550` | **1** |
| 29 | `RASM` | `OBJECTS_MEMORY` | `_Protected_heap_Get_free_information` | `0x0800da6c` | **1** |
| 33 | `RASM` | `SCHEDULER` | `_Scheduler_default_Release_job` | `0x0800db0c` | **1** |
| 34 | `RASM` | `SCHEDULER` | `_Scheduler_default_Cancel_job` | `0x0800db32` | **1** |
| 35 | `RASM` | `THREAD_LIFECYCLE` | `_Scheduler_default_Start_idle` | `0x0800db62` | **1** |
| 36 | `RASM` | `SCHEDULER` | `_Scheduler_priority_Initialize` | `0x0800df0a` | **1** |
| 40 | `RASM` | `SCHEDULER` | `_Scheduler_priority_Schedule` | `0x0800e4b4` | **1** |
| 43 | `RASM` | `CLASSIC_API` | `_Semaphore_Post_binary` | `0x0800e81e` | **1** |
| 44 | `RASM` | `THREAD_LIFECYCLE` | `_Stack_Allocator_allocate_for_idle_workspace` | `0x0800e87e` | **1** |
| 53 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Entry_adaptor_numeric` | `0x0800f11e` | **1** |
| 58 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_queue_Deadlock_status` | `0x0800f2d4` | **1** |
| 63 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_queue_FIFO_extract` | `0x0800f880` | **1** |
| 66 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_queue_Priority_priority_actions` | `0x0800fa74` | **1** |
| 68 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_queue_Priority_extract` | `0x0800fc96` | **1** |
| 108 | `RASM` | `USER_EXTENSIONS` | `_User_extensions_Handler_initialization` | `0x08012290` | **1** |
| 124 | `RASM` | `CORE_SYSTEM` | `_Workspace_Malloc_initialize_unified` | `0x08012da8` | **1** |
| 125 | `RASM` | `CORE_SYSTEM` | `_Message_queue_Create` | `0x08013f36` | **1** |
| 126 | `RASM` | `CORE_SYSTEM` | `_Message_queue_Manager_initialization` | `0x08013f6e` | **1** |
| 127 | `RASM` | `CORE_SYSTEM` | `rtems_initialize_data_structures` | `0x080140ec` | **1** |
| 128 | `RASM` | `CORE_SYSTEM` | `rtems_initialize_executive` | `0x08014160` | **1** |
| 129 | `RASM` | `CORE_SYSTEM` | `_CORE_message_queue_Initialize` | `0x0801427e` | **1** |
| 130 | `RASM` | `CORE_SYSTEM` | `_CORE_message_queue_Insert_message` | `0x08014450` | **1** |
| 133 | `RASM` | `OBJECTS_MEMORY` | `_Heap_Get_free_information` | `0x08014be0` | **1** |
| 134 | `RASM` | `CORE_SYSTEM` | `_ISR_Handler_initialization` | `0x08014c28` | **1** |
| 141 | `RASM` | `SCHEDULER` | `_Scheduler_Handler_initialization` | `0x0801578c` | **1** |
| 144 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Create_idle` | `0x08015aa0` | **1** |
| 145 | `EDDI` | `THREAD_LIFECYCLE` | `_Thread_Create_idle` | `0x08015aa0` | **1** |
| 152 | `RASM` | `USER_EXTENSIONS` | `_User_extensions_Add_set` | `0x080163e0` | **1** |
| 153 | `RASM` | `OBJECTS_MEMORY` | `_Heap_Initialize` | `0x08017320` | **1** |
| 157 | `RASM` | `CORE_SYSTEM` | `stm32f4_gpio_set_config_array` | `0x08018526` | **1** |
| 158 | `RASM` | `CORE_SYSTEM` | `rtems_configuration_get_stack_space_size` | `0x08026434` | **1** |
| 160 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Get_name` | `0x08026604` | **1** |
| 161 | `RASM` | `OBJECTS_MEMORY` | `_Objects_Name_to_string` | `0x08026c1a` | **1** |

## 4. Elenco Completo Guard Points Dormienti

| ID | Tipo | Sottosistema | Funzione | Indirizzo Check | Stato |
|---|---|---|---|---|---|
| 5 | `RASM` | `CORE_SYSTEM` | `_CORE_ceiling_mutex_Set_owner` | `0x0800ba18` | Inattivo (0 hit) |
| 11 | `RASM` | `CLASSIC_API` | `rtems_task_delete` | `0x0800c462` | Inattivo (0 hit) |
| 21 | `RASM` | `CORE_SYSTEM` | `_CORE_mutex_Seize_slow` | `0x0800cd6e` | Inattivo (0 hit) |
| 23 | `RASM` | `USER_EXTENSIONS` | `_User_extensions_Fatal` | `0x0800cdf2` | Inattivo (0 hit) |
| 45 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Priority_perform_actions` | `0x0800e910` | Inattivo (0 hit) |
| 47 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Priority_add` | `0x0800eda0` | Inattivo (0 hit) |
| 49 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Priority_remove` | `0x0800ee9c` | Inattivo (0 hit) |
| 52 | `EDDI` | `THREAD_LIFECYCLE` | `_Thread_Do_dispatch` | `0x0800f094` | Inattivo (0 hit) |
| 55 | `RASM` | `THREAD_LIFECYCLE` | `_User_extensions_Thread_exitted_dup` | `0x0800f250` | Inattivo (0 hit) |
| 57 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_queue_Enqueue_do_nothing_extra` | `0x0800f2a8` | Inattivo (0 hit) |
| 59 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_queue_Extract_locked` | `0x0800f432` | Inattivo (0 hit) |
| 60 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_queue_Surrender_priority_ceiling` | `0x0800f72a` | Inattivo (0 hit) |
| 64 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_queue_FIFO_first` | `0x0800f8ae` | Inattivo (0 hit) |
| 70 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_queue_Priority_first` | `0x0800fd4e` | Inattivo (0 hit) |
| 71 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_queue_Priority_inherit_priority_actions` | `0x0800ff12` | Inattivo (0 hit) |
| 72 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_queue_Priority_inherit_enqueue` | `0x08010178` | Inattivo (0 hit) |
| 73 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_queue_Priority_inherit_extract` | `0x08010278` | Inattivo (0 hit) |
| 74 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_queue_Priority_inherit_surrender` | `0x0801057a` | Inattivo (0 hit) |
| 77 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Clear_waiting_for_join_at_exit` | `0x08010704` | Inattivo (0 hit) |
| 79 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Try_life_change_request` | `0x08010978` | Inattivo (0 hit) |
| 81 | `RASM` | `USER_EXTENSIONS` | `_User_extensions_Destroy_iterators` | `0x08010d2c` | Inattivo (0 hit) |
| 82 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Cancel_ret` | `0x08010f04` | Inattivo (0 hit) |
| 83 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Make_zombie_dup` | `0x0801101e` | Inattivo (0 hit) |
| 84 | `EDDI` | `THREAD_LIFECYCLE` | `_Thread_Life_action_handler_dup` | `0x080111ac` | Inattivo (0 hit) |
| 85 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Life_action_handler_dup` | `0x080111ac` | Inattivo (0 hit) |
| 86 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Wait_for_join_dup` | `0x080112d6` | Inattivo (0 hit) |
| 87 | `EDDI` | `THREAD_LIFECYCLE` | `_Thread_Wait_for_join_dup` | `0x080112d6` | Inattivo (0 hit) |
| 88 | `RASM` | `USER_EXTENSIONS` | `_User_extensions_Destroy_iterators_dup` | `0x080114b6` | Inattivo (0 hit) |
| 89 | `EDDI` | `USER_EXTENSIONS` | `_User_extensions_Destroy_iterators_dup` | `0x080114b6` | Inattivo (0 hit) |
| 90 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Join_flush_filter_dup` | `0x080114f6` | Inattivo (0 hit) |
| 91 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Set_state_locked` | `0x0801156e` | Inattivo (0 hit) |
| 112 | `RASM` | `THREAD_LIFECYCLE` | `_User_extensions_Thread_restart_visitor` | `0x08012402` | Inattivo (0 hit) |
| 136 | `RASM` | `OBJECTS_MEMORY` | `_Objects_Free_nothing` | `0x08014c7c` | Inattivo (0 hit) |
| 146 | `RASM` | `THREAD_LIFECYCLE` | `_Thread_Entry_adaptor_idle` | `0x08015adc` | Inattivo (0 hit) |
| 159 | `RASM` | `OBJECTS_MEMORY` | `_Heap_Resize_block` | `0x08026578` | Inattivo (0 hit) |

## 5. Dettaglio Guardie EDDI (Data-Flow Integrity)

| ID | Sottosistema | Funzione | Indirizzo Check | Esecuzioni | Condizione di Attivazione |
|---|---|---|---|---|---|
| 52 | `THREAD_LIFECYCLE` | `_Thread_Do_dispatch` | `0x0800f094` | **0** | Richiede Multi-Tasking / Context Switch / Thread Join |
| 84 | `THREAD_LIFECYCLE` | `_Thread_Life_action_handler_dup` | `0x080111ac` | **0** | Richiede Multi-Tasking / Context Switch / Thread Join |
| 87 | `THREAD_LIFECYCLE` | `_Thread_Wait_for_join_dup` | `0x080112d6` | **0** | Richiede Multi-Tasking / Context Switch / Thread Join |
| 89 | `USER_EXTENSIONS` | `_User_extensions_Destroy_iterators_dup` | `0x080114b6` | **0** | Richiede Multi-Tasking / Context Switch / Thread Join |
| 107 | `THREAD_LIFECYCLE` | `_TLS_Get_allocation_size` | `0x08011ebe` | **5** | Eseguito a runtime |
| 118 | `USER_EXTENSIONS` | `_User_extensions_Iterate` | `0x0801281c` | **5** | Eseguito a runtime |
| 145 | `THREAD_LIFECYCLE` | `_Thread_Create_idle` | `0x08015aa0` | **1** | Eseguito a runtime |

