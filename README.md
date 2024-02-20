# ParticleGame
All the particles are pixels that are placed in a matrix std::vector<Particle*> matrix;  
To access certain particle I’m using the expression matrix[x + y * Height]
I simulate the density effect through the magnitude of displacement (i.e., type change, such as water to sand and sand to water) of two particles. If the displacement occurs vertically every 1 row, it appears that the density is high. However, if the displacement happens vertically every 2 or more rows, it seems that the density is low because, for example, a sand particle moves quickly there.
In the class Sand I set velocity of sand particles in the method: setSandVelocitytoType(char& particleTypeToMove, int& vel). And in there: 
    if(particleTypeToMove==air)vel = 5 + std::rand()%35;
    else if(particleTypeToMove==water)vel = 2;
    else if(particleTypeToMove==oil)vel = 1  ;
Then inside void Sand::moveSand I define the variable moveBy depending on the vel, and next I call updateDown(x, y, moveBy, particleTypeToMove, sand);
Then by calling the method void World::setParticle(char t, int x, int y) twice, I exchange the types of the particles in the matrix (i.e. particle of sand at (0,0) to (0,2), and particle of water at (0,2) to (0,0),  ).
So considering simplified matrix:
0   1  2  3  
4   5  6  7
8   9 10 11
12 13 14 15
and Hight of 4
using the expression: matrix[x+ y*Hight] and y depending on vel:
(x=0, y=0):
matrix[0+ 0*4]->setType(sand) the particle at matrix[0] is changed
(x=0, y=2):
matrix[0+ 2*4]->setType(sand) the particle at matrix[8] is changed
.. so the particle of sand travels vertically every 2nd row, and if the change in y (velocity) were 4, the particle would travel vertically every 4 rows (twice as fast).
