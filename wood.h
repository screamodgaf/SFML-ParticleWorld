#ifndef WOOD_H
#define WOOD_H
#include "world.h"

class Wood
{
public:
    Wood(World &world_);
    bool moveWood(int &x, int &y);
};

#endif // WOOD_H
