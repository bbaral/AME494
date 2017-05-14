//Name: Bikram Baral
//File: DriverFile


ArrayList<Vehicle> agents;
ArrayList<Obstacle> obstacles;
boolean debug = true;

Path path;

Vehicle car1;
Vehicle car2;

void setup() {
  size( 1400, 700 );
  agents = new ArrayList<Vehicle>();
  path = new Path();
  for (int i = 0; i < 60; i++) {
    Vehicle v = new Vehicle( random(400,500), random(500,600) );
    v.velocity = new PVector(1.0, 0.0);
    car1 = new Vehicle(random(0, height/2), 0.04);
    car2 = new Vehicle(random(0, height/2), 0.05);
    agents.add( v );
    agents.add(car1);
    agents.add(car2);

  }
  obstacles = new ArrayList<Obstacle>();

  obstacles.add( new Obstacle(  1000, 100, 50 ) );
  obstacles.add( new Obstacle( 1000, 350, 50 ) );
  obstacles.add( new Obstacle( 1000, 600, 50) );
}

void draw() {
  background( 12, 3, 86 );
  path.display();
 /*   car1.follow(path);
  car2.follow(path);
  // Call the generic run method (update, borders, display, etc.)
  car1.run(agents);
  car2.run(agents);
  
  // Check if it gets to the end of the path since it's not a loop
  car1.borders(path);
  car2.borders(path);
  */
  
  for (Obstacle ob : obstacles) {
    ob.render();
    car1.follow(path);
    car1.run(agents);
    car1.borders(path);
    car2.follow(path);
    car2.run(agents);
    car2.borders(path);
  }
  for (Vehicle v : agents) {

    v.run(agents);
    car1.follow(path);
    car2.follow(path);
    car1.borders(path);
    car2.borders(path);
    
  }
}

void mousePressed() {

}