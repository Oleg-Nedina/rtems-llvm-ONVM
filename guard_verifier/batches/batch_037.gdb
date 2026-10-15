set pagination off
set confirm off
target remote :4242
load

set $hit_145 = 0
set $hit_146 = 0
set $hit_147 = 0
set $hit_148 = 0

break *0x08024fd4
commands
  silent
  set $hit_145 = $hit_145 + 1
  if $hit_145 >= 5
    disable 1
  end
  continue
end

break *0x08025118
commands
  silent
  set $hit_146 = $hit_146 + 1
  if $hit_146 >= 5
    disable 2
  end
  continue
end

break *0x08025182
commands
  silent
  set $hit_147 = $hit_147 + 1
  if $hit_147 >= 5
    disable 3
  end
  continue
end

break *0x08025224
commands
  silent
  set $hit_148 = $hit_148 + 1
  if $hit_148 >= 5
    disable 4
  end
  continue
end

break bsp_reset
commands
  silent
  printf "=== GUARD VERIFICATION RESULTS ===\n"
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 145, "RASM", "CORE_SYSTEM", "rtems_configuration_get_stack_space_size", "0x08024fd4", $hit_145
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 146, "RASM", "OBJECTS_MEMORY", "_Heap_Resize_block", "0x08025118", $hit_146
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 147, "RASM", "CLASSIC_API", "_Semaphore_Post_binary", "0x08025182", $hit_147
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 148, "RASM", "THREAD_LIFECYCLE", "_Thread_Get_name", "0x08025224", $hit_148
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
