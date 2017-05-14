//Name: Bikram Baral
//Assignment: Wonder & flee

Vehicle[] v1; //agent array
PVector target;
boolean mouseDrag = true;

float distance = 50;

void setup() {
  size( 800, 800 );
 v1 = new Vehicle[6];
 for(int i = 0; i < 6; i++) {
   v1[i] = new Vehicle( i*10, height / 2.0 );
 }
  target = new PVector( 100, 100 );
}

void draw() {
  background( 218 );
  
  // Draw the target
  fill(10,220,40);
  stroke(0);
  ellipse( target.x, target.y, 60, 60 );
  
  //draw 6 agents
  for(int i = 0 ; i < 6; i++){
  v1[i].Arena();
  v1[i].wander();
  v1[i].run();
  v1[i].flee(target);
  }
}

void mouseDragged() {
  target = new PVector( mouseX, mouseY );
}