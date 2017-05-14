
// The function arrow makes it easy to draw a line with an arrow head at the end.
float sizeofarrow = 5.0;

void arrowSize( float newArrowSize ) {
  sizeofarrow = newArrowSize;
}

void arrow( float x1, float y1, float x2, float y2 ) {

  line( x1, y1, x2, y2 );

  PVector v = new PVector( x2 - x1, y2 - y1 );
  float theta = v.heading();

  pushMatrix();
  translate( x2, y2 );
  rotate( theta );
  line( -sizeofarrow, -sizeofarrow, 0, 0 );
  line(  0, 0, -sizeofarrow, sizeofarrow );
  popMatrix();
}