///ssw_tile(name)
//This handles sprite switching for the items that are on the master sheet

if (!inview()) exit

var frox,froy, frx,fry, fr,ffr4,fr8,fr88, xsc,ysc,w,h, plat;

fr=global.frame
ffr4=global.fastframe4
fr8=global.frame8
fr88=global.frame88

frox=0 froy=0 frx=0 fry=0 w=1 h=1 xsc=1 ysc=1 plat=0 alpha=1
switch (argument[0]) {
    case "brick": {if (anim) frx=8+fr else frx=8+frame fry=17  if (hit) {frx=9-goinup fry=21} break}
    case "bricd": {frx=8+frame fry=17 if biggie {frx=26+(frame*2) fry=16} break}
    case "box": {
        if (content="bros") {frx=2 fry=23 break}
        if (hit) {frx=9-goinup fry=21}
        else frx=8+fr
        fry=16
        if !hit {
            if on_block {frx=17 fry=17}
            else if off_block {frx=17 fry=18}
            else if kblock {frx=17 fry=19}
        }
    break}
    case "bigbox": {
        w=3 frx=5
        if (hit) {fry=21-goinup}
        else {fry=16+fr}
        //fry=15
    break}

    case "cracked": if !biggie {frx=12 fry=17 break} else {frx=30 fry=18 w=2 h=2 break}
    ///////////////////MOVE TO OBJECTS.PNG
    /*case "sonicspike": {
        if (dir=0) {frx=15 fry=1+floor(frame)}
        if (dir=1) {frx=12+floor(frame) fry=0}
        if (dir=2) {frx=11 fry=1+floor(frame)}
        if (dir=3) {frx=12+floor(frame) fry=4}
        if (dir=4) {frx=12+floor(frame) fry=1}
    break}*/

    //case "cork": {frx=17 fry=20 frox=8 froy=8 break}
    //case "stone": {frx=17 fry=19 frox=8 froy=8 break}
    case "onblock": {frx=15 fry=17+blue break}
    case "offblock": {
        frx=16 fry=17+blue
        if string(content)!="" && string(content)!="0" {frx=18+hit}
    break}

    case "konblock": {frx=15 fry=19 break}
    case "koffblock": {
        frx=16 fry=19
        if string(content)!="" && string(content)!="0" {frx=18+hit}
    break}

    case "onspike": {frx=14+fr+(blue*4) fry=16 break}
    case "offspike": {frx=20 fry=17+blue break}
    case "onswitch": {frx=14 fry=17-gamemanager.onblockstate break}

    case "pblock": {frx=23 fry=18 frox=8 froy=8 break}
    case "pblockoff": {frx=24 fry=18 frox=8 froy=8 break}

    case "platform": {frx=18.5 fry=8 w=3 frox=24 break}
    case "shortplat": {frx=19 fry=20 w=2 frox=24 break}

    case "donut": {frx=23+frame fry=19 break}
    case "donutlong": {frx=23 fry=20+frame w=2 break}

    case "bridge": {frx=31.5 fry=6 break}
    case "bridgeparticle": {frx=30.5+xpart fry=7 w=0.25 frox=0 froy=0 break}
    case "chain": {frx=30.5 fry=6 h=2 froy=16 break}
    case "chainleft": {frx=32.5 fry=6 h=2 froy=16 break}
    case "axewall": {frx=31.5 fry=4 break}

    case "flag": {frx=27+fr*2 fry=14 w=2 h=1.5 break}
    case "door": {
        w=2
        h=2
        frox=8
        froy=16
        if funnytruefalse(is_pdoor) || is_frogdoor {
            if (is_frogdoor) {
                fry=4
                if !frogged && !frame {frx=18.5}
                else frx=20.5+floor(frame)*2
            }
            else {
                if !switched && !frame frx=18.5
                else frx=20.5+floor(frame)*2
                fry=2
            }
        } else if !(oneway || (target="" && nextlevel="")) {
            frx=20.5+floor(frame)*2
            if (key && frame=0)
            frx=18.5
            fry=0
        } else {
            frx=26.5+floor(frame)*2
            fry=2
        }
    break}
    case "chardoor": {
        frx=26.5+floor(frame)*2

        fry=0
        w=2
        h=2
        frox=8
        froy=16
    break}
    //case "cardreaderup": {frx=19.5 fry=6.5 w=2 h=2 frox=16 froy=16 break}
    //case "cardreaderdown": {frx=32.5 fry=6.5 w=2 h=2 frox=16 froy=16 break}

    case "talkbox": {frx=23+frame fry=16 break}
    case "goalblock": {frx=26.5+frame fry=5 break}
    case "finishstar": {frx=26.5+global.fastframe4 fry=6 break}

    case "hardblock": {frx=2 fry=20 break}//used exclusively for hidden shiftblocks btw
    case "noteblock": {frx=8+fr  fry=18+isred break}
    case "shiftblock": fry=21 {if go frx=10 else if hit||content="" frx=11 else {frx=8+fr fry=20} break}

    case "warpbox": {frx=27.5-key+frame fry=4 frox=8 froy=8 if oncooldown alpha=0.5  break}

}

if plat=0 draw_background_part_ext(global.master[biome],frx*16+8,fry*16+8,w*16,h*16,floor(x-frox*xsc)+notex,floor(y-froy*ysc)+notey+dy,xsc,ysc,$ffffff,alpha)
if (plat!=0) draw_background_part_ext(global.master[biome],(frx+2)*16+8,fry*16+8,16,16,floor(x-frox*xsc+plat*16*xsc),floor(y-froy*ysc)+dy,xsc,ysc,$ffffff,1)
