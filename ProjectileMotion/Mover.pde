
class Mover {
  // instance variables
  PVector location;
  PVector velocity;
  PVector acceleration;
  float radius = 8.0;
  float mass = 5;
  float bounciness = 0.5;

  // constructor
  Mover( float _x, float _y ) {
    location = new PVector( _x, _y );
    velocity = new PVector( 0.0, 0.0 );
    acceleration = new PVector( 0.0, 0.0 );
  }

  // ******** Instance methods *********

  void applyForce(PVector force) {
    PVector f = force.copy();
    f.div(mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add( acceleration );
    velocity.limit( 30.0 ); //make sure number is higher than 5
    location.add( velocity );
    bounce();
    acceleration.mult( 0 );
  }

  void render() {
    stroke( 0 );
    fill( 220 );
    ellipse( location.x, location.y, radius * 2, radius * 2 );
  }

  void wrap() {
    if (location.x < -radius) {
      location.x = width + radius;
    } else if (location.x > width + radius) {
      location.x = -radius;
    } else if (location.y < -radius) {
      location.y = height + radius;
    } else if (location.y > height + radius) {
      location.y = -radius;
    }
  }
  //This function Bounce the ball 
  void bounce() {
    if (location.x - radius <= 0) {
      location.x = radius;
      velocity.x *= -bounciness;
    } else if (location.x + radius >= width) {
      location.x = width - radius;
      velocity.x *= -bounciness;
    }
    if (location.y - radius <= 0) {
      location.y = radius;
      velocity.y *= -bounciness;
    } else if (location.y + radius >= height) {
      location.y = height - radius;
      velocity.y *= -bounciness;
    }
  }
}