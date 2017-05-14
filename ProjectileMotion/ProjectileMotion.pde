 //<>//
Mover m1;
Target t;
PVector gravity;
PVector wind;
PVector push;
PVector center;
int k = 0;

void setup() {
  size( 1200, 500 );
  m1 = new Mover(0, 0 );
  t = new Target(random(0, 1)*1200-15, random(0, 1)*500-15);
  wind = new PVector(random(-0.01, 0.01), 0);
  gravity = new PVector(0.0, 0.3);
  push = new PVector(1.0, -1.0);
  //push = PVector.random2D();
  push.mult(5);
  center = new PVector(width/2, height/2);
}

void draw() {
  background( #d9b3ff );
  stroke(0);


  stroke(0, 0, 200);
  arrow(center.x, center.y, center.x + wind.x * 9000.0, center.y + wind.y * 9000.0);


  if (m1 != null) {
    float c = 0.6; //this is a stopp point.
    PVector friction = m1.velocity.copy();
    friction.mult(-1);
    friction.normalize();
    friction.mult(c);
    m1.applyForce( friction);
    PVector gravForM1 = gravity.copy();
    gravForM1.mult(m1.mass); 
    PVector windR = wind.copy();
    windR.mult(5); 

    t.render();
    t.TargetHit();

    arrow(m1.location.x, m1.location.y, m1.location.x+ push.x * 10.0, m1.location.y+  push.y * 10.0);
    m1.applyForce( gravForM1);
    m1.applyForce(windR);
    m1.update();
    m1.render();
  }
}

//Launcher with controls
void keyPressed() {
  if (key == 's') { //arrow up
    push.rotate(0.3);
  }

  if (key == 'w') { //arrow down

    push.rotate(-0.3);
  }
  //increase the size of arrow
  //Higher the arrow more force it apply
  if (key == 'd'  && k<5) {       
    push.mult(1.2);     
    k++;
  }
  //decrease the size of arrow
  //lower the arrow less force it apply
  if (key == 'a' && k>-10) { 
    push.div(1.2);
    k--;
  }

  if (key == 'p') { //press P to lunch the arrow
    m1 = new Mover(m1.location.x, m1.location.y);   
    PVector punch = push.copy();
    punch.mult(10);
    m1.applyForce(punch);
  }
}