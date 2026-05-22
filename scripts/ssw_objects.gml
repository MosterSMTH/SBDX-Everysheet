///ssw_objects(name)
//This handles sprite switching for the items that are on the master sheet

if (!inview()) exit

var frox,froy, frx,fry, fr,ffr4,fr8,fr88, xsc,ysc,w,h, plat, lx;

fr=global.frame
ffr4=global.fastframe4
fr8=global.frame8
fr88=global.frame88

frox=0 froy=0 frx=0 fry=0 w=1 h=1 xsc=1 ysc=1 plat=0
switch (argument[0]) {
    case "cork": {frx=39.5 fry=0 frox=8 froy=8 break}
    case "stone": {frx=39.5 fry=1 frox=8 froy=8 break}
    case "powblock": {lx=1360 frx=12+1*powphase fry=6 xsc=xsc+pxsc ysc=1-pxsc*0.3 frox=pxsc*4 break}
    case "delfruit": {frx=77+delfr*1.5 fry=5.5 w=1.5 h=1.5 frox=12 froy=12 break}
    case "pswitch": {lx=1360 if (hspeed>=0 && skindat("itemflip")) xsc=-1 frx=12+ifr fry=4 frox=0 froy=0 break}
    case "pswitchhit": {lx=1360 if (hspeed>=0 && skindat("itemflip")) xsc=-1 frx=16 fry=9 frox=0 froy=0 break}
    case "sonicspike": {
        if (dir=0) {frx=47 fry=17+floor(frame)}
        if (dir=1) {frx=43+floor(frame) fry=16}
        if (dir=2) {frx=42 fry=17+floor(frame)}
        if (dir=3) {frx=43+floor(frame) fry=21}
        if (dir=4) {frx=43+floor(frame) fry=16}
    break}
    case "bumper": {frx=69+3*frame fry=0 w=3 h=3 frox=24 froy=24 break}
    case "bumpersmall": {frx=68.5+1.5*frame fry=3.5 w=1.5 h=1.5 frox=12 froy=12 break}
    case "bumperball": {frx=50+(1*round(floor(frame)/2)) fry=18 froy=8 frox=8 break}
    case "conveyorbeltcenter": {frx=69+(1*frame) fry=5.5 w=1 h=1 xsc=-1*sign(beltspd) if xsc=-1 frox=16 else frox=0 break}
    case "conveyorbeltleft": {frx=69+(1*frame) fry=5.5 w=1 h=1 xsc=-1*sign(beltspd) if xsc=-1 frox=16 else frox=0 break}
    case "conveyorbeltright": {frx=69+(1*frame) fry=5.5 w=1 h=1 xsc=-1*sign(beltspd) if xsc=-1 frox=16 else frox=0 break}
    case "cardreaderup": {frx=35.5 fry=4 w=2 h=2 frox=16 froy=16 break}
    case "cardreaderdown": {frx=37.5 fry=4 w=2 h=2 frox=16 froy=16 break}
    case "tap": {frx=0+other.frame fry=16 break} //genuinely convinced this used to just be straight up copy-pasted from ssw_items -moster
    case "axe": {frx=26.5+fr fry=7 break}
    case "pollflower": {frx=0.5+frame*5 fry=30.5 w=5 h=3 froy=32 break}
    case "pollen": {frx=0.5+fr*2.5 fry=33.5 w=2.5 h=2.5 frox=17 froy=16 break}

    case "signalblock": {frx=35+(1*active)  fry=20 break}

    case "grinder": {frx=54+2*fr fry=16 w=2 h=2 froy=8 frox=8 break}
    case "dashpanel": {frx=73+(2*fr) fry=3.5 w=2 h=1.5 froy=8 break}

    case "spring": {frx=41+frame fry=0+bbb-aaa h=2-max(bbb,aaa) froy=17-16*bbb frox=0 break}
    case "sprong": {frx=41+frame fry=2+bbb-aaa h=2-max(bbb,aaa) froy=17-16*bbb frox=0 break}
    case "spreng": {frx=45 fry=0+frame w=2 frox=8 froy=1 break}
    case "sprung": {frx=47 fry=0+frame w=2 frox=8 froy=1 break}
    case "terrainspring": {
        switch (real(dir)) { //stole the math from pokerboll lol
            case (0): {frx=50.5+frame fry=0+bbb-aaa h=1.5-max(bbb,aaa) froy=8-8*bbb frox=0} break; //up
            case (1): {frx=54.5+frame fry=0+bbb-aaa h=1.5-max(bbb,aaa)                    } break; //down
            case (2): {frx=49.5 fry=1.5+frame w=1.5 frox=8                                    } break; //left
            case (3): {frx=49.5 fry=5.5+frame w=1.5                                           } break; //right
            case (4): {frx=52 fry=3+1.5*frame w=1.5 h=1.5 frox=8 froy=8                   } break; //up left
            case (5): {frx=53.5 fry=3+1.5*frame w=1.5 h=1.5 froy=8                        } break; //up right
            case (6): {frx=55 fry=3+1.5*frame w=1.5 h=1.5 frox=8                        } break; //down left
            case (7): {frx=56.5 fry=3+1.5*frame w=1.5 h=1.5                                 } break; //down right
        }
    break
    }
    case "terrainsprong": {
        switch (real(dir)) { //stole the math from pokerboll lol
            case (0): {frx=58.5+frame fry=0+bbb-aaa h=1.5-max(bbb,aaa) froy=8-8*bbb frox=0} break; //up
            case (1): {frx=62.5+frame fry=0+bbb-aaa h=1.5-max(bbb,aaa)                    } break; //down
            case (2): {frx=66 fry=1.5+frame w=1.5 frox=8                                    } break; //left
            case (3): {frx=66 fry=5.5+frame w=1.5                                           } break; //right
            case (4): {frx=58 fry=3+1.5*frame w=1.5 h=1.5 frox=8 froy=8                   } break; //up left
            case (5): {frx=59.5 fry=3+1.5*frame w=1.5 h=1.5 froy=8                        } break; //up right
            case (6): {frx=61 fry=3+1.5*frame w=1.5 h=1.5 frox=8                        } break; //down left
            case (7): {frx=62.5 fry=3+1.5*frame w=1.5 h=1.5                                 } break; //down right
        }
    break
    }

    case "beepblockon": {amion="on" frx=64+frame+(4*blue) fry=14 w=1 h=1 break}
    case "beepblockoff": {frx=66+frame+(4*blue) fry=14 w=1 h=1 break}
}


if plat=0 draw_background_part_ext(global.everysheet[biome],frx*16+8,fry*16+8,w*16,h*16,floor(x-frox*xsc)+notex,floor(y-froy*ysc)+dy+notey,xsc,ysc,$ffffff,1)
if (plat!=0) draw_background_part_ext(global.everysheet[biome],(frx+2)*16+8,fry*16+8,16,16,floor(x-frox*xsc+plat*16*xsc),floor(y-froy*ysc)+dy,xsc,ysc,$ffffff,1)
