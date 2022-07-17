pico-8 cartridge // http://www.pico-8.com
version 36
__lua__
#include tuto.lua
#include game.lua
#include tools.lua
#include player.lua
#include message.lua
#include tiles.lua
#include selection_menu.lua
#include events.lua
function _init()
	game.init()
end
function _update()
	game.update()
end
function _draw()
	game.draw()
end
__gfx__
00000000111111113333333333bbbb333337733322222222dddd5ddda9aaaaaa0000000000000000000000000000000000000000000000000000000000000000
00000000111111c1333333b331bb77b33337733322222222dddd5dddaaaaa3aa0000000000000000000000000000000000000000000000000000000000000000
0070070011111c1c33333bb3313bb7b33377773322222222d5d55d5daaaaa39a0000000000000000000000000000000000000000000000000000000000000000
0007700011111111bb33bb333133bbb33375573322585522d5d5d55da39aa3aa0000000000000000000000000000000000000000000000000000000000000000
0007700011c111113bb3b333311333b33555555325585552d55555dda3aaaaaa0000000000000000000000000000000000000000000000000000000000000000
007007001c1c111133b3b333331111333555555325585552ddd55ddda3aaaa9a0000000000000000000000000000000000000000000000000000000000000000
000000001111111133333333333553365555555555885555ddd55dddaa9aaaaa0000000000000000000000000000000000000000000000000000000000000000
000000001111111133333333332442335555555558855555dd5555ddaaaaaaaa0000000000000000000000000000000000000000000000000000000000000000
26688662111111115555577777511111111115777775555577777777775111111111111111111577777777770000000000000000000000000000000000000000
600000061bbbbbb158885777775111c1111115777775888577777777775111c1111111c111111577777777770000000000000000000000000000000000000000
600000061b111cbc5888555577511c1c11111577555588855555555577511c1c11111c1c11111577777777770000000000000000000000000000000000000000
800000081b1111b15888511155555111111555551115888511111111775111111111111111111577777777770000000000000000000000000000000000000000
800000081bc111b1555551115888511111c5888511c5555511c111117751111111c1111111c11577777777770000000000000000000000000000000000000000
600000061b1c11b1775c111158885555555588851c1c15771c1c1111775c1111555555551c1c1577777777770000000000000000000000000000000000000000
600000061bbbbbb17751111158885777777588851111157711111111775111117777777711111577777777770000000000000000000000000000000000000000
26688662111111117751111155555777777555551111157711111111775111117777777711111577777777770000000000000000000000000000000000000000
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa000000aa0000aaaa0000aaaa0000aaaaa00000aa000000aaccc000aaccccaaaaacccaa0000000000000000
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa00000aaa000aaaaa000aaaaa000aaaaaa0000aaa00000aaacc000aaaccaaaaaaaccaa0000000000000000
caacaaacaaaaccaaaaaaccaacaacaaacaaaaccaa00000000000000a0000000a0000000a00000000000000000aaaac000aaaacaaaaacccaaa0000000000000000
cccccaccaaacccacaaacccaccccccaccaaacccaa000000000000000000000000000000000000000000000000aaacc000aaaccccaaacccaaa0000000000000000
ccccccccaaccccccaaccccccccccccccaacccaaa000000000000000000000000000000000000000000000000aaccc000aacccaaaaaacccaa0000000000000000
00000000aaacc000aaacaacccacacaacaaacaaaa00000000000000000a0000000a000000000000000a000000aaacc000aaacccaaaaaacaaa0000000000000000
00000000aaac0000aaaaaaaaaaaacaaaaaaaaaaa0000000000000000aa000000aa000aaa00000aaaaa000000aaacc000aaaccaaaaaaaaaaa0000000000000000
00000000aacc0000aaaaaaaaaaaaaaaaaaaaaaaa0000000000000000aa000000aa0000aa000000aaaa000000aaccc000aaccccaaaaaaaaaa0000000000000000
88888888bbbbbbbb1111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88888888bbbbbbbb111111c10bbbbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88888888bbbbbbbb11111c1c0b0000b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88888888bbbbbbbb111111110b0000b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88888888bbbbbbbb11c111110b0000b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88888888bbbbbbbb1c1c11110b0000b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88888888bbbbbbbb111111110bbbbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88888888bbbbbbbb1111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a1a100000000000000000000000000000000000000000000000000000000000000
__label__
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1
11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c11111
1c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c1111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1
11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c11111
1c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c1111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1
11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c11111
1c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c1111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1
11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c11111
1c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c1111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1
11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c11111
1c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c1111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1
11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c11111
1c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c1111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1
11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c11111
1c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c1111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111c1111111c1111111c1111111c1111111c1111111c1111111c11bbbbbb1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1
11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c1b111cbc11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c
111111111111111111111111111111111111111111111111111111111b1111b11111111111111111111111111111111111111111111111111111111111111111
11c1111111c1111111c1111111c1111111c1111111c1111111c111111bc111b111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c11111
1c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111b1c11b11c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c1111
111111111111111111111111111111111111111111111111111111111bbbbbb11111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111a9aaaaaa2666666211111111111111111111111111111111111111111111111111111111
111111c1111111c1111111c1111111c1111111c1111111c11bbbbbb1aaaaa3aa6bbbbbb6111111c1111111c1111111c1111111c1111111c1111111c1111111c1
11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c1b111cbcaaaaa39a6b111cb611111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c
1111111111111111111111111111111111111111111111111b1111b1a39aa3aa6b1111b611111111111111111111111111111111111111111111111111111111
11c1111111c1111111c1111111c1111111c1111111c111111bc111b1a3aaaaaa6bc111b611c1111111c1111111c1111111c1111111c1111111c1111111c11111
1c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111b1c11b1a3aaaa9a6b1c11b61c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c1111
1111111111111111111111111111111111111111111111111bbbbbb1aa9aaaaa6bbbbbb611111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111aaaaaaaa2666666211111111111111111111111111111111111111111111111111111111
1111111111111111111111111111111111111111111111111111111133377333dddd5ddd22222222111111111111111111111111111111111111111111111111
111111c1111111c1111111c1111111c1111111c1111111c1111111c133377333dddd5ddd22222222111111c1111111c1111111c1111111c1111111c1111111c1
11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c33777733d5d55d5d2222222211111c1c11111c1c11111c1c11111c1c11111c1c11111c1c
1111111111111111111111111111111111111111111111111111111133755733d5d5d55d22585522111111111111111111111111111111111111111111111111
11c1111111c1111111c1111111c1111111c1111111c1111111c1111135555553d55555dd2558555211c1111111c1111111c1111111c1111111c1111111c11111
1c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c111135555553ddd55ddd255855521c1c11111c1c11111c1c11111c1c11111c1c11111c1c1111
1111111111111111111111111111111111111111111111111111111155555555ddd55ddd55885555111111111111111111111111111111111111111111111111
1111111111111111111111111111111111111111111111111111111155555555dd5555dd58855555111111111111111111111111111111111111111111111111
111111111111111111111111111111111111111111111111111111111111111133333333dddd5ddd111111111111111111111111111111111111111111111111
111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1333333b3dddd5ddd111111c1111111c1111111c1111111c1111111c1111111c1
11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c33333bb3d5d55d5d11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c
1111111111111111111111111111111111111111111111111111111111111111bb33bb33d5d5d55d111111111111111111111111111111111111111111111111
11c1111111c1111111c111110000000000000000000000000000011111c111113bb3b333d55555dd11c1111111c1111111c1111111c1111111c1111111c11111
1c1c11111c1c11111c1c1111011111111111111111111111111101111c1c111133b3b333ddd55ddd1c1c11111c1c11111c1c11111c1c11111c1c11111c1c1111
111111111111111111111111011111111111111111111111111101111111111133333333ddd55ddd111111111111111111111111111111111111111111111111
111111111111111111111111011777117717111777177117711101111111111133333333dd5555dd111111111111111111111111111111111111111111111111
11111111111111111111111101117117111711171717171717110111111111111111111111111111111111111111111111111111111111111111111111111111
111111c1111111c1111111c1011171177717111777171717171101c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1
11111c1c11111c1c11111c1c01117111171711171717171717110c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c
11111111111111111111111101177717711777171717171777110111111111111111111111111111111111111111111111111111111111111111111111111111
11c1111111c1111111c111110111111111111111111111111111011111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c1111111c11111
1c1c11111c1c11111c1c1111011111111111111111111111111101111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c1111
11111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000011111111111111111
11111111111111111111111105555555555555555555555555555555555555555555555555555555555555555555555555555555555555011111111111111111
11111111111111111111111105555555555555555555555555555555555555555555555555555555555555555555555555555555555555011111111111111111
111111c1111111c1111111c10557775577577757575755577757775777557757755555555557555777577755555555555555555555555501111111c1111111c1
11111c1c11111c1c11111c1c055757575757575757575557575575557557575757557555555755575757575555555555555555555555550c11111c1c11111c1c
11111111111111111111111105577757575777575757555777557555755757575755555555577757775777555555555555555555555555011111111111111111
11c1111111c1111111c11111055755575757555757575557575575557557575757557555555757575755575555555555555555555555550111c1111111c11111
1c1c11111c1c11111c1c111105575557755755557757775757557557775775575755555555577757775557555555555555555555555555011c1c11111c1c1111
11111111111111111111111105555555555555555555555555555555555555555555555555555555555555555555555555555555555555011111111111111111
11111111111111111111111105577757775577577755775777555555555775575557775557577757575777577555555555555555555555011111111111111111
11111111111111111111111105575557575755557557575757557555555575575557575575557557575757575755555555555555555555011111111111111111
111111c1111111c1111111c10557755777575555755757577555555555557557775757557555755757577557575555555555555555555501111111c1111111c1
11111c1c11111c1c11111c1c055755575757555575575757575575555555755757575755755575575757575757555555555555555555550c11111c1c11111c1c
11111111111111111111111105575557575577557557755757555555555777577757775755557555775757575755555555555555555555011111111111111111
11c1111111c1111111c11111055555555555555555555555555555555555555555555555555555555555555555555555555555555555550111c1111111c11111
1c1c11111c1c11111c1c111105577757575777577555555555575555575775577757775555555555555555555555555555555555555555011c1c11111c1c1111
11111111111111111111111105557557575757575755755555575555755575575757575555555555555555555555555555555555555555011111111111111111
11111111111111111111111105557557575775575755555555577755755575575757575555555555555555555555555555555555555555011111111111111111
11111111111111111111111105557557575757575755755555575755755575575757575555555555555555555555555555555555555555011111111111111111
111111c1111111c1111111c10555755577575757575555555557775755577757775777555555555555555555555555555555555555555501111111c1111111c1
11111c1c11111c1c11111c1c055555555555555555555555555555555555555555555555555555555555555555555555555555555555550c11111c1c11111c1c
11111111111111111111111105555555555555555555555555555555555555555555555555555555555555555555555555555555555555011111111111111111
11c1111111c1111111c11111055555555555555555555555555555555555555555555555555555555555555555555555555555555555550111c1111111c11111
1c1c11111c1c11111c1c111105555555555555555555555555555555555555555555555555555555555555555555555555555555555555011c1c11111c1c1111
11111111111111111111111105555555555555555555555555555555555555555555555555555555555555755777775555577777557555011111111111111111
11111111111111111111111105555555555555555555555555555555555555555555555555555555555557557757577555775557755755011111111111111111
11111111111111111111111105555555555555555555555555555555555555555555555555555555555575557775777555775757755575011111111111111111
111111c1111111c1111111c10555555555555555555555555555555555555555555555555555555555555755775757755577555775575501111111c1111111c1
11111c1c11111c1c11111c1c055555555555555555555555555555555555555555555555555555555555557557777755555777775575550c11111c1c11111c1c
11111111111111111111111105555555555555555555555555555555555555555555555555555555555555555555555555555555555555011111111111111111
11c1111111c1111111c11111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000111c1111111c11111
1c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c11111c1c1111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111

__gff__
0000010101010101000000000000000000048080808080808080800000000000020202020202020202020202020200000000400400000000000000000000000001000101010101010101010100000000000001010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
12161616161616161616161616161616161616161616161616161616161616151a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17010101010101010101010101010101010101010101010101010101010101191a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17010101010101010101010101010101010101010101010101010101010101191a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17010101010101010101010101010101010101010101010101010101010101191a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17010101010101010101010101010101010101010101010101010101010101191a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17010101010101010101010101010101010101010101010101010101010101191a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17010101010101010101010101010101010101010101010101010101010101191a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17010101010101010101010101010101010101010101010101010101010101191a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17010101010101010101010101010101010101010101010101010101010101191a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17010101010101010101010101010101010101010101010101010101010101191a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17010101010101010101010101010101010101010101010101010101010101191a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17010101010101010101010101010101010101010101010101010101010101191a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17010101010101010101010101010101010101010101010101010101010101191a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17010101010101010101010101010101010101010101010101010101010101191a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17010101010101010101010101010101010101010101010101010101010101191a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17010101010101010101010101010101010101010101010101010101010101191a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17010101010101010101010101010101010101010101010101010101010101191a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17010101010101010101010101010101010101010101010101010101010101191a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17010101010101010101010101010101010101010101010101010101010101191a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17010101010101010101010101010101010101010101010101010101010101191a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17010101010101010101010101010101010101010101010101010101010101191a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17010101010101010101010101010101010101010101010101010101010101191a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17010101010101010101010101010101010101010101010101010101010101191a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17010101010101010101010101010101010101010101010101010101010101191a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17010101010101010101010101010101010101010101010101010101010101191a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17010101010101010101010101010101010101010101010101010101010101191a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17010101010101010101010101010101010101010101010101010101010101191a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17010101010101010101010101010101010101010101010101010101010101191a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17010101010101010101010101010101010101010101010101010101010101191a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17010101010101010101010101010101010101010101010101010101010101191a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17010101010101010101010101010101010101010101010101010101010101191a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
13181818181818181818181818181818181818181818181818181818181818141a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
000100000d0500e0501105016050170501c0500e05000000080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000100000865010650106500a650006000565009650096500365000600006001f6000060000600006000060000600006000060000600006000060000600006000060038600006000060000600006000060000600
00040000376502b650236500a650056500065000650126000b6000260000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1402000002751077510d75112751177511b75120751237512a7512f751337513a7513f75133701337013370100701227011f7011e7011b7011f701287012b7013670129701387010070138701387013870138701
010400000b05027050270502705027050270502705027050270502e0502e0502e0502e0502e050340503405034050340503405024050240501905024050240501705024050240502405024050100501005010050
00100000125500c500125500d5500c550125500c5000f500175001d50029500215002250024500245001450014500005000550014500005001455000500145501155011550005000050000500005000050000500
d61000200500205702057120571205722057220573205732050320503205032050320503205032050320503208032090320903209032090320903209032090320903209732097220972209712097120970209702
be1000200500705717057170572705727057370573705737050370503705037050370503705737057370573709037090370903709037090370903709037090370903709737097370972709727097170971709707
d61000200062700627006270062700627006270062700627006270062700627006270062700627006270062700627006270062700627006270062700627006270062700627006270062700627006270062700627
be100020050000571005710057200572005730057300573005030050300503005030050300c7300c7300c73009030090300903009030090300903009030090300903009730097300972009720097100971009700
be100020050100501005010050100501005010050100501009010090100901009010090100901009010090100c7100c7100c7100c7100b7100b7100b7100b7100a71009710087100871008710097100971009710
__music__
01 08064344
00 08094344
00 08064944
00 08094944
00 08474344
00 084a4944
00 08494344
02 08424344

