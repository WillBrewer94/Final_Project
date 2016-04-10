
//{{BLOCK(tilemap_front_v1)

//======================================================================
//
//	tilemap_front_v1, 768x256@8, 
//	+ palette 256 entries, not compressed
//	+ 10 tiles (t|f reduced) not compressed
//	+ regular map (in SBBs), not compressed, 96x32 
//	Total size: 512 + 640 + 6144 = 7296
//
//	Time-stamp: 2016-04-05, 17:50:35
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_TILEMAP_FRONT_V1_H
#define GRIT_TILEMAP_FRONT_V1_H

#define tilemap_front_v1TilesLen 640
extern const unsigned short tilemap_front_v1Tiles[320];

#define tilemap_front_v1MapLen 6144
extern const unsigned short tilemap_front_v1Map[3072];

#define tilemap_front_v1PalLen 512
extern const unsigned short tilemap_front_v1Pal[256];

#endif // GRIT_TILEMAP_FRONT_V1_H

//}}BLOCK(tilemap_front_v1)
