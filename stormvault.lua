

sBotName = frmHub:GetHubBotName()
attackmsgs={}
attackmsgs[1]="(Att) shot (Vict) with a Pistol!"
attackmsgs[2]="(Att) shot (Vict) with a Shotgun!"
attackmsgs[3]="(Att) hit (Vict) with a hammer!"
attackmsgs[4]="(Att) punched (Vict) in the balls!"
attackmsgs[5]="(Att) whacked (Vict) with a bat!"
attackmsgs[6]="(Att) rammed (Vict) with a (vehi)!"

vehi={}
vehi[1]="Hayabuza"
vehi[2]="Bullet"
vehi[3]="Pulsar 220"
vehi[4]="Splendor Plus"
vehi[5]="Kinetic Honda"
vehi[6]="Hero Honda-Desh Ki Dhadkan"
vehi[7]="R-15"
vehi[8]="CBR250R"
vehi[9]="broken Maruti 800"
vehi[10]="Bolero"
vehi[11]="Scorpio"
vehi[12]="BMW"
vehi[13]="Audi"
vehi[14]="limousine"
vehi[15]="truck"
vehi[16]="tractor"
vehi[17]="Porsche 911"
vehi[18]="cycle"
vehi[19]="monster truck"
vehi[20]="Ford Mustang"
vehi[21]="helicopter"
vehi[22]="jet plane"
vehi[23]="Kingfisher jet"
vehi[24]="Lamborghini"
vehi[25]="Ferrari"

throwing={}
throwing[1]="a baseball"
throwing[2]="a cricket ball"
throwing[3]="a cricket bat"
throwing[4]="a grenade"
throwing[5]="a bomb"
throwing[6]="a chainsaw"
throwing[7]="a condom"
throwing[8]="a used condom"
throwing[9]="a mobile phone"
throwing[10]="a Nokia N8"
throwing[11]="a Samsung S3"
throwing[12]="an iPhone"
throwing[13]="a Samsung Galaxy Y"
throwing[14]="a Nokia 1100"
throwing[15]="a Micromax phone"
throwing[16]="an unidentified projectile"
throwing[17]="a planet"
throwing[18]="a stone"
throwing[19]="a rock band"
throwing[20]="a dildo"
throwing[21]="Sunny Leone"
throwing[22]="a used underwear"
throwing[23]="a lightbulb"
throwing[24]="a bike"
throwing[25]="a Hostel-8 prefect"
throwing[26]="a laptop"
throwing[27]="a calculator"
throwing[28]="a water bottle"
throwing[29]="a snake"
throwing[30]="a drafter"
throwing[31]="a Chemistry Lab apparatus"
throwing[32]="a Dean S/W"
throwing[33]="a JEE question paper"
throwing[34]="an end sem question paper"
throwing[35]="a rotten apple"
throwing[36]="a DSLR camera"
throwing[37]="a defective projector"
throwing[38]="an ED chart"
throwing[39]="a notebook"
throwing[40]="a bundle of xerox notes"
throwing[41]="an Oxford dictionary"
throwing[42]="an angry minister"
throwing[43]="a porn CD"
throwing[44]="a shoe"
throwing[45]="a 3G dongle"
throwing[46]="a rat"
throwing[47]="a box full of mice"
throwing[48]="a water balloon"
throwing[49]="a hammer"

function commnds(usr)
	SendToNick(usr," ")
	SendToNick(usr,"**COMMANDS**")
	SendToNick(usr," ")
	SendToNick(usr,"\a\t!commands -> Display this list of commands")
	SendToNick(usr,"\a\t!attack <target> -> Launch a random attack at a target")
	SendToNick(usr,"\t\tExample: !attack Dean S/W -> "..usr.." hit Dean S/W with a cricket bat")

SendToNick(usr,"\a\t!throw <target> -> Throw a random object at a target (Place target within quotes for multiple words)")
SendToNick(usr,"\a\t!throw <target> <object> -> Throw a specified object at a target")
SendToNick(usr,"\t\tExample: !throw Admin -> "..usr.." threw a calculator at Admin")
SendToNick(usr,"\t\t              !throw \"the Admin\" -> "..usr.." threw a calculator at the Admin")
SendToNick(usr,"\t\t              !throw \"the Admin\" a leaking pen -> "..usr.." threw a leaking pen at the Admin")
	SendToNick(usr,"\a\t!toss -> Toss a coin, return heads or tails")
	SendToNick(usr,"\a\t!dice -> Roll a dice, return 1 to 6")
	SendToNick(usr,"\a\t!rng <lower limit> <upper limit> -> Random Number Generator: Generate a random number between upperlimit and lowerlimit")
	SendToNick(usr,"\t\tExample: !rng 10 20 -> Random Number Generator returned: "..math.random(10,20))
	SendToNick(usr,"\n")

end
	

function ChatArrival(curUser, data)
	local data = string.sub(data,1, -2)
	local s,e,cmd = string.find(data, "%b<>%s[%!%+%?%#%+](%S+)")
	if cmd == "commands" then
	usr=curUser.sName

		commnds(usr)

		return 1

	elseif cmd=="credits" then

		SendToNick(curUser.sName,"This script was created in Lua entirely from scratch by SuperSonic_ht (Sumit Dt)")
		return 1

	elseif cmd=="shoot" then
		n=math.random(10,15)
		SendToAll(data)
		SendToAll(curUser.sName.." did "..n.." points of damage")
		return 1

	elseif cmd=="attack" then

	
		attackid=math.random(1,20)
		if attackid>6 then attackid=6 end
		attackact=string.gsub(attackmsgs[attackid],"%(Att%)",curUser.sName)
		local s,e,attacktarg=string.find(data,"%b<>%s[%!%+%?%#%+]%S+%s(.*)")
		if(attackid==6) then
			vehiid=math.random(1,25)
			attackact=string.gsub(attackact,"%(vehi%)",vehi[vehiid])
		end
		if(attacktarg~=nil) then
			SendToAll(data)
			attackact=string.gsub(attackact,"%(Vict%)",attacktarg)
			SendToAll(attackact)
		else
			SendToNick(curUser.sName,"Please specify a target to attack")
		end
		return 1

elseif cmd=="toss" then
	n=math.random(0,1)
	SendToAll(data)
	SendToAll("Coin tossed!")
	SendToAll(" ")
	
	if(n==1) then
		SendToAll("Heads!")
	else
		SendToAll("Tails!")		
	end
	return 1

elseif cmd=="dice" then
	n=math.random(1,6)
	SendToAll(data)
	SendToAll("Dice rolled!")
	SendToAll(" ")
	SendToAll("Dice shows: "..n)
	return 1

elseif cmd=="rng" then
	local s,e,lowerlim=string.find(data,"%b<>%s[%!%+%?%#%+]%S+%s(%d+)")
	local s,e,upperlim=string.find(data,"%b<>%s[%!%+%?%#%+]%S+%s%d+%s(%d+)")
	SendToAll(data)


if lowerlim==nil or upperlim==nil then
	SendToAll("Either the lower limit or the upper limit or both are blank.")

elseif lowerlim>upperlim then
SendToNick(curUser.sName,"Upper limit cannot be lower than lower limit")
else

	SendToAll("Lower limit: "..lowerlim.." Upper limit: "..upperlim)
	n=math.random(lowerlim,upperlim)
	SendToAll(" ")
	SendToAll("Random Number Generator returned: "..n)
end
	return 1

	elseif cmd=="throw" then
		throwid=math.random(1,49)

		local s,e,throwtarg=string.find(data,"%b<>%s[%!%+%?%#%+]%S+%s\"(.-)\"")
local s,e,throwitem
if(throwtarg==nil) then
		s,e,throwtarg=string.find(data,"%b<>%s[%!%+%?%#%+]%S+%s(%S+)")
s,e,throwitem=string.find(data,"%b<>%s[%!%+%?%#%+]%S+%s%S+%s(.*)")

else
		s,e,throwitem=string.find(data,"%b<>%s[%!%+%?%#%+]%S+%s%b\"\"%s(.*)")	
end	
		if(throwtarg~=nil) then
		SendToAll(data)
			if(throwitem==nil) then		
				SendToAll(curUser.sName.." threw "..throwing[throwid].." at "..throwtarg)
			else
				SendToAll(curUser.sName.." threw "..throwitem.." at "..throwtarg)
			end
		else
		SendToNick(curUser.sName,"Please specify a target to throw something at")
		end

		return 1
	end
end

function NewUserConnected(User)
SendToAll(User.sName.." has joined the room")
usr=User.sName
SetTimer(2000)
StartTimer()
     SendToNick(User.sName, "Scripts are active!")
	return 1
end


function UserDisconnected(tUser)
	SendToAll(tUser.sName.." has left the building.")
	return 1
end



function OnTimer()
	commnds(usr)
StopTimer()
end