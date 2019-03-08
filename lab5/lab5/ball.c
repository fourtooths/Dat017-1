#include "rendering.h"

GEOMETRY ball_geometry = 
{
	12,         //numPoints
	4, 4,       //sizeX, sizeY
	{
		//px[0, 1, 2, ....]
		{0, 1}, {0, 2}, {1, 0}, {1, 1}, {1, 2}, 
		{1, 3}, {2, 0}, {2, 1}, {2, 2}, {2, 3}, 
		{3, 2}
	}
};


void move_object(POBJECT object){
	if(object->posX >118){
		object->set_speed(object, -2, object->dirY);
	} else if (object->posX <10){
		object->set_speed(object, 2, object->dirY);
	}
	if (object->posY <10){
		object->set_speed(object, object->dirX, 2);
	} else if (object->posY >54){
		object->set_speed(object, object->dirX, -2);
	}
	clear_object(object);
	object->posX += object->dirX;
	object->posY += object->dirY;
	
	if(object->posX < 1 || object->posX + object->geo->sizeX > 128){
		object->dirX = -object->dirX;
	}
	
	if(object->posY < 1 || object->posY + object->geo->sizeY > 64){
		object->dirY = -object->dirY;
	}
	draw_object(object);
}

OBJECT ball = 
{
	&ball_geometry,
	0, 2,
	1, 1,
	draw_object,
	clear_object,
	move_object,
	set_object_speed
};