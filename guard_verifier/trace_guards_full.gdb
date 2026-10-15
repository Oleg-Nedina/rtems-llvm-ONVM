set pagination off
set confirm off
target remote :4242
load

set $hit_1 = 0
set $hit_2 = 0
set $hit_3 = 0
set $hit_4 = 0
set $hit_5 = 0
set $hit_6 = 0
set $hit_7 = 0
set $hit_8 = 0
set $hit_9 = 0
set $hit_10 = 0
set $hit_11 = 0
set $hit_12 = 0
set $hit_13 = 0
set $hit_14 = 0
set $hit_15 = 0
set $hit_16 = 0
set $hit_17 = 0
set $hit_18 = 0
set $hit_19 = 0
set $hit_20 = 0
set $hit_21 = 0
set $hit_22 = 0
set $hit_23 = 0
set $hit_24 = 0
set $hit_25 = 0
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
set $hit_54 = 0
set $hit_55 = 0
set $hit_56 = 0
set $hit_57 = 0
set $hit_58 = 0
set $hit_59 = 0
set $hit_60 = 0
set $hit_61 = 0
set $hit_62 = 0
set $hit_63 = 0
set $hit_64 = 0
set $hit_65 = 0
set $hit_66 = 0
set $hit_67 = 0
set $hit_68 = 0
set $hit_69 = 0
set $hit_70 = 0
set $hit_71 = 0
set $hit_72 = 0
set $hit_73 = 0
set $hit_74 = 0
set $hit_75 = 0
set $hit_76 = 0
set $hit_77 = 0
set $hit_78 = 0
set $hit_79 = 0
set $hit_80 = 0
set $hit_81 = 0
set $hit_82 = 0
set $hit_83 = 0
set $hit_84 = 0
set $hit_85 = 0
set $hit_86 = 0
set $hit_87 = 0
set $hit_88 = 0
set $hit_89 = 0
set $hit_90 = 0
set $hit_91 = 0
set $hit_92 = 0
set $hit_93 = 0
set $hit_94 = 0
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
set $hit_108 = 0
set $hit_109 = 0
set $hit_110 = 0
set $hit_111 = 0
set $hit_112 = 0
set $hit_113 = 0
set $hit_114 = 0
set $hit_115 = 0
set $hit_116 = 0
set $hit_117 = 0
set $hit_118 = 0
set $hit_119 = 0
set $hit_120 = 0
set $hit_121 = 0
set $hit_122 = 0
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
set $hit_137 = 0
set $hit_138 = 0
set $hit_139 = 0
set $hit_140 = 0
set $hit_141 = 0
set $hit_142 = 0
set $hit_143 = 0
set $hit_144 = 0
set $hit_145 = 0
set $hit_146 = 0
set $hit_147 = 0
set $hit_148 = 0
set $hit_149 = 0

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

break *0x0800b3b8
commands
  silent
  set $hit_5 = $hit_5 + 1
  if $hit_5 >= 5
    disable 5
  end
  continue
end

break *0x0800b476
commands
  silent
  set $hit_6 = $hit_6 + 1
  if $hit_6 >= 5
    disable 6
  end
  continue
end

break *0x0800b562
commands
  silent
  set $hit_7 = $hit_7 + 1
  if $hit_7 >= 5
    disable 7
  end
  continue
end

break *0x0800b8e2
commands
  silent
  set $hit_8 = $hit_8 + 1
  if $hit_8 >= 5
    disable 8
  end
  continue
end

break *0x0800ba80
commands
  silent
  set $hit_9 = $hit_9 + 1
  if $hit_9 >= 5
    disable 9
  end
  continue
end

break *0x0800bab8
commands
  silent
  set $hit_10 = $hit_10 + 1
  if $hit_10 >= 5
    disable 10
  end
  continue
end

break *0x0800bb16
commands
  silent
  set $hit_11 = $hit_11 + 1
  if $hit_11 >= 5
    disable 11
  end
  continue
end

break *0x0800bb5e
commands
  silent
  set $hit_12 = $hit_12 + 1
  if $hit_12 >= 5
    disable 12
  end
  continue
end

break *0x0800c1f0
commands
  silent
  set $hit_13 = $hit_13 + 1
  if $hit_13 >= 5
    disable 13
  end
  continue
end

break *0x0800c21e
commands
  silent
  set $hit_14 = $hit_14 + 1
  if $hit_14 >= 5
    disable 14
  end
  continue
end

break *0x0800c248
commands
  silent
  set $hit_15 = $hit_15 + 1
  if $hit_15 >= 5
    disable 15
  end
  continue
end

break *0x0800c26c
commands
  silent
  set $hit_16 = $hit_16 + 1
  if $hit_16 >= 5
    disable 16
  end
  continue
end

break *0x0800c292
commands
  silent
  set $hit_17 = $hit_17 + 1
  if $hit_17 >= 5
    disable 17
  end
  continue
end

break *0x0800c2c2
commands
  silent
  set $hit_18 = $hit_18 + 1
  if $hit_18 >= 5
    disable 18
  end
  continue
end

break *0x0800c66a
commands
  silent
  set $hit_19 = $hit_19 + 1
  if $hit_19 >= 5
    disable 19
  end
  continue
end

break *0x0800c6e0
commands
  silent
  set $hit_20 = $hit_20 + 1
  if $hit_20 >= 5
    disable 20
  end
  continue
end

break *0x0800c820
commands
  silent
  set $hit_21 = $hit_21 + 1
  if $hit_21 >= 5
    disable 21
  end
  continue
end

break *0x0800caec
commands
  silent
  set $hit_22 = $hit_22 + 1
  if $hit_22 >= 5
    disable 22
  end
  continue
end

break *0x0800cc14
commands
  silent
  set $hit_23 = $hit_23 + 1
  if $hit_23 >= 5
    disable 23
  end
  continue
end

break *0x0800cdfe
commands
  silent
  set $hit_24 = $hit_24 + 1
  if $hit_24 >= 5
    disable 24
  end
  continue
end

break *0x0800cf14
commands
  silent
  set $hit_25 = $hit_25 + 1
  if $hit_25 >= 5
    disable 25
  end
  continue
end

break *0x0800cf5e
commands
  silent
  set $hit_26 = $hit_26 + 1
  if $hit_26 >= 5
    disable 26
  end
  continue
end

break *0x0800d07c
commands
  silent
  set $hit_27 = $hit_27 + 1
  if $hit_27 >= 5
    disable 27
  end
  continue
end

break *0x0800d106
commands
  silent
  set $hit_28 = $hit_28 + 1
  if $hit_28 >= 5
    disable 28
  end
  continue
end

break *0x0800d1f4
commands
  silent
  set $hit_29 = $hit_29 + 1
  if $hit_29 >= 5
    disable 29
  end
  continue
end

break *0x0800d238
commands
  silent
  set $hit_30 = $hit_30 + 1
  if $hit_30 >= 5
    disable 30
  end
  continue
end

break *0x0800d25c
commands
  silent
  set $hit_31 = $hit_31 + 1
  if $hit_31 >= 5
    disable 31
  end
  continue
end

break *0x0800d288
commands
  silent
  set $hit_32 = $hit_32 + 1
  if $hit_32 >= 5
    disable 32
  end
  continue
end

break *0x0800d3e6
commands
  silent
  set $hit_33 = $hit_33 + 1
  if $hit_33 >= 5
    disable 33
  end
  continue
end

break *0x0800d5c0
commands
  silent
  set $hit_34 = $hit_34 + 1
  if $hit_34 >= 5
    disable 34
  end
  continue
end

break *0x0800d67e
commands
  silent
  set $hit_35 = $hit_35 + 1
  if $hit_35 >= 5
    disable 35
  end
  continue
end

break *0x0800d6e8
commands
  silent
  set $hit_36 = $hit_36 + 1
  if $hit_36 >= 5
    disable 36
  end
  continue
end

break *0x0800d716
commands
  silent
  set $hit_37 = $hit_37 + 1
  if $hit_37 >= 5
    disable 37
  end
  continue
end

break *0x0800d784
commands
  silent
  set $hit_38 = $hit_38 + 1
  if $hit_38 >= 5
    disable 38
  end
  continue
end

break *0x0800d8dc
commands
  silent
  set $hit_39 = $hit_39 + 1
  if $hit_39 >= 5
    disable 39
  end
  continue
end

break *0x0800da80
commands
  silent
  set $hit_40 = $hit_40 + 1
  if $hit_40 >= 5
    disable 40
  end
  continue
end

break *0x0800dafe
commands
  silent
  set $hit_41 = $hit_41 + 1
  if $hit_41 >= 5
    disable 41
  end
  continue
end

break *0x0800db80
commands
  silent
  set $hit_42 = $hit_42 + 1
  if $hit_42 >= 5
    disable 42
  end
  continue
end

break *0x0800dbb6
commands
  silent
  set $hit_43 = $hit_43 + 1
  if $hit_43 >= 5
    disable 43
  end
  continue
end

break *0x0800dd7a
commands
  silent
  set $hit_44 = $hit_44 + 1
  if $hit_44 >= 5
    disable 44
  end
  continue
end

break *0x0800dfe0
commands
  silent
  set $hit_45 = $hit_45 + 1
  if $hit_45 >= 5
    disable 45
  end
  continue
end

break *0x0800e0e0
commands
  silent
  set $hit_46 = $hit_46 + 1
  if $hit_46 >= 5
    disable 46
  end
  continue
end

break *0x0800e3e2
commands
  silent
  set $hit_47 = $hit_47 + 1
  if $hit_47 >= 5
    disable 47
  end
  continue
end

break *0x0800e46a
commands
  silent
  set $hit_48 = $hit_48 + 1
  if $hit_48 >= 5
    disable 48
  end
  continue
end

break *0x0800e53a
commands
  silent
  set $hit_49 = $hit_49 + 1
  if $hit_49 >= 5
    disable 49
  end
  continue
end

break *0x0800e56c
commands
  silent
  set $hit_50 = $hit_50 + 1
  if $hit_50 >= 5
    disable 50
  end
  continue
end

break *0x0800e6ce
commands
  silent
  set $hit_51 = $hit_51 + 1
  if $hit_51 >= 5
    disable 51
  end
  continue
end

break *0x0800e7e0
commands
  silent
  set $hit_52 = $hit_52 + 1
  if $hit_52 >= 5
    disable 52
  end
  continue
end

break *0x0800ea86
commands
  silent
  set $hit_53 = $hit_53 + 1
  if $hit_53 >= 5
    disable 53
  end
  continue
end

break *0x0800eb94
commands
  silent
  set $hit_54 = $hit_54 + 1
  if $hit_54 >= 5
    disable 54
  end
  continue
end

break *0x0800ed6c
commands
  silent
  set $hit_55 = $hit_55 + 1
  if $hit_55 >= 5
    disable 55
  end
  continue
end

break *0x0800ee86
commands
  silent
  set $hit_56 = $hit_56 + 1
  if $hit_56 >= 5
    disable 56
  end
  continue
end

break *0x0800f014
commands
  silent
  set $hit_57 = $hit_57 + 1
  set $hit_58 = $hit_58 + 1
  if $hit_57 >= 5
    disable 57
  end
  continue
end

break *0x0800f13e
commands
  silent
  set $hit_59 = $hit_59 + 1
  set $hit_60 = $hit_60 + 1
  if $hit_59 >= 5
    disable 58
  end
  continue
end

break *0x0800f31e
commands
  silent
  set $hit_61 = $hit_61 + 1
  set $hit_62 = $hit_62 + 1
  if $hit_61 >= 5
    disable 59
  end
  continue
end

break *0x0800f35e
commands
  silent
  set $hit_63 = $hit_63 + 1
  if $hit_63 >= 5
    disable 60
  end
  continue
end

break *0x0800f3d6
commands
  silent
  set $hit_64 = $hit_64 + 1
  if $hit_64 >= 5
    disable 61
  end
  continue
end

break *0x0800f456
commands
  silent
  set $hit_65 = $hit_65 + 1
  if $hit_65 >= 5
    disable 62
  end
  continue
end

break *0x0800f498
commands
  silent
  set $hit_66 = $hit_66 + 1
  if $hit_66 >= 5
    disable 63
  end
  continue
end

break *0x0800f4c8
commands
  silent
  set $hit_67 = $hit_67 + 1
  if $hit_67 >= 5
    disable 64
  end
  continue
end

break *0x0800f63c
commands
  silent
  set $hit_68 = $hit_68 + 1
  if $hit_68 >= 5
    disable 65
  end
  continue
end

break *0x0800f670
commands
  silent
  set $hit_69 = $hit_69 + 1
  if $hit_69 >= 5
    disable 66
  end
  continue
end

break *0x0800f6ec
commands
  silent
  set $hit_70 = $hit_70 + 1
  if $hit_70 >= 5
    disable 67
  end
  continue
end

break *0x0800f7ac
commands
  silent
  set $hit_71 = $hit_71 + 1
  if $hit_71 >= 5
    disable 68
  end
  continue
end

break *0x0800f878
commands
  silent
  set $hit_72 = $hit_72 + 1
  if $hit_72 >= 5
    disable 69
  end
  continue
end

break *0x0800f8e2
commands
  silent
  set $hit_73 = $hit_73 + 1
  if $hit_73 >= 5
    disable 70
  end
  continue
end

break *0x0800f956
commands
  silent
  set $hit_74 = $hit_74 + 1
  if $hit_74 >= 5
    disable 71
  end
  continue
end

break *0x0800f9de
commands
  silent
  set $hit_75 = $hit_75 + 1
  if $hit_75 >= 5
    disable 72
  end
  continue
end

break *0x0800fabe
commands
  silent
  set $hit_76 = $hit_76 + 1
  if $hit_76 >= 5
    disable 73
  end
  continue
end

break *0x0800fb4c
commands
  silent
  set $hit_77 = $hit_77 + 1
  if $hit_77 >= 5
    disable 74
  end
  continue
end

break *0x0800fbe0
commands
  silent
  set $hit_78 = $hit_78 + 1
  if $hit_78 >= 5
    disable 75
  end
  continue
end

break *0x0800fd2e
commands
  silent
  set $hit_79 = $hit_79 + 1
  set $hit_80 = $hit_80 + 1
  if $hit_79 >= 5
    disable 76
  end
  continue
end

break *0x08010100
commands
  silent
  set $hit_81 = $hit_81 + 1
  if $hit_81 >= 5
    disable 77
  end
  continue
end

break *0x08010182
commands
  silent
  set $hit_82 = $hit_82 + 1
  if $hit_82 >= 5
    disable 78
  end
  continue
end

break *0x080101d2
commands
  silent
  set $hit_83 = $hit_83 + 1
  if $hit_83 >= 5
    disable 79
  end
  continue
end

break *0x08010222
commands
  silent
  set $hit_84 = $hit_84 + 1
  if $hit_84 >= 5
    disable 80
  end
  continue
end

break *0x08010272
commands
  silent
  set $hit_85 = $hit_85 + 1
  if $hit_85 >= 5
    disable 81
  end
  continue
end

break *0x080102be
commands
  silent
  set $hit_86 = $hit_86 + 1
  if $hit_86 >= 5
    disable 82
  end
  continue
end

break *0x0801030a
commands
  silent
  set $hit_87 = $hit_87 + 1
  if $hit_87 >= 5
    disable 83
  end
  continue
end

break *0x0801035c
commands
  silent
  set $hit_88 = $hit_88 + 1
  if $hit_88 >= 5
    disable 84
  end
  continue
end

break *0x080103aa
commands
  silent
  set $hit_89 = $hit_89 + 1
  if $hit_89 >= 5
    disable 85
  end
  continue
end

break *0x0801068c
commands
  silent
  set $hit_90 = $hit_90 + 1
  set $hit_91 = $hit_91 + 1
  if $hit_90 >= 5
    disable 86
  end
  continue
end

break *0x080107e8
commands
  silent
  set $hit_92 = $hit_92 + 1
  if $hit_92 >= 5
    disable 87
  end
  continue
end

break *0x0801088e
commands
  silent
  set $hit_93 = $hit_93 + 1
  if $hit_93 >= 5
    disable 88
  end
  continue
end

break *0x08010b64
commands
  silent
  set $hit_94 = $hit_94 + 1
  if $hit_94 >= 5
    disable 89
  end
  continue
end

break *0x08010bb4
commands
  silent
  set $hit_95 = $hit_95 + 1
  if $hit_95 >= 5
    disable 90
  end
  continue
end

break *0x08010bf6
commands
  silent
  set $hit_96 = $hit_96 + 1
  if $hit_96 >= 5
    disable 91
  end
  continue
end

break *0x08010c18
commands
  silent
  set $hit_97 = $hit_97 + 1
  if $hit_97 >= 5
    disable 92
  end
  continue
end

break *0x08011da6
commands
  silent
  set $hit_98 = $hit_98 + 1
  if $hit_98 >= 5
    disable 93
  end
  continue
end

break *0x08011dde
commands
  silent
  set $hit_99 = $hit_99 + 1
  if $hit_99 >= 5
    disable 94
  end
  continue
end

break *0x08011f5c
commands
  silent
  set $hit_100 = $hit_100 + 1
  if $hit_100 >= 5
    disable 95
  end
  continue
end

break *0x08011fd0
commands
  silent
  set $hit_101 = $hit_101 + 1
  if $hit_101 >= 5
    disable 96
  end
  continue
end

break *0x08012014
commands
  silent
  set $hit_102 = $hit_102 + 1
  if $hit_102 >= 5
    disable 97
  end
  continue
end

break *0x0801204e
commands
  silent
  set $hit_103 = $hit_103 + 1
  if $hit_103 >= 5
    disable 98
  end
  continue
end

break *0x080120ac
commands
  silent
  set $hit_104 = $hit_104 + 1
  if $hit_104 >= 5
    disable 99
  end
  continue
end

break *0x08012104
commands
  silent
  set $hit_105 = $hit_105 + 1
  if $hit_105 >= 5
    disable 100
  end
  continue
end

break *0x08012216
commands
  silent
  set $hit_106 = $hit_106 + 1
  if $hit_106 >= 5
    disable 101
  end
  continue
end

break *0x080123e8
commands
  silent
  set $hit_107 = $hit_107 + 1
  if $hit_107 >= 5
    disable 102
  end
  continue
end

break *0x080126e8
commands
  silent
  set $hit_108 = $hit_108 + 1
  if $hit_108 >= 5
    disable 103
  end
  continue
end

break *0x080129b4
commands
  silent
  set $hit_109 = $hit_109 + 1
  if $hit_109 >= 5
    disable 104
  end
  continue
end

break *0x080129fc
commands
  silent
  set $hit_110 = $hit_110 + 1
  if $hit_110 >= 5
    disable 105
  end
  continue
end

break *0x08012a6e
commands
  silent
  set $hit_111 = $hit_111 + 1
  if $hit_111 >= 5
    disable 106
  end
  continue
end

break *0x08012b10
commands
  silent
  set $hit_112 = $hit_112 + 1
  if $hit_112 >= 5
    disable 107
  end
  continue
end

break *0x08012ba6
commands
  silent
  set $hit_113 = $hit_113 + 1
  if $hit_113 >= 5
    disable 108
  end
  continue
end

break *0x08012ca0
commands
  silent
  set $hit_114 = $hit_114 + 1
  if $hit_114 >= 5
    disable 109
  end
  continue
end

break *0x08012d1a
commands
  silent
  set $hit_115 = $hit_115 + 1
  if $hit_115 >= 5
    disable 110
  end
  continue
end

break *0x08012d3c
commands
  silent
  set $hit_116 = $hit_116 + 1
  if $hit_116 >= 5
    disable 111
  end
  continue
end

break *0x0801302a
commands
  silent
  set $hit_117 = $hit_117 + 1
  if $hit_117 >= 5
    disable 112
  end
  continue
end

break *0x08013064
commands
  silent
  set $hit_118 = $hit_118 + 1
  if $hit_118 >= 5
    disable 113
  end
  continue
end

break *0x08013246
commands
  silent
  set $hit_119 = $hit_119 + 1
  if $hit_119 >= 5
    disable 114
  end
  continue
end

break *0x08013a38
commands
  silent
  set $hit_120 = $hit_120 + 1
  if $hit_120 >= 5
    disable 115
  end
  continue
end

break *0x08013af0
commands
  silent
  set $hit_121 = $hit_121 + 1
  if $hit_121 >= 5
    disable 116
  end
  continue
end

break *0x08013b38
commands
  silent
  set $hit_122 = $hit_122 + 1
  if $hit_122 >= 5
    disable 117
  end
  continue
end

break *0x08013c00
commands
  silent
  set $hit_123 = $hit_123 + 1
  if $hit_123 >= 5
    disable 118
  end
  continue
end

break *0x08014058
commands
  silent
  set $hit_124 = $hit_124 + 1
  if $hit_124 >= 5
    disable 119
  end
  continue
end

break *0x08014106
commands
  silent
  set $hit_125 = $hit_125 + 1
  if $hit_125 >= 5
    disable 120
  end
  continue
end

break *0x080141a0
commands
  silent
  set $hit_126 = $hit_126 + 1
  if $hit_126 >= 5
    disable 121
  end
  continue
end

break *0x0801424a
commands
  silent
  set $hit_127 = $hit_127 + 1
  if $hit_127 >= 5
    disable 122
  end
  continue
end

break *0x080143dc
commands
  silent
  set $hit_128 = $hit_128 + 1
  set $hit_129 = $hit_129 + 1
  if $hit_128 >= 5
    disable 123
  end
  continue
end

break *0x08014418
commands
  silent
  set $hit_130 = $hit_130 + 1
  if $hit_130 >= 5
    disable 124
  end
  continue
end

break *0x08014536
commands
  silent
  set $hit_131 = $hit_131 + 1
  if $hit_131 >= 5
    disable 125
  end
  continue
end

break *0x0801493c
commands
  silent
  set $hit_132 = $hit_132 + 1
  if $hit_132 >= 5
    disable 126
  end
  continue
end

break *0x080149a2
commands
  silent
  set $hit_133 = $hit_133 + 1
  if $hit_133 >= 5
    disable 127
  end
  continue
end

break *0x08014b90
commands
  silent
  set $hit_134 = $hit_134 + 1
  if $hit_134 >= 5
    disable 128
  end
  continue
end

break *0x08014c58
commands
  silent
  set $hit_135 = $hit_135 + 1
  if $hit_135 >= 5
    disable 129
  end
  continue
end

break *0x08014c9a
commands
  silent
  set $hit_136 = $hit_136 + 1
  if $hit_136 >= 5
    disable 130
  end
  continue
end

break *0x08014d58
commands
  silent
  set $hit_137 = $hit_137 + 1
  if $hit_137 >= 5
    disable 131
  end
  continue
end

break *0x08015c98
commands
  silent
  set $hit_138 = $hit_138 + 1
  if $hit_138 >= 5
    disable 132
  end
  continue
end

break *0x08015e10
commands
  silent
  set $hit_139 = $hit_139 + 1
  if $hit_139 >= 5
    disable 133
  end
  continue
end

break *0x08015f3a
commands
  silent
  set $hit_140 = $hit_140 + 1
  if $hit_140 >= 5
    disable 134
  end
  continue
end

break *0x080160fc
commands
  silent
  set $hit_141 = $hit_141 + 1
  if $hit_141 >= 5
    disable 135
  end
  continue
end

break *0x08016ff4
commands
  silent
  set $hit_142 = $hit_142 + 1
  if $hit_142 >= 5
    disable 136
  end
  continue
end

break *0x08017062
commands
  silent
  set $hit_143 = $hit_143 + 1
  if $hit_143 >= 5
    disable 137
  end
  continue
end

break *0x08024f74
commands
  silent
  set $hit_144 = $hit_144 + 1
  if $hit_144 >= 5
    disable 138
  end
  continue
end

break *0x08024fd4
commands
  silent
  set $hit_145 = $hit_145 + 1
  if $hit_145 >= 5
    disable 139
  end
  continue
end

break *0x08025118
commands
  silent
  set $hit_146 = $hit_146 + 1
  if $hit_146 >= 5
    disable 140
  end
  continue
end

break *0x08025182
commands
  silent
  set $hit_147 = $hit_147 + 1
  if $hit_147 >= 5
    disable 141
  end
  continue
end

break *0x08025224
commands
  silent
  set $hit_148 = $hit_148 + 1
  if $hit_148 >= 5
    disable 142
  end
  continue
end

break *0x0802583a
commands
  silent
  set $hit_149 = $hit_149 + 1
  if $hit_149 >= 5
    disable 143
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
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 5, "RASM", "CLASSIC_API", "_RTEMS_tasks_Allocate_and_prepare_stack", "0x0800b3b8", $hit_5
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 6, "RASM", "CLASSIC_API", "rtems_task_delete", "0x0800b476", $hit_6
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 7, "RASM", "CLASSIC_API", "rtems_task_start", "0x0800b562", $hit_7
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 8, "RASM", "CORE_SYSTEM", "_CORE_message_queue_Seize", "0x0800b8e2", $hit_8
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 9, "RASM", "CORE_SYSTEM", "_CORE_message_queue_Submit", "0x0800ba80", $hit_9
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 10, "RASM", "CORE_SYSTEM", "_CORE_message_queue_Workspace_allocate", "0x0800bab8", $hit_10
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 11, "RASM", "USER_EXTENSIONS", "_User_extensions_Fatal", "0x0800bb16", $hit_11
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 12, "RASM", "CORE_SYSTEM", "_ISR_Is_in_progress", "0x0800bb5e", $hit_12
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 13, "RASM", "SCHEDULER", "_Scheduler_default_Map_priority", "0x0800c1f0", $hit_13
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 14, "RASM", "SCHEDULER", "_Scheduler_default_Unmap_priority", "0x0800c21e", $hit_14
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 15, "RASM", "SCHEDULER", "_Scheduler_default_Node_destroy", "0x0800c248", $hit_15
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 16, "RASM", "SCHEDULER", "_Scheduler_default_Release_job", "0x0800c26c", $hit_16
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 17, "RASM", "SCHEDULER", "_Scheduler_default_Cancel_job", "0x0800c292", $hit_17
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 18, "RASM", "THREAD_LIFECYCLE", "_Scheduler_default_Start_idle", "0x0800c2c2", $hit_18
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 19, "RASM", "SCHEDULER", "_Scheduler_priority_Initialize", "0x0800c66a", $hit_19
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 20, "RASM", "SCHEDULER", "_Scheduler_priority_Node_initialize", "0x0800c6e0", $hit_20
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 21, "RASM", "SCHEDULER", "_Scheduler_priority_Block", "0x0800c820", $hit_21
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 22, "RASM", "SCHEDULER", "_Scheduler_priority_Update_priority", "0x0800caec", $hit_22
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 23, "RASM", "SCHEDULER", "_Scheduler_priority_Schedule", "0x0800cc14", $hit_23
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 24, "RASM", "SCHEDULER", "_Scheduler_priority_Unblock", "0x0800cdfe", $hit_24
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 25, "RASM", "SCHEDULER", "_Scheduler_priority_Yield", "0x0800cf14", $hit_25
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
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 54, "RASM", "USER_EXTENSIONS", "_User_extensions_Destroy_iterators", "0x0800eb94", $hit_54
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 55, "RASM", "THREAD_LIFECYCLE", "_Thread_Cancel_ret", "0x0800ed6c", $hit_55
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 56, "RASM", "THREAD_LIFECYCLE", "_Thread_Make_zombie_dup", "0x0800ee86", $hit_56
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 57, "EDDI", "THREAD_LIFECYCLE", "_Thread_Life_action_handler_dup", "0x0800f014", $hit_57
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 58, "RASM", "THREAD_LIFECYCLE", "_Thread_Life_action_handler_dup", "0x0800f014", $hit_58
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 59, "RASM", "THREAD_LIFECYCLE", "_Thread_Wait_for_join_dup", "0x0800f13e", $hit_59
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 60, "EDDI", "THREAD_LIFECYCLE", "_Thread_Wait_for_join_dup", "0x0800f13e", $hit_60
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 61, "RASM", "USER_EXTENSIONS", "_User_extensions_Destroy_iterators_dup", "0x0800f31e", $hit_61
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 62, "EDDI", "USER_EXTENSIONS", "_User_extensions_Destroy_iterators_dup", "0x0800f31e", $hit_62
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 63, "RASM", "THREAD_LIFECYCLE", "_Thread_Join_flush_filter_dup", "0x0800f35e", $hit_63
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 64, "RASM", "THREAD_LIFECYCLE", "_Thread_Set_state_locked", "0x0800f3d6", $hit_64
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 65, "RASM", "THREAD_LIFECYCLE", "_Thread_Set_state", "0x0800f456", $hit_65
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 66, "RASM", "CORE_SYSTEM", "_Stack_Allocate", "0x0800f498", $hit_66
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 67, "RASM", "CORE_SYSTEM", "_Stack_Free", "0x0800f4c8", $hit_67
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 68, "RASM", "THREAD_LIFECYCLE", "_Thread_Continue", "0x0800f63c", $hit_68
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 69, "RASM", "THREAD_LIFECYCLE", "_Thread_Timeout", "0x0800f670", $hit_69
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 70, "RASM", "THREAD_LIFECYCLE", "_Thread_Yield", "0x0800f6ec", $hit_70
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 71, "RASM", "WATCHDOG_TIMERS", "_Timespec_Add_to", "0x0800f7ac", $hit_71
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 72, "RASM", "WATCHDOG_TIMERS", "_Timespec_Divide", "0x0800f878", $hit_72
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 73, "RASM", "WATCHDOG_TIMERS", "_Timespec_Divide_by_integer", "0x0800f8e2", $hit_73
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 74, "RASM", "WATCHDOG_TIMERS", "_Timespec_From_ticks", "0x0800f956", $hit_74
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 75, "RASM", "WATCHDOG_TIMERS", "_Timespec_Is_valid", "0x0800f9de", $hit_75
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 76, "RASM", "WATCHDOG_TIMERS", "_Timespec_Less_than", "0x0800fabe", $hit_76
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 77, "RASM", "WATCHDOG_TIMERS", "_Timespec_Subtract", "0x0800fb4c", $hit_77
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 78, "RASM", "WATCHDOG_TIMERS", "_Timespec_To_ticks", "0x0800fbe0", $hit_78
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 79, "RASM", "THREAD_LIFECYCLE", "_TLS_Get_allocation_size", "0x0800fd2e", $hit_79
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 80, "EDDI", "THREAD_LIFECYCLE", "_TLS_Get_allocation_size", "0x0800fd2e", $hit_80
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 81, "RASM", "USER_EXTENSIONS", "_User_extensions_Handler_initialization", "0x08010100", $hit_81
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 82, "RASM", "THREAD_LIFECYCLE", "_User_extensions_Thread_create_visitor", "0x08010182", $hit_82
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 83, "RASM", "THREAD_LIFECYCLE", "_User_extensions_Thread_delete_visitor", "0x080101d2", $hit_83
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 84, "RASM", "THREAD_LIFECYCLE", "_User_extensions_Thread_start_visitor", "0x08010222", $hit_84
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 85, "RASM", "THREAD_LIFECYCLE", "_User_extensions_Thread_restart_visitor", "0x08010272", $hit_85
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 86, "RASM", "THREAD_LIFECYCLE", "_User_extensions_Thread_begin_visitor", "0x080102be", $hit_86
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 87, "RASM", "THREAD_LIFECYCLE", "_User_extensions_Thread_exitted_visitor", "0x0801030a", $hit_87
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 88, "RASM", "USER_EXTENSIONS", "_User_extensions_Fatal_visitor", "0x0801035c", $hit_88
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 89, "RASM", "THREAD_LIFECYCLE", "_User_extensions_Thread_terminate_visitor", "0x080103aa", $hit_89
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 90, "RASM", "USER_EXTENSIONS", "_User_extensions_Iterate", "0x0801068c", $hit_90
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 91, "EDDI", "USER_EXTENSIONS", "_User_extensions_Iterate", "0x0801068c", $hit_91
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 92, "RASM", "WATCHDOG_TIMERS", "_Watchdog_Insert", "0x080107e8", $hit_92
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 93, "RASM", "WATCHDOG_TIMERS", "_Watchdog_Remove", "0x0801088e", $hit_93
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 94, "RASM", "WATCHDOG_TIMERS", "_Watchdog_Tick", "0x08010b64", $hit_94
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
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 108, "RASM", "OBJECTS_MEMORY", "_Heap_Allocate_aligned_with_boundary", "0x080126e8", $hit_108
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 109, "RASM", "OBJECTS_MEMORY", "_Heap_Free", "0x080129b4", $hit_109
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 110, "RASM", "CORE_SYSTEM", "_ISR_Handler_initialization", "0x080129fc", $hit_110
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 111, "RASM", "CORE_SYSTEM", "_Mutex_Acquire", "0x08012a6e", $hit_111
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 112, "RASM", "CORE_SYSTEM", "_Mutex_Release", "0x08012b10", $hit_112
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 113, "RASM", "CORE_SYSTEM", "_Mutex_recursive_Acquire", "0x08012ba6", $hit_113
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 114, "RASM", "CORE_SYSTEM", "_Mutex_recursive_Release", "0x08012ca0", $hit_114
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 115, "RASM", "OBJECTS_MEMORY", "_Objects_Close", "0x08012d1a", $hit_115
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 116, "RASM", "OBJECTS_MEMORY", "_Objects_Free_nothing", "0x08012d3c", $hit_116
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 117, "RASM", "OBJECTS_MEMORY", "_Protected_heap_Free", "0x0801302a", $hit_117
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 118, "RASM", "OBJECTS_MEMORY", "_Protected_heap_Get_free_information", "0x08013064", $hit_118
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 119, "RASM", "CORE_SYSTEM", "_RBTree_Extract", "0x08013246", $hit_119
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 120, "RASM", "CORE_SYSTEM", "_RBTree_Insert_color", "0x08013a38", $hit_120
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 121, "RASM", "CORE_SYSTEM", "_RBTree_Minimum", "0x08013af0", $hit_121
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 122, "RASM", "SCHEDULER", "_Scheduler_Handler_initialization", "0x08013b38", $hit_122
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
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 137, "RASM", "USER_EXTENSIONS", "_User_extensions_Add_set", "0x08014d58", $hit_137
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 138, "RASM", "OBJECTS_MEMORY", "_Heap_Initialize", "0x08015c98", $hit_138
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 139, "RASM", "OBJECTS_MEMORY", "_Heap_Block_allocate", "0x08015e10", $hit_139
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 140, "RASM", "OBJECTS_MEMORY", "_Heap_Block_split", "0x08015f3a", $hit_140
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 141, "RASM", "OBJECTS_MEMORY", "_Heap_Get_free_information", "0x080160fc", $hit_141
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 142, "RASM", "CORE_SYSTEM", "stm32f4_gpio_set_config", "0x08016ff4", $hit_142
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 143, "RASM", "CORE_SYSTEM", "stm32f4_gpio_set_config_array", "0x08017062", $hit_143
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 144, "RASM", "USER_EXTENSIONS", "rtems_fatal_source_text", "0x08024f74", $hit_144
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 145, "RASM", "CORE_SYSTEM", "rtems_configuration_get_stack_space_size", "0x08024fd4", $hit_145
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 146, "RASM", "OBJECTS_MEMORY", "_Heap_Resize_block", "0x08025118", $hit_146
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 147, "RASM", "CLASSIC_API", "_Semaphore_Post_binary", "0x08025182", $hit_147
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 148, "RASM", "THREAD_LIFECYCLE", "_Thread_Get_name", "0x08025224", $hit_148
  printf "GUARD_%03d [%s] [%s] %s check=%s: %d hits\n", 149, "RASM", "OBJECTS_MEMORY", "_Objects_Name_to_string", "0x0802583a", $hit_149
  printf "=== END GUARD VERIFICATION ===\n"
  quit
end

continue
