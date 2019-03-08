#include "rendering.h"

GEOMETRY obstacle_geometry = 
{
	40,         //numPoints
	10, 10,       //sizeX, sizeY
	{
		//px[0, 1, 2, ....]
		{0, 0}, {1, 0}, {2, 0}, {3, 0}, {4, 0}, {5, 0}, {6, 0}, {7, 0}, {8, 0}, {9, 0}, {10, 0}, 
		{1, 0}, {1, 10}, {2, 0}, {2, 10}, {3, 0}, {3, 10}, {4, 0}, {4, 10}, {5, 0}, {5, 10}, 
		{6, 0}, {6, 10}, {7, 0}, {7, 10}, {8, 0}, {8, 10}, {9, 0}, {9, 10}, {10, 0}, {10, 10},  
		{0, 10}, {1, 10}, {2, 10}, {3, 10}, {4, 10}, {5, 10}, {6, 10}, {7, 10}, {8, 10}, {9, 10}, {10, 10}  
	}
};

void move_obstacle(POBJECT object){
	if(object->posX < 1){     //om utanför skärmen, radera
		clear_object(object);
		return;
	}
	clear_object(object);
	object->posX += object->dirX;
	object->posY += object->dirY;
	draw_object(object);
}

OBJECT obstacle = 
{
	&obstacle_geometry,
	(-2), 0,
	110, 0,
	draw_object,
	clear_object,
	move_obstacle,
	set_object_speed
};