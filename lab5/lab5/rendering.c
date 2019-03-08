#include "rendering.h"

void set_object_speed(POBJECT o, int speedX, int speedY){
	o->dirX = speedX;
	o->dirY = speedY;
}

void draw_object(POBJECT o){
	for(int i = 0; i < o->geo->numPoints; i++){
		pixel(o->posX + o->geo->px[i].x, o->posY + o->geo->px[i].y, 1);
	}
}

void clear_object(POBJECT o){
	for(int i = 0; i < o->geo->numPoints; i++){
		pixel(o->posX + o->geo->px[i].x, o->posY + o->geo->px[i].y, 0);
	}
}