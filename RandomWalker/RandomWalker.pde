/* Name: Bikram Baral
   Assignment: RandomWalker
*/

Walker bob; //calling walker class

void setup() {
  size(500, 500); //size of frame
  bob = new Walker();
}

void draw() {
  background(#527a7a);
  bob.step(); //calling step function from walker
  bob.render(); //calling render function from walker
}