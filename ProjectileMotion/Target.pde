

class Target {
  // instance variables
  PVector location;
  PVector velocity;
  PVector acceleration; 
  float mass = 1.0;
  float bounciness = 0.85;
  int clearness = 1;

  // constructor
  Target( float _x, float _y ) {
    location = new PVector( _x, _y );
    velocity = new PVector( 0.0, 0.0 );
    acceleration = new PVector( 0.0, 0.0 );
  }

  //Newton's Second Law
  void applyForce(PVector force) {
    PVector f = force.copy();
    f.div(mass);
    acceleration.add(f);
  }


  void render() {
    stroke( 0 );
    if (clearness  == 1) {
      fill( 220 );
    } else {
      fill(#A93226);
    }
    rect( location.x, location.y, 50, 50 );
  }
  //This function is for target collision
  void TargetHit() {
    if (location.x - 30 <= m1.location.x && location.y - 30 <= m1.location.y && location.x + 30 >= m1.location.x && location.y + 30 >= m1.location.y ) {

      fill( 158 );
      rect( location.x, location.y, 50, 50 );
      clearness = 0;
    }
  }
}