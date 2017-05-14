//Name: Bikram Baral
//Assignment: Wander & Flee

class Vehicle {

  PVector position;
  PVector velocity;
  PVector acceleration;
  float r;
  float wonderAngle;
  float maxforce;
  float maxspeed;  
  boolean flee = false;
  int Time;
  float CHANGE = 30;
  int range = 5;

  Vehicle(float x, float y) {
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    position = new PVector(x, y);
    r = 6;
    wonderAngle = 0;
    maxspeed = 4;
    maxforce = 0.1;
  }

  void run() {
    update();
    Arena();
    render();
  }

  void update() {

    velocity.add(acceleration);
    velocity.limit(maxspeed);
    position.add(velocity);
    acceleration.mult(0);
  }

  void Arena() {
    PVector desired = null;

    if (position.x < distance) {
      desired = new PVector(maxspeed, velocity.y);
      desired.normalize();
      desired.mult(maxspeed);
      PVector steer = PVector.sub(desired, velocity);
      steer.limit(maxforce);
      applyForce(steer);
    }
    if (position.y < distance) {
      desired = new PVector(velocity.x, maxspeed);
      desired.normalize();
      desired.mult(maxspeed);
      PVector steer = PVector.sub(desired, velocity);
      steer.limit(maxforce);
      applyForce(steer);
    } else if (position.x > width -distance) {
      desired = new PVector(-maxspeed, velocity.y);
      desired.normalize();
      desired.mult(maxspeed);
      desired.mult(-1);
      PVector steer = PVector.sub(desired, velocity);
      steer.limit(-maxforce);
      applyForce(steer);
    } else if (position.y > height-distance) {
      desired = new PVector(velocity.x, -maxspeed);
      desired.normalize();
      desired.mult(-maxspeed);
      desired.mult(-1);
      PVector steer = PVector.sub(desired, velocity);
      steer.limit(maxforce);
      applyForce(steer);
    }
  }  

  void wander() {
    float wander_radius = 25;
    float wander_distance = 90;      
    float Change_wonderAngle = 0.3;
    wonderAngle += random(-Change_wonderAngle, Change_wonderAngle);

    PVector CircleCenter = velocity.copy();
    CircleCenter.normalize();   
    CircleCenter.mult(wander_distance); 
    CircleCenter.add(position); 

    float head = velocity.heading();
    PVector distanceOff = new PVector(wander_radius*cos(wonderAngle+head), wander_radius*sin(wonderAngle+head));
    PVector target = PVector.add(CircleCenter, distanceOff);
    seek(target);

    if (mouseDrag) {
      WonderCircleObject(CircleCenter, wander_radius);
    }
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void render() {
    float theta = velocity.heading() + PI/2;

    // agents by default are green
    if (flee != true) {
      fill(120, 255, 20);
    }
    //upon drag of target, agent turns into red
    if (flee == true) {
      fill(255, 25, 25);
      int BeginTime = millis();
      int changeColorTime = BeginTime - Time;
      //If the time is greater than 2 sec than change back the color to green
      if (changeColorTime > 2000) {
        flee = false;
      }
    }
    //Create Triangle
    stroke(0);
    pushMatrix();
    translate(position.x, position.y);
    rotate(theta);
    beginShape(TRIANGLES);
    vertex(0, -r*2.5);
    vertex(-r, r*2.5);
    vertex(r, r*2.5);
    endShape();
    popMatrix();
  }
  //This function draw the Ellipse infront of Triangle
  void WonderCircleObject( PVector circle, float radius) {
    stroke(0);
    fill(10, 220, 150);
    ellipseMode(CENTER);
    ellipse(circle.x, circle.y, radius*1.5, radius*1.5);
  }
  //This function change the color if the distance between predator
  //and flee is 50 pixels
  void flee( PVector predator ) {
    float fleeSwitch = 50; //agent within 50 pixels of predator
    float d = PVector.dist(predator, position);
    //if position of with this 50. it changes the color
    if (( d > 0) && (d < fleeSwitch) && (flee = true)) {  
      PVector desired = PVector.sub(position, predator);
      desired.normalize();
      desired.mult(maxspeed);
      PVector steer = PVector.sub(desired, velocity);
      applyForce(steer);
      Time = millis();
    }
  }
  void seek(PVector target) {
    PVector desired = PVector.sub(target, position); 
    desired.normalize();
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce); 
    applyForce(steer);
  }
}