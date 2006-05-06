-- Doors and Triggers, a tutorial-level for Enigma
-- Copyright (C) 2006 Andreas Lochmann
-- Licensed under GPL v2.0 or above 
-- Created with the help of BBE 1.05

Require("levels/lib/ant.lua")
function file_oxyd(x,y,f)
    oxyd_default_flavor=f
    oxyd(x,y)
end
levelh=13
levelw=20
enigma.FlatForce=30
enigma.SlopeForce=30
enigma.ElectricForce=30
cells={}
items={}
actors={}
stones={}
actors[" "]=cell{}
stones[" "]=cell{}
cells[" "]=cell{}
items[" "]=cell{}
cells["!"]=cell{floor="fl-leaves"}
stones["!"]=cell{stone="st-likeoxyda"}
cells["#"]=cell{floor="fl-leavesb"}
cells["$"]=cell{floor="fl-leavesc1"}
cells["%"]=cell{floor="fl-leavesc2"}
items["!"]=cell{item="it-trigger"}
cells["&"]=cell{floor="fl-leavesc3"}
cells["'"]=cell{floor="fl-leavesc4"}
items["#"]=cell{item="it-document"}
function ac_blackball(x,y)
n=""
p=0
f=0
 if (x==10) and (y==6) then
  n="ac10x6"
  p=0
  mf=1,66666666666667
 end
set_actor("ac-blackball",x+0.5,y+0.5,{player=p,name=n,mouseforce=mf})
end
function par_trigger(x,y,mytarget)
  set_item("it-trigger",x,y,{action="callback", target=mytarget})
end
function par_door(x,y,myname)
  set_stone("st-door-v",x,y,{name=myname})
end
actors["!"]=cell{parent={{ac_blackball}}}
cells["("]=cell{floor="fl-leavese2"}
cells[")"]=cell{floor="fl-leavese1"}
stones["#"]=cell{stone="st-door-v-open"}
stones["$"]=cell{parent={{file_oxyd,"d"}}}

stones["A"]=cell{parent={{par_door, "door_a"}}}
stones["B"]=cell{parent={{par_door, "door_b"}}}
stones["C"]=cell{parent={{par_door, "door_c"}}}
stones["D"]=cell{parent={{par_door, "door_d"}}}
stones["E"]=cell{parent={{par_door, "door_e"}}}
stones["F"]=cell{parent={{par_door, "door_f"}}}

items["a"]=cell{parent={{par_trigger, "trig_e"}}}
items["b"]=cell{parent={{par_trigger, "trig_b"}}}
items["c"]=cell{parent={{par_trigger, "trig_d"}}}
items["d"]=cell{parent={{par_trigger, "trig_f"}}}
items["e"]=cell{parent={{par_trigger, "trig_c"}}}
items["f"]=cell{parent={{par_trigger, "trig_a"}}}

level={"!!!!!!!!!!!!!!!!!!!!",
       "!#####$!&###(!!!!!!!",
       "!##$!&!!!####!!!!!!!",
       "!##!!!%!'#####(!!!!!",
       "!#$!!'#########!!!!!",
       "!#!!!##########(!!!!",
       "!#!!!###########!!!!",
       "!#!!!##########)!!!!",
       "!#%!!&#########!!!!!",
       "!##!!!$!&#####)!!!!!",
       "!##%!'!!!####!!!!!!!",
       "!#####%!'###)!!!!!!!",
       "!!!!!!!!!!!!!!!!!!!!"}
   acmap={"                    ",
          "                    ",
          "                    ",
          "                    ",
          "                    ",
          "                    ",
          "          !         ",
          "                    ",
          "                    ",
          "                    ",
          "                    ",
          "                    ",
          "                    "}
  itmap={"                    ",
         "                    ",
         "       a            ",
         "    b               ",
         "                    ",
         "   c                ",
         "        #           ",
         "   d                ",
         "                    ",
         "    e               ",
         "       f            ",
         "                    ",
         "                    "}
 stmap={"!!!!!!!!!!!!!!!!!!!!",
        "!            A     $",
        "!            !!!!!!!",
        "!              B   $",
        "!              !!!!!",
        "!               C  $",
        "!               !!!!",
        "!               D  $",
        "!              !!!!!",
        "!              E   $",
        "!            !!!!!!!",
        "!            F     $",
        "!!!!!!!!!!!!!!!!!!!!"}
create_world_by_map(level)
draw_map(0,0,stmap,stones)
draw_map(0,0,itmap,items)
draw_map(0,0,acmap,actors)
SetAttrib(enigma.GetItem(3,5),"invisible",FALSE)
SetAttrib(enigma.GetItem(3,7),"invisible",FALSE)
SetAttrib(enigma.GetItem(4,3),"invisible",FALSE)
SetAttrib(enigma.GetItem(4,9),"invisible",FALSE)
SetAttrib(enigma.GetItem(7,2),"invisible",FALSE)
SetAttrib(enigma.GetItem(7,10),"invisible",FALSE)
SetAttrib(enigma.GetItem(8,6),"text","Those doors on the right block your way to the oxyds... on the left you see some triggers. Maybe they are somehow connected...?")

function closealldoors()
  SendMessage("door_a", "close")
  SendMessage("door_b", "close")
  SendMessage("door_c", "close")
  SendMessage("door_d", "close")
  SendMessage("door_e", "close")
  SendMessage("door_f", "close")
end

function openmydoor(s)
  SendMessage("door_"..s, "open")
end

function trig_a()  closealldoors()  openmydoor("a")  end
function trig_b()  closealldoors()  openmydoor("b")  end
function trig_c()  closealldoors()  openmydoor("c")  end
function trig_d()  closealldoors()  openmydoor("d")  end
function trig_e()  closealldoors()  openmydoor("e")  end
function trig_f()  closealldoors()  openmydoor("f")  end


oxyd_shuffle()




