///ssw_item(name)
//This handles sprite switching for the items of the game

if (!inview()) exit

var frox,froy, frx,fry, fr,ffr4,fr88, xsc,ysc,w,h,sheet, lx;

fr=global.frame
ifr=global.itemframe
ffr4=global.fastframe4
fr88=global.frame88

frox=0 froy=0 frx=0 fry=0 w=1 h=1 xsc=1 ysc=1
sheet=global.everysheet[biome]
lx = 1360;

switch (argument[0]) {
    case "coin":        { frox=8 froy=8 frx=4+ifr fry=0 break}
    case "coinup":      { frox=8 froy=8 frx=4+ifr fry=1 break}
    case "redcoin":     { frox=8 froy=8 frx=4+ifr fry=2 break}
    case "bluecoin":    { frox=8 froy=8 frx=4+ifr fry=3 break}
    case "kaerucoin":   { frox=8 froy=8 frx=4+ifr fry=4 break}
    case "dotcoin":     { frox=8 froy=8 frx=4+ifr fry=5 break}
    case "kaerudotcoin":{ frox=8 froy=8 frx=4+ifr fry=6 break}
    case "ring":        { frox=8 froy=8 frx=4+ifr fry=7 break}
    case "kaeruring":   { frox=8 froy=8 frx=4+ifr fry=8 break}
    case "dotring":     { frox=8 froy=8 frx=4+ifr fry=9 break}
    case "kaerudotring":{ frox=8 froy=8 frx=4+ifr fry=10 break}

    case "mushroom":    { if (hspeed>=0 && skindat("itemflip")) xsc=-1 frx=ifr fry=0 frox=8 froy=8 break}
    case "fflower":     { frx=ifr fry=1 frox=8 froy=8 break}
    case "bfeather":    { frx=featherfr fry=2 frox=8 froy=8 break}
    case "lifemush":    { if (hspeed>=0 && skindat("itemflip")) xsc=-1 frx=ifr fry=3 frox=8 froy=8 break}
    case "3moon":       { frx=ifr fry=4 frox=8 froy=8 break}
    case "star":        { if (hspeed>=0 && skindat("itemflip")) xsc=-1 frx=ifr fry=5 frox=8 froy=8 break}
    case "shield":      { frx=ifr fry=6 frox=8 froy=8 break} //frx+=4??
    case "mini":        { frx=fr fry=7 frox=8 froy=8 break}
    case "mushpoison":  { if (hspeed>=0 && skindat("itemflip")) xsc=-1 frx=ifr fry=8 frox=8 froy=8 break}
    case "btroot":      { frx=ifr fry=9 frox=8 froy=8 if (object_index == projectile) {xsc=0.88 ysc=0.88} break}
    case "glui":        { frx=ifr fry=10 frox=8 froy=8 break}

    case "redring":     { frox=8 froy=8 frx=ifr fry=11 break}
    case "clearing":    { frox=8 froy=8 frx=4+ifr fry=11 break}

    case "shard":       { frx8+=fr88 fry=0 frox=8 froy=8 if (flip) xsc=-1 break}
    case "key":         { frx=8+fr fry=1 frox=8 froy=8 break}
    case "keyfollow":   { frx=8+fr fry=1 frox=8 froy=9-round(abs(cos(posbob))*bob) break}
    case "card":
    case "cardfollow":  { frx=12+fr fry=1 frox=8 froy=9 break}
    case "cardforshow": { frx=12 fry=1 frox=8 froy=8 xsc=0.5 ysc=0.5 break}

    case "jumprefresh": { frx=14+spent fry=3 frox=8 froy=8 break}
    case "token":       { frx=8 + (4 * (type mod 2)) + ifr fry=2 + (type div 2) frox=8 froy=8 break}
    case "tokenforshow":{ frx=8 + (4 * (type mod 2)) fry=2 + (type div 2) frox=8 froy=8 xsc=0.5 ysc=0.5 break}

    case "collectclues":{ if (hspeed>=0 && skindat("itemflip")) xsc=-1 frx=12+ifr fry=11 frox=8 froy=8 break}
}

draw_background_part_ext(sheet,lx + frx*16+8,fry*16+8,w*16,h*16,floor(x-frox*xsc),floor(y-froy*ysc)+dy,xsc,ysc,$ffffff,1)
