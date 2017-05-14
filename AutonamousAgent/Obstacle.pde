class Obstacle {
  PVector location;
  float radius;

  
  Obstacle( float x, float y, float r ) {
    location = new PVector( x, y );
    radius = r;
  }
  
  void render() {
    stroke( 200 );
    strokeWeight( 1 );
    fill( 147, 0, 4 );
    ellipse( location.x, location.y, radius * 2, radius * 2 );
  }
  
}