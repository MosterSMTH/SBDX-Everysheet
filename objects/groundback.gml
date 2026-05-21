#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)
c9=position_meeting(x+24,y-8,groundback)  || position_meeting(x+24,y-8,slopel1b) || position_meeting(x+24,y-8,slopel2b) || position_meeting(x+24,y-8,nsloplb) || position_meeting(x+24,y-8,nslopl2b) || position_meeting(x+24,y-8,nsloplub) || position_meeting(x+24,y-8,nslopl2ub) || x=region.x-16
c6=position_meeting(x+24,y+8,groundback)  || position_meeting(x+24,y+8,slopel1b) || position_meeting(x+24,y+8,slopel2b) || position_meeting(x+24,y+8,uslopel2b) || position_meeting(x+24,y+8,uslopel1b) || position_meeting(x+24,y+8,nsloplb) || position_meeting(x+24,y+8,nslopl2b) || x=region.x-16
c7=position_meeting(x-8,y-8,groundback)  || position_meeting(x-8,y-8,sloper1b) || position_meeting(x-8,y-8,sloper2b) || position_meeting(x-8,y-8,usloper2b) || position_meeting(x-8,y-8,usloper1b) || position_meeting(x-8,y-8,nsloprb) || position_meeting(x-8,y-8,nslopr2b) || position_meeting(x-8,y-8,nsloprub) || position_meeting(x-8,y-8,nslopr2ub)  || x=region.lefthand
c4=position_meeting(x-8,y+8,groundback)  || position_meeting(x-8,y+8,sloper1b) || position_meeting(x-8,y+8,sloper2b) || position_meeting(x-8,y+8,usloper1b) || position_meeting(x-8,y+8,usloper2b) || position_meeting(x-8,y+8,nsloprub) || position_meeting(x-8,y+8,nslopr2ub) || x=region.lefthand
c1=position_meeting(x-8,y+24,groundback) || position_meeting(x-8,y+24,nsloprub) || position_meeting(x-8,y+24,nslopr2ub) || position_meeting(x-8,y+24,usloper2b) || position_meeting(x-8,y+24,usloper1b) || x=region.lefthand || y=region.ky-16
c3=position_meeting(x+24,y+24,groundback) || position_meeting(x+24,y+24,nsloplub) || position_meeting(x+24,y+24,nslopl2ub) || position_meeting(x-8,y+24,uslopel2b) || position_meeting(x-8,y+24,uslopel1b) || x=region.x-16 || y=region.ky-16
c8=position_meeting(x+8,y-8,groundback)
c2=position_meeting(x+8,y+24,groundback) || y=region.ky-16
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var bx,by,sheet,lx,depth1;

bx=x mod 32
by=y mod 32
if !dontrender
{
sheet=global.everysheet[biome]
terraintile=1

lx = 912; depth1 = 1000006;

//It's like calculators/numpad 1 is bottomleft 2 is bottommid 3 is bottomright....

if (c1 && c2 && c3 && c4 && c6 && c7 && c8 && c9) {/*middle fill*/ tile_bake(sheet,lx + 32+bx,408+by,16,16,x,y,depth1)}
else if (!c8 && !c4 && !c6 && !c2) {/*lone tile*/ tile_bake(sheet,lx + 88,480,32,32,x-8,y-8,depth1)}
else if (!c8 && !c2) {
    if (!c4) {/*platform left*/ tile_bake(sheet,lx + 8,480,24,32,x-8,y-8,depth1)}
    else if (!c6) {/*platform right*/ tile_bake(sheet,lx + 64,480,24,32,x,y-8,depth1)}
    else {/*platform middle*/ tile_bake(sheet,lx + 32+bx,480,16,32,x,y-8,depth1)}
} else if (!c4 && !c6) {
    if (!c8) {/*pole top*/ tile_bake(sheet,lx + 88,384,32,24,x-8,y-8,depth1)}
    else if (!c2) {/*pole bottom*/ tile_bake(sheet,lx + 88,440,32,24,x-8,y,depth1)}
    else {/*pole middle*/ tile_bake(sheet,lx + 88,408+by,32,16,x-8,y,depth1)}
} else {
    if (!c4) {
        if (!c8) {
            if (!c3) {
                /*slim corner top left*/tile_bake(sheet,lx + 168,384,24,24,x-8,y-8,depth1)
            } else 
            {/*corner top left*/ tile_bake(sheet,lx + 8,384,24,24,x-8,y-8,depth1)}
        } else if (!c2) {
            if (!c9) {/*slim corner bottom left*/tile_bake(sheet,lx + 168,408,24,24,x-8,y,depth1)} 
            else {/*corner bottom left*/ tile_bake(sheet,lx + 8,440,24,24,x-8,y,depth1)}
        } else {//!4 & 8 & 2 & 6
            if (!c9 && c3 ) {tile_bake(sheet,lx + 120,448,24,16,x-8,y,depth1)}
            else if (!c3 && c9) {tile_bake(sheet,lx + 120,432,24,16,x-8,y,depth1)}
            else if (!c3 && !c9) {tile_bake(sheet,lx + 224,488,24,16,x-8,y,depth1)}
             else {/*left wall*/ tile_bake(sheet,lx + 8,408+by,24,16,x-8,y,depth1)}
        }
    } else if (!c6) {
        if (!c8) {
            if (!c1) {/*slimcorner top right*/ tile_bake(sheet,lx + 192,384,24,24,x,y-8,depth1)}
             else {/*corner top right*/ tile_bake(sheet,lx + 64,384,24,24,x,y-8,depth1)}
        } else if (!c2) {
            if (!c7) {/*slimcorner bottom right*/ tile_bake(sheet,lx + 192,408,24,24,x,y,depth1)}
             else {/*corner bottom right*/ tile_bake(sheet,lx + 64,440,24,24,x,y,depth1)}
        } else {
            if (!c1 && c7 ) {tile_bake(sheet,lx + 144,432,24,16,x,y,depth1)}
            else if (!c7 && c1) {tile_bake(sheet,lx + 144,448,24,16,x,y,depth1)}
            else if (!c7 && !c1) {tile_bake(sheet,lx + 248,488,24,16,x,y,depth1)}
            else {/*right wall*/ tile_bake(sheet,lx + 64,408+by,24,16,x,y,depth1)}
        }
    } else { // 6 && 4 
        if (!c8) {// !8 && 6 && 4 
            if (c1 && !c3) {tile_bake(sheet,lx + 128,384,16,24,x,y-8,depth1)}
            else if (c3 && !c1 ){tile_bake(sheet,lx + 144,384,16,24,x,y-8,depth1) } 
            else if(!c3 && !c1) {tile_bake(sheet,lx + 232,440,16,24,x,y-8,depth1)} 
            else {/*floor*/ tile_bake(sheet,lx + 32+bx,384,16,24,x,y-8,depth1)}
        } else if (!c2) { //8
            if (c7 && !c9) {tile_bake(sheet,lx + 128,408,16,24,x,y,depth1)}
            else if(!c7 && c9){tile_bake(sheet,lx + 144,408,16,24,x,y,depth1) } 
            else if(!c7 && !c9) {tile_bake(sheet,lx + 248,448,16,24,x,y,depth1)}  
            else {/*ceiling*/ tile_bake(sheet,lx + 32+bx,440,16,24,x,y,depth1)}
        } else { // 8 & 2 & 6 & 4
            if (c7+c9+c1+c3!=3) {
                if (c7+c9+c1+c3!=2){
                    if (c7+c9+c1+c3!=1){
                        tile_bake(sheet,lx + 240,408,16,16,x,y,depth1)
                    }
                    else if (!c7 && !c9 && !c1){tile_bake(sheet,lx + 176,472,16,16,x,y,depth1)}
                    else if (!c7 && !c3 && !c1){tile_bake(sheet,lx + 176,488,16,16,x,y,depth1)}
                    else if (!c7 && !c9 && !c3){tile_bake(sheet,lx + 192,472,16,16,x,y,depth1)}
                    else if (!c9 && !c3 && !c1){tile_bake(sheet,lx + 192,488,16,16,x,y,depth1)}
                }
                else if (!c7 && !c9)/*everyone except these two*/{tile_bake(sheet,lx + 240,424,16,16,x,y,depth1)}
                else if (!c7 && !c1){tile_bake(sheet,lx + 256,408,16,16,x,y,depth1)}
                else if (!c7 && !c3){tile_bake(sheet,lx + 128,472,16,16,x,y,depth1)}
                else if (!c9 && !c1){tile_bake(sheet,lx + 144,472,16,16,x,y,depth1)}
                else if (!c9 && !c3){tile_bake(sheet,lx + 224,408,16,16,x,y,depth1)} 
                else if (!c1 && !c3){tile_bake(sheet,lx + 240,392,16,16,x,y,depth1)}                                           
            }
            else if (!c7) {/*inner corner top left*/ tile_bake(sheet,lx + 192,448,16,16,x,y,depth1)}
            else if (!c9) {/*inner corner top right*/ tile_bake(sheet,lx + 176,448,16,16,x,y,depth1)}
            else if (!c1) {/*inner corner bottom left*/ tile_bake(sheet,lx + 192,432,16,16,x,y,depth1)}
            else if (!c3) {/*inner corner bottom right*/ tile_bake(sheet,lx + 176,432,16,16,x,y,depth1)}
        }
    }
}
terraintile=0
}
instance_destroy()
