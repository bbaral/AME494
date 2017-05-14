//Name: Bikram Baral
//Assignment: Shatter
//File: Drive File


import java.util.Iterator;

ArrayList<ParticleSystem> systems;
PVector gravity = new PVector( 0, 0.04 );
//This boolean value represent the large shape of object
boolean ellipseIsClicked;
boolean ellipse2IsClicked;
boolean rectIsClicked;

void setup() {
  size( 1200, 720 );
  systems = new ArrayList<ParticleSystem>();
  //By default its should false, because we want the object to be displayed 
  ellipseIsClicked= false; 
  ellipse2IsClicked = false;
  rectIsClicked = false;
}

//This function create 1 rect and 2 ellipse when program
//is run 
void draw() {
  background( 128 );
  fill(100,200,100,255);
  if (!ellipseIsClicked)ellipse(100, 100, 100, 100 );
  if (!ellipse2IsClicked)ellipse(450, 600, 50, 50 );
  if (!rectIsClicked)rect(1000, 300, 50, 50 );
  for (ParticleSystem ps : systems) {
    ps.run();
  }
}

//This function is called when mouse is pressed on each box or ellipse
//and if user click on each object. it calls the ParticleSystem file and process the particles
void mousePressed() {
  if (Math.sqrt((mouseX-100)*(mouseX-100)+(mouseY-100)*(mouseY-100))<=50)
  {
    ellipseIsClicked = true; 
    ParticleSystem ps = new ParticleSystem(new PVector(mouseX, mouseY));
    systems.add(ps);
  } 

  if (Math.sqrt((mouseX-450)*(mouseX-450)+(mouseY-600)*(mouseY-600))<=20) {
    ellipse2IsClicked = true; 
    ParticleSystem ps = new ParticleSystem(new PVector(mouseX, mouseY));
    systems.add(ps);
  } 
  
  if (mouseX>=1000 && mouseY<=1050 && mouseY>=300 && mouseY<=350) {
    rectIsClicked = true; 
    ParticleSystem ps = new ParticleSystem(new PVector(mouseX, mouseY));
    systems.add(ps);
  } 
}