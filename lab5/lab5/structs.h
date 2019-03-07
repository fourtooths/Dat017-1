#ifndef STRUCTS_H
#define STRUCTS_H

typedef struct tPoint{
	unsigned char x;
	unsigned char y;
}POINT;

typedef struct tGeometry{
	int numPoints;
	int sizeX;
	int sizeY;
	POINT px[MAX_POINTS];
} GEOMETRY, *PGEOMETRY;

typedef struct tObject{
	PGEOMETRY geo;
	int dirX, dirY;
	int posX, posY;
	void(*draw)(struct tObject*);    //rita i position x och y
	void(*clear)(struct tObject*);   //radera objektet
	void(*move)(struct tObject*); 
	void(*set_speed)(struct tObject*, int, int);
} OBJECT, *POBJECT;

#endif