pico-8 cartridge // http://www.pico-8.com
version 38
__lua__
function _init()
	create_player()
	bullets={}
	create_bulles()
end

function _update()
	player_movement()
	update_shoot()
	update_bullets()
	update_bulles()
--	update_camera()
end

function _draw()
cls()
draw_map()
draw_player()

--bullets
	darw_bullets ()

--bulles
	draw_bulles()
	end

-->8
--map
function draw_map()
	map(0,0,0,0,128,64)
	sprite=64
	end

--function check_flag(flag,x,y)
--	local sprite=mget(x,y)
--	return fget(sprite,flag)
--end

--function update_camera()
--camera(x,y)
--end
 
--function next_tile()
--	sprite=mget(x,y)
--	mset(x,y,sprite+1)
--end	

	
-->8
--player

function create_player()
	p={x=6,
			y=4,
			sprite=1,
	 	flip=false
	 }
end

function player_movement()
newx=p.x
newy=p.y
		if btnp(➡️) then 
		 newx+=1
			p.flip=true
		end
		if btnp(⬅️) then
		 newx-=1
			p.flip=false
		end
		if (btnp(⬆️)) newy-=1
		if (btnp(⬇️)) newy+=1
	
--if not check_flag(0,newx,newy) then
		p.x=newx --p.x= mid(0,newx,127)
		p.y=newy	 --p.y= mid(0,newy,63)
		       
		if(p.x<0) p.x=0
		if(p.y<0) p.y=0
		if(p.x>127) p.x=127
		if(p.y>7) p.y=7
	--end
end

function draw_player()
	spr(p.sprite,p.x*10,p.y*15,3,2,p.flip)
end
-->8
--bullets

function shoot ()
	new_bullet= {
		x=p.x,
		y=p.y+.3,
		speed=1
	}
		add(bullets,new_bullet)
		sfx(0)
end

function update_bullets()
	for b in all(bullets) do
		b.x-=b.speed
	end
end

function update_shoot()
	if btnp(❎) then
	 shoot()
	end
end	

function darw_bullets()
		for b in all(bullets) do
		spr(16,b.x*10,b.y*15)
 	end
end
-->8
-- bulles

function create_bulles()
	bulles={}
	for i=1,13 do
	new_bulles={
		x=rnd(70),
		y=rnd(128),
			col=1,
			speed=1+rnd(1)
			}
			add(bulles,new_bulles)
	end
	for i=1,18 do
	new_bulles={
		x=rnd(128),
		y=rnd(128),
		col=rnd({7,12,6}),
		speed=1+rnd(1)
		}
		add(bulles,new_bulles)
	end
end

function update_bulles()
	for b in all (bulles) do
		b.y-=b.speed
		if b.y < 0 then
			b.y=rnd(128,0)
			b.x=rnd(120)
		end
	end
end


function draw_bulles()
	for b in all(bulles) do
		pset(b.x,b.y,b.col)
	end
end
__gfx__
0000000000555555500000000000000081111e882d11111100000000111111110000000000000000000000004411124161611111111111188887111111111111
000000000566666665500000000000008111e81111d2111100000000311111110000000000000000000000001221121116111111111111881188711111111111
007007005666666666650000000000001e1e81e1111d2111000000003113111b0000000000000000000000001121124161611111111118811118871111111111
000770005666666666665000505000001e1e11e111d21111000000003b13b1330000000000000000000000001421241116111111111188711111871111111111
0007700056666666666650056565000018eeee812d211111000000003b13b1310000000000000000000000001112111161611111111188711111871111111111
00700700566776666666500566650000118e8111d11111110000000013b333310000000000000000000000001112111116111111111188711111871111111111
00000000566756666666500566650000111e11111d21111100000000113331110000000000000000000000001122211161611111111118871188811111111111
000000005666666666666500565000009aaeaaa911d22111000000009aa3aaa90000000000000000000000009222224916111111111111188888111111111111
0000000057777766666666556650000000000000ccccccccc1c1cc1c000000001111111111111111111113333333611161611111111111118871111100000000
0000000005777756677666666500000000000000cccccccc1c1111c1000000001111111111111111111133555555661116111111111111118871111100000000
0009a00000555555655555555000000000000000c1c1ccccc1cc1c1c000000001111111111111111111135555555556161611111111111118871117700000000
0079970000005500550000000000000000000000cccccccccc11c11c000000001111111111111111111135555555556116111111118871118871118700000000
000a900000000000000000000000000000000000cccc1cc111111111000000001111111111aaaa11111355555555555661611111118881118871188800000000
00000000000000000000000000000000000000001c1c11cccc111ccc0000000011111111aaa99aaa113555555555555616111111111887118871888100000000
0000000000000000000000000000000000000000c1c1cc1c1111111100000000aaa999aaa999999a135555555555555661611111111188718878881100000000
0000000000000000000000000000000000000000c11cc1cc11111111000000009a99a99999aaaa99135555555555555616111111111118888888811100000000
000990000000000000000000000000000000000000000000cccccccc00000000aaaaaaaa00000000135555555555555600000000000000000000000000000000
009999090000000000000000000000000000000000000000cccccccc00000000aaaaaaaa00000000135555555555555600000000000000000000000000000000
090999900000000000000000000000000000000000000000cccccccc00000000aaa999aa00000000135555555555555600000000000000000000000000000000
999999090000000000000000000000000000000000000000cccccccc00000000a999999a00000000335553333333555500000000000000000000000000000000
009900000000000000000000000000000000000000000000cccccccc000000009999999900000000555535555553355500000000000000000000000000000000
000000000000000000000000000000000000000000000000cccccccc00000000999aaa9900000000555355555555535500000000000000000000000000000000
000000000000000000000000000000000000000000000000cccccccc00000000aaaaaaaa00000000555555555555555500000000000000000000000000000000
000000000000000000000000000000000000000000000000cccccccc00000000aaaaaaaa00000000555555555555555500000000000000000000000000000000
__gff__
0000000000000000000101000101010000000000000000000001010101010100000000000000000000000101010000000000000000000000000000010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0f0f0f0c0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0c0f0f0f0f0f230f0f0f0f0f0f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f0f0f1c0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f1c0f0f0f0f0f0f0f0f0f0f0f0f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f0f0d0e0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0c0f0f0f0f0f0f0f0f0f0f0f0f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f0f1d1e0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f1c0f0f0f0f0f0f0f0f0f0f0f0f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0c0f0f0f0f0f0f0f0f0f0f0f13000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0d0e0f0f0f0f0f0f0f0f0f0f0f13000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f1d1e0f0f0f0f0f0f0f0f0f0f0f23000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1b0f0f0f0f0f0f0f0f0f0f0f0d0e0f0f0f0f0f1a1b0f0f0f0f0f1a1b0f0f0f1a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2b0f0719180b1807190f0f0f1d1e0f050b0f0f2a2b0f0f0f070b2a2b0f0f042a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2828282828282828282828282828282828282828282828282828282828282828000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
00030000207602176023760287501e750197400d74009730057300272000700007000070000700007000070000700140000070000700007000070000700007000070000700007000070000700007000070000700
