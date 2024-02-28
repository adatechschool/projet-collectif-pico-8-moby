pico-8 cartridge // http://www.pico-8.com
version 38
__lua__
function _init()
--player
	create_player()
--bullets
	bullets={}
	
--dechets
	dechets={}
	dechets1={}
	dechets2={}
	dechets3={}
	create_dechet()
	create_dechet1()
	create_dechet2()
	create_dechet3()
--fish
 fishes={}
	create_fish()
--bubbles
	create_bubbles()	
end
function _update()
--player
	player_movement()
--fish
	renew_fish()
	fish_mouvement()
--dechets
	renew_dechet()
	update_dechets()
	update_dechets1()
	update_dechets2()
 update_dechets3()
--bullet
	update_shoot()
	update_bullets()
--bubbles
	update_bubbles()
--camera
	update_camera()
end
function _draw()
--map
	cls()
 draw_map()
--player
 draw_player()
--fish
 draw_fish()
--dechets	
	draw_dechet()
	draw_dechet1()
	draw_dechet2()
	draw_dechet3()
--bullets
	draw_bullets ()
--bubbles
	draw_bubbles()
end
-->8
--map
function draw_map()
	map(0,0,0,0,128,64)
	sprite=64
	end
--camera
function update_camera()
	camx=mid(0,p.x-6,150-15)
	camy=mid(0,p.y-6,64-15)
	camera(camx*10,camy*15)
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
		if(p.x>100) p.x=100
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
		x=newx,
		y=newy+.3,
		speed=0.5,
		flip=p.flip
	}
		if new_bullet.flip==true then
		new_bullet.x=new_bullet.x+2
 	end
	
		add(bullets,new_bullet)
		sfx(0)
end
function update_bullets()
		
	for b in all(bullets) do
		if b.flip== false then		
			b.x-=b.speed
		else
			b.x+=b.speed
	--		b.x=b.x+2 			
		end
	end
end
function update_shoot()
	if btnp(❎) then
	 shoot()
	end
end	
function draw_bullets()
		for b in all(bullets) do
		spr(16,b.x*10,b.y*15)
 	end
end
-->8
-- bubbles
function create_bubbles()
	bubbles={}
	for i=1,20 do
	new_bubbles={
		x=rnd(1016),
		y=rnd(128),
			col=5,
			speed=0.3+rnd(0.3)
			}
			add(bubbles,new_bubbles)
	end
	for i=1,40 do
	new_bubbles={
		x=rnd(1016),
		y=rnd(128),
		col=rnd({7,12,6}),
		speed=0.5+rnd(0.4)
		}
		add(bubbles,new_bubbles)
	end
end
function update_bubbles()
	for b in all (bubbles) do
		b.y-=b.speed
		if b.y < 0 then
			b.y=rnd(128,0)
			b.x=rnd(1016)
		end
	end
end
function draw_bubbles()
	for b in all(bubbles) do
		pset(b.x,b.y,b.col)
	end
end
-->8
--fish
function create_fish()
	new_fish={
			x=128,
			y=60,
			sprite=32,
			speed=1
			}
			add(fishes,new_fish)
end
function fish_mouvement()
	for e in all(fishes) do	
   e.x-=e.speed
   e.y+=e.speed-1.2
			if e.x < 0 then
				del(fishes,e)
			end	
	end
end	
function renew_fish()
	if #fishes== 0 then
			create_fish()
	end
end
function draw_fish()
	for f in all(fishes) do
			spr(
			f.sprite,
			f.x,
			f.y+10
			)
			spr(
			f.sprite,
			f.x+200,
			f.y+32
			)
			spr(
			f.sprite,
			f.x+400,
			f.y+15
			)
			spr(
			f.sprite,
			f.x+700,
			f.y+40
			)
			spr(
			f.sprite,
			f.x+850,
			f.y
			)
			spr(
			f.sprite,
			f.x+350,
			f.y+5
			)
	end		
end
-->8
--dechet
function create_dechet()
	new_dechet={
			x=8,
			y=-2,
			sprite=36,
			speed=0.01
				--	life=3
			}
			add(dechets,new_dechet)
end
function update_dechets()
	for e in all(dechets) do	
  -- e.x-=e.speed
  if e.y<7 then
   e.y+=e.speed
  end
	end
end	
function renew_dechet()
	if #dechets== 0 then
			create_dechet()
	end
end
function draw_dechet()
 print(new_dechet.x)
	print(new_dechet.y)
	for f in all(dechets) do
				spr(
				f.sprite,
				f.x*10,
				f.y*15,
				1,
				2
			 )
	end		
end
-->8
--dechet
function create_dechet1()
	new_dechet1={
			x=30,
			y=-4,
			sprite=36,
			speed=0.01
				--	life=3
			}
			add(dechets1,new_dechet1)
end
function update_dechets1()
	for e in all(dechets1) do	
  -- e.x-=e.speed
  if e.y<7 then
   e.y+=e.speed
  end
	end
end	
function renew_dechet1()
	if #dechets1== 0 then
			create_dechet1()
	end
end
function draw_dechet1()
 print(new_dechet1.x)
	print(new_dechet1.y)
	for f in all(dechets1) do
				spr(
				f.sprite,
				f.x*10,
				f.y*15,
				1,
				2
				)
	end		
end
-->8
--dechet
function create_dechet2()
	new_dechet2={
			x=60,
			y=-8,
			sprite=36,
			speed=0.01
				--	life=3
			}
			add(dechets2,new_dechet2)
end
function update_dechets2()
	for e in all(dechets2) do	
  -- e.x-=e.speed
  if e.y<7 then
   e.y+=e.speed
  end
	end
end	
function renew_dechet()
	if #dechets== 0 then
			create_dechet2()
	end
end
function draw_dechet2()
 print(new_dechet2.x)
	print(new_dechet2.y)
	for f in all(dechets2) do
				spr(
				f.sprite,
				f.x*10,
				f.y*15,
				1,
				2
				)
	end		
end
-->8
--dechet
function create_dechet3()
	new_dechet3={
			x=90,
			y=-12,
			sprite=36,
			speed=0.02
				--	life=3
			}
			add(dechets3,new_dechet3)
end
function update_dechets3()
	for e in all(dechets3) do	
  -- e.x-=e.speed
  if e.y<7 then
   e.y+=e.speed
  end
	end
end	
function renew_dechet3()
	if #dechets3== 0 then
			create_dechet3()
	end
end
function draw_dechet3()
 print(new_dechet3.x)
	print(new_dechet3.y)
	for f in all(dechets3) do
				spr(
				f.sprite,
				f.x*10,
				f.y*15,
				1,
				2
				)
	end		
end
-->8
--collision
--function collision(a,b)
--		if a.x>b.y
--		or a.y>b.y+8
--		or a.x+8<b.x
--		or a.y+8<b.y then
--			return false
--		else
--			return true	
--		end
--end
function collision(a,b)
	return not (
													a.x>b.y
										or a.y>b.y+8
										or a.x+8<b.x
										or a.y+8<b.y
										)
end
__gfx__
0000000000555555500000000000000081111e882d1112d100000000111111110000000000000000000000004411124161611111111111188887111111111111
000000000566666665500000000000008111e81111d2112d00000000311111110000000000000000000000001221121116111111111111881188711111111111
007007005666666666650000000000001e1e81e1111d2112000000003113111b0000000000000000000000001121124161611111111118811118871111111111
000770005666666666665000505000001e1e11e111d2112d000000003b13b1330000000000000000000000001421241116111111111188711111871111111111
0007700056666666666650056565000018eeee812d2112d1000000003b13b1310000000000000000000000001112111161611111111188711111871111111111
00700700566776666666500566650000118e8111d1112d110000000013b333310000000000000000000000001112111116111111111188711111871111111111
00000000566756666666500566650000111e11111d2111d200000000113331110000000000000000000000001122211161611111111118871188811111111111
000000005666666666666500565000009aaeaaa9aad2ad2a000000009aa3aaa90000000000000000000000009222224916111111111111188888111111111111
00000000577777666666665566500000000000000000000000000000000000001111111111111111111113333333611161611111111111118871111100000000
00000000057777566776666665000000000000000000000000000000000000001111111111111111113333555555661116111111111111118871111100000000
0009a000005555556555555550000000000000000000000000000000000000001111111111111111135535555555556161611111111111118871117700000000
00799700000055005500000000000000000000000000000000000000000000001111111111111111355535555555556116111111118871118871118700000000
000a9000000000000000000000000000000000000000000000000000000000001111111111aaaa11355355555555555661611111118881118871188800000000
000000000000000000000000000000000000000000000000000000000000000011111111aaa99aaa353555555555555616111111111887118871888100000000
0000000000000000000000000000000000000000000000000000000000000000aaa999aaa999999a335555555555555661611111111188718878881100000000
00000000000000000000000000000000000000000000000000000000000000009a99a99999aaaa99355555555555555616111111111118888888811100000000
0009900005777770057777701111111100444400000000000000000000000000aaaaaaaa00000000555555555555555600000000000000000000000000000000
0099990956777777567777771111111100744700000000000000000000000000aaaaaaaa00000000555555555555555600000000000000000000000000000000
0909999057bb7bb7579979971111111100744700000000000000000000000000aaa999aa00000000555555555555555600000000000000000000000000000000
9999990967b777b7679777971111111107000070000000000000000000000000a999999a00000000555553333333555500000000000000000000000000000000
00990000677707776777077711111111700000070000000000000000000000009999999900000000555535555553355500000000000000000000000000000000
0000000006777777067777771111111170000007000000000000000000000000999aaa9900000000555355555555535500000000000000000000000000000000
0000000006777777067777771111111170577707000000000000000000000000aaaaaaaa00000000555355555555535500000000000000000000000000000000
0000000006070707060707071111111155777777000000000000000000000000aaaaaaaa00000000555355555555535500000000000000000000000000000000
00000000000000000000000000000000567777700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000067bb7bb70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000067b777b70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000677707770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000677777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000760707070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000700000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000777777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__gff__
0000000000000000000100000101010000000000000000000000010101010100000000000000000000000101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0f0f0f0c0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0c0f0f0f0f0c230f0f0f0f0f0f0c0f0f0f0f0f0f0f0f0f0f0f0f0f0c0f0f0f0f0f0f0f0f0f0f0f0f1c0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0c0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0c0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0c0f0f0f0f0f0f0f
0f0f0f1c0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f1c0f0f0f0d0e0f0f0f0f0f0f0f1c0f0f0f0f0f0f0f0f0f0f0f0f0f1c0f0f0f0f0f0f0f0f0f0f0f0d0e0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f1c0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f1c0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f1c0f0f0f0f0f0f0f
0f0f0d0e0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0c0f0f0f1d1e0f0f0f0f0f0f0f0c0f0f0f0f0f0f0f0f0f0f0f0f0f0c0f0f0f0f0f0f0f0f0f0f0f1d1e0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0c0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0c0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0c0f0f0f0f0f0f0f
0f0f1d1e0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f1c0f0f0f0f0f0f0f0f0f0f0f0d0e0f0f0f0f0f0f0f0f0f0f0f0f0f1c0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f1c0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0d0e0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f1c0f0f0f0f0f0f0f
0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0c0f0f0f0f0f0f0f0f0f0f0f1d1e0f0f0f0f0f0f0f0f0f0f0f0f0f0c0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0c0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f1d1e0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0c0f0f0f0f0f0f0f
0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0d0e0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0d0e0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f1c0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f1c0f0f0f0f0f0f0f
0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f1d1e0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f1d1e0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0c0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0c0f0f0f0f0f0f0f
0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f1c0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0d0e0f0f0f0f0f0f0f
0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0d0e0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f1d1e0f0f0f0f0f0f0f
0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f1d1e0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f
0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f
0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f
0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f
1b0f0f0f0f0f0f0f0f0f0f0f0d0e0f0f0f0f0f1a1b0f0f0f0f0f1a1b0f0f0f1a1b0f0f0f0f0f0d0e0f0f0f0f0f0f1a1b0f0f0f0f0f0f0f0f0f0d0e0f0f0f0f0f0f0f1a1b0f0f0f0f0f0f0f0f0f0f0f0d0e0f0f0f0f0f0f1a1b0f0f0f0f0f0f0f1a1b0f0f0f0d0e0f0f0f0f0f0f0f0f0f1a1b0f0f0f0f0f0d0e0f0f0f0f0f0f1a
2b0f0719180b180719040f0f1d1e0f050b0f0f2a2b0f0f0f070b2a2b0f0f042a2b0f0f07050b1d1e0f0f0419180b2a2b0f0f0f05050f040f071d1e0f0f0b181918072a2b040f0f0f0f0b05181918071d1e0f0b181918042a2b0f0f05181918072a2b0f0f0f1d1e05050f07181918040f2a2b1819180b071d1e0518191804052a
2828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828
2828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828
2828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828
2828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828
2828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828
2828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828282828280000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
00030000207602176023760287501e750197400d74009730057300272000700007000070000700007000070000700140000070000700007000070000700007000070000700007000070000700007000070000700
