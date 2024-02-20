# ParticleGame
All the particles are represented as pixels placed in a matrix using a `std::vector<Particle*> matrix`. 
To access a specific particle, i use the expression `matrix[x + y * Height]`.

## Density Simulation

I simulate the density effect through the magnitude of displacement between two particle types (e.g., water to sand and sand to water):

- If the displacement occurs vertically every **1 row**, it appears that the density is **high**.
- However, if the displacement happens vertically every **2 or more rows**, it seems that the density is **low** because, for example, a sand particle moves quickly there.

## Sand Velocity

In the `Sand` class, I set the velocity of sand particles using the method `setSandVelocitytoType(char& particleTypeToMove, int& vel)`. Inside this method:

- If `particleTypeToMove` is **air**, the velocity (`vel`) is set to a random value between 5 and 35.
- else If it's **water**, the velocity is set to **2**.
- else If it's **oil**, the velocity is set to **1**.

## Particle Movement

Inside the `void Sand::moveSand` method:

- I define the variable `moveBy` based on the velocity (`vel`).
- Then I call `updateDown(x, y, moveBy, particleTypeToMove, sand)`.

## Particle Type Exchange

Then by calling the method `void World::setParticle(char t, int x, int y)` twice, i exchange the types of particles in the matrix. For example:

1. Change the particle of sand at (0,0) to (0,2).
2. Change the particle of water at (0,2) to (0,0).

## Matrix Representation

For example, considering the simplified matrix:

| 0  | 1  | 2  | 3  |
|----|----|----|----|
| 4  | 5  | 6  | 7  |
| 8  | 9  | 10 | 11 |
| 12 | 13 | 14 | 15 |

And a Height of **4**, i access the matrix using the expression: `matrix[x + y * Height]`, and y depending on vel:  

- (x=0, y=0): `matrix[0 + 0 * 4]->setType(sand)`, the particle at `matrix[0]` is changed.
- (x=0, y=2): `matrix[0 + 2 * 4]->setType(sand)`, the particle at `matrix[8]` is changed.

So, the particle of sand travels vertically every **2nd row**, and if the change in `y` (velocity) were **4**, the particle would travel vertically every **4 rows** (twice as fast).
