//Name: Bikram Baral
//Assignment: Shatter
//File: Class File


// A class to represent one particle
class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float lifespan;
  float fillR, fillG, fillB, fillA;
  
  Particle( PVector loc ) {
    location = loc.copy();
    velocity = new PVector( 0, 0 );
    acceleration = new PVector( 0, 0 );
    lifespan = 255.0;
    mass = 1.0;
    fillR = 255.0;
    fillG = 255.0;
    fillB = 255.0;
    fillA = 255.0;
  }
  
  void applyForce( PVector force ) {
    PVector f = force.copy();
    f.div(mass);
    acceleration.add( f );
  }
  
  void update() {
    velocity.add( acceleration );
    location.add( velocity );
    acceleration.mult( 0 );
    lifespan -= 2.0;
  }
  
  void render() {
    noStroke();
    fillR = fillR + randomGaussian()*40.0;
    fillG = fillG + randomGaussian()*40.0;
    fillB = fillB + randomGaussian()*40.0;
    fill( fillR, fillG, fillB, lifespan );
    ellipse( location.x, location.y, 8, 8 );
    
  }
  
  boolean isDead() {
    return (lifespan <= 0.0);
  }
  
  void setColor( float r, float g, float b, float a ) {
    fillR = r;
    fillG = g;
    fillB = b;
    fillA = a;
  }
  
}