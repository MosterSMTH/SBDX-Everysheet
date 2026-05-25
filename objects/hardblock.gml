#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
tile_delete(mytile)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)

mytile=tile_dyn(global.everysheet[biome],40,328+16*!!(position_meeting(x+8,y-8,hardblock) || position_meeting(x+8,y-8,bighardblock)),16,16,x,y,999999)
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
getregion(x)

switch (place){
    case 0: mytile=tile_dyn(global.everysheet[biome],8,296+32*!!(position_meeting(x+8,y-16,hardblock) || position_meeting(x+8,y-16,bighardblock)),16,16,x,y,999999) break;
    case 1: mytile=tile_dyn(global.everysheet[biome],8+16,296+32*!!(position_meeting(x+8,y-16,hardblock) || position_meeting(x+8,y-16,bighardblock)),16,16,x,y,999999) break;
    case 2: mytile=tile_dyn(global.everysheet[biome],8,296+16+32*!!(position_meeting(x+8,y-16,hardblock) || position_meeting(x+8,y-16,bighardblock)),16,16,x,y,999999) break;
    case 3: mytile=tile_dyn(global.everysheet[biome],8+16,296+16+32*!!(position_meeting(x+8,y-16,hardblock) || position_meeting(x+8,y-16,bighardblock)),16,16,x,y,999999) break;


}
