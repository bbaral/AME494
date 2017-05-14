
class Walker {
  //instance variables - the data for an object
  int x; 
  int y;
  int z;
  //constructor function
  Walker() {
    x = width/2;
    y = height/2;
    z = 20;
  }

  //draw this object
  void render() {
    stroke(#006600);
    fill(#4d0019);
    triangle(x, y, x, x, y, y); //moving object around the frame
  }
  //take one step
  void step() {
    float chance = int(random(4)); //posibility of getting 0,1,2,3
    if (chance < 0) { //if random number get less than 0
      x = x + 1; //move right
    } else if (chance < 1) { //if random number is between 0 and 1
      x = x - 1; //move left
    } else if (chance < 2) { //if random number is between 1 and 2
      y = y - 1; //move up
    } else if (chance < 3) { //if random number is between 2 and 3
      y = y + 1; //move down
    } else { // if random number is greater than 3
      z = z + 1;
    }
    wrap();
  }

  void wrap() {
    if (x < 0) {
      x = x + width;
    } else if (x > width) {
      x = x - width;
    } else if (y < 0) {
      y = y + height;
    } else if ( y > height) {
      y = y - height;
    }
  }
}