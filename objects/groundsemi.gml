#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-8 is used since that would only catch the second tile of a semisolid nslop, the lowest one
c8=position_meeting(x+8,y-8,groundsemi)   || place_meeting(x,y-16,phaser).nslop
c9=position_meeting(x+24,y-8,groundsemi)  || place_meeting(x+16,y-16,nslopls) || place_meeting(x,y-8,nslopr2s) || place_meeting(x+16,y-16,nslopl2s) || (x=region.x-16 && c8)
c6=position_meeting(x+24,y+8,groundsemi) || place_meeting(x+16,y,nslopls) || place_meeting(x+16,y,nslopl2s) || position_meeting(x+24,y+8,uslopel1s) || position_meeting(x+24,y+8,uslopel2s) || x=region.x-16
c7=position_meeting(x-8,y-8,groundsemi) || place_meeting(x-16,y-16,nsloprs) || place_meeting(x,y-8,nslopl2s)  || place_meeting(x-16,y-16,nslopr2s) || x=region.lefthand
c4=position_meeting(x-8,y+8,groundsemi) || position_meeting(x-8,y+8,sloper1s) || position_meeting(x-8,y+8,sloper2s) || place_meeting(x-16,y+8,nsloprs) || place_meeting(x-16,y+8,nslopr2s) || position_meeting(x-8,y+8,usloper1s) || position_meeting(x-8,y+8,usloper2s) || x=region.lefthand
c1=position_meeting(x-8,y+24,groundsemi) || position_meeting(x-8,y+24,usloper1s) || position_meeting(x-8,y+24,usloper2s) || x=region.lefthand || y=region.ky-16
c3=position_meeting(x+24,y+24,groundsemi) || position_meeting(x+24,y+24,uslopel1s) || position_meeting(x+24,y+24,uslopel2s) || x=region.x-16 || y=region.ky-16

c2=position_meeting(x+8,y+24,groundsemi) || y=region.ky-16
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var bx,by,sheet,lx;

bx=x mod 32
by=y mod 32
if !dontrender
{
sheet=global.everysheet[biome]
terraintile=1

lx = 456;

//It's like calculators/numpad 1 is bottomleft 2 is bottommid 3 is bottomright....

if (c1 && c2 && c3 && c4 && c6 && c7 && c8 && c9) {/*middle fill*/ tile_bake(sheet,lx + 32+bx,408+by,16,16,x,y,depth)}
else if (!c8 && !c4 && !c6 && !c2) {/*lone tile*/ tile_bake(sheet,lx + 88,480,32,32,x-8,y-8,depth)}
else if (!c8 && !c2) {
    if (!c4) {/*platform left*/ tile_bake(sheet,lx + 8,480,24,32,x-8,y-8,depth)}
    else if (!c6) {/*platform right*/ tile_bake(sheet,lx + 64,480,24,32,x,y-8,depth)}
    else {/*platform middle*/ tile_bake(sheet,lx + 32+bx,480,16,32,x,y-8,depth)}
} else if (!c4 && !c6) {
    if (!c8) {/*pole top*/ tile_bake(sheet,lx + 88,384,32,24,x-8,y-8,depth)}
    else if (!c2) {/*pole bottom*/ tile_bake(sheet,lx + 88,440,32,24,x-8,y,depth)}
    else {/*pole middle*/ tile_bake(sheet,lx + 88,408+by,32,16,x-8,y,depth)}
} else {
    if (!c4) {
        if (!c8) {
            if (!c3) {
                /*slim corner top left*/tile_bake(sheet,lx + 168,384,24,24,x-8,y-8,depth)
            } else 
            {/*corner top left*/ tile_bake(sheet,lx + 8,384,24,24,x-8,y-8,depth)}
        } else if (!c2) {
            if (!c9) {/*slim corner bottom left*/tile_bake(sheet,lx + 168,408,24,24,x-8,y,depth)} 
            else {/*corner bottom left*/ tile_bake(sheet,lx + 8,440,24,24,x-8,y,depth)}
        } else {//!4 & 8 & 2 & 6
            if (!c9 && c3 ) {tile_bake(sheet,lx + 120,448,24,16,x-8,y,depth)}
            else if (!c3 && c9) {tile_bake(sheet,lx + 120,432,24,16,x-8,y,depth)}
            else if (!c3 && !c9) {tile_bake(sheet,lx + 224,488,24,16,x-8,y,depth)}
             else {/*left wall*/ tile_bake(sheet,lx + 8,408+by,24,16,x-8,y,depth)}
        }
    } else if (!c6) {
        if (!c8) {
            if (!c1) {/*slimcorner top right*/ tile_bake(sheet,lx + 192,384,24,24,x,y-8,depth)}
             else {/*corner top right*/ tile_bake(sheet,lx + 64,384,24,24,x,y-8,depth)}
        } else if (!c2) {
            if (!c7) {/*slimcorner bottom right*/ tile_bake(sheet,lx + 192,408,24,24,x,y,depth)}
             else {/*corner bottom right*/ tile_bake(sheet,lx + 64,440,24,24,x,y,depth)}
        } else {
            if (!c1 && c7 ) {tile_bake(sheet,lx + 144,432,24,16,x,y,depth)}
            else if (!c7 && c1) {tile_bake(sheet,lx + 144,448,24,16,x,y,depth)}
            else if (!c7 && !c1) {tile_bake(sheet,lx + 248,488,24,16,x,y,depth)}
            else {/*right wall*/ tile_bake(sheet,lx + 64,408+by,24,16,x,y,depth)}
        }
    } else { // 6 && 4 
        if (!c8) {// !8 && 6 && 4 
            if (c1 && !c3) {tile_bake(sheet,lx + 128,384,16,24,x,y-8,depth)}
            else if (c3 && !c1 ){tile_bake(sheet,lx + 144,384,16,24,x,y-8,depth) } 
            else if(!c3 && !c1) {tile_bake(sheet,lx + 232,440,16,24,x,y-8,depth)} 
            else {/*floor*/ tile_bake(sheet,lx + 32+bx,384,16,24,x,y-8,depth)}
        } else if (!c2) { //8
            if (c7 && !c9) {tile_bake(sheet,lx + 128,408,16,24,x,y,depth)}
            else if(!c7 && c9){tile_bake(sheet,lx + 144,408,16,24,x,y,depth) } 
            else if(!c7 && !c9) {tile_bake(sheet,lx + 248,448,16,24,x,y,depth)}  
            else {/*ceiling*/ tile_bake(sheet,lx + 32+bx,440,16,24,x,y,depth)}
        } else { // 8 & 2 & 6 & 4
            if (c7+c9+c1+c3!=3) {
                if (c7+c9+c1+c3!=2){
                    if (c7+c9+c1+c3!=1){
                        tile_bake(sheet,lx + 240,408,16,16,x,y,depth)
                    }
                    else if (!c7 && !c9 && !c1){tile_bake(sheet,lx + 176,472,16,16,x,y,depth)}
                    else if (!c7 && !c3 && !c1){tile_bake(sheet,lx + 176,488,16,16,x,y,depth)}
                    else if (!c7 && !c9 && !c3){tile_bake(sheet,lx + 192,472,16,16,x,y,depth)}
                    else if (!c9 && !c3 && !c1){tile_bake(sheet,lx + 192,488,16,16,x,y,depth)}
                }
                else if (!c7 && !c9)/*everyone except these two*/{tile_bake(sheet,lx + 240,424,16,16,x,y,depth)}
                else if (!c7 && !c1){tile_bake(sheet,lx + 256,408,16,16,x,y,depth)}
                else if (!c7 && !c3){tile_bake(sheet,lx + 128,472,16,16,x,y,depth)}
                else if (!c9 && !c1){tile_bake(sheet,lx + 144,472,16,16,x,y,depth)}
                else if (!c9 && !c3){tile_bake(sheet,lx + 224,408,16,16,x,y,depth)} 
                else if (!c1 && !c3){tile_bake(sheet,lx + 240,392,16,16,x,y,depth)}                                           
            }
            else if (!c7) {/*inner corner top left*/ tile_bake(sheet,lx + 192,448,16,16,x,y,depth)}
            else if (!c9) {/*inner corner top right*/ tile_bake(sheet,lx + 176,448,16,16,x,y,depth)}
            else if (!c1) {/*inner corner bottom left*/ tile_bake(sheet,lx + 192,432,16,16,x,y,depth)}
            else if (!c3) {/*inner corner bottom right*/ tile_bake(sheet,lx + 176,432,16,16,x,y,depth)}
        }
    }
}
terraintile=0
}
if (!scaled) if !c8 && !place_meeting(x,y,phaser) && !dontrender instance_create(x,y,phaser)
instance_destroy()
