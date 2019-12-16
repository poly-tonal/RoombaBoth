import processing.sound.*;

// create roomba object and init soundfiles
Roomba r;
SoundFile collide1;
SoundFile collide2;
SoundFile collide3;
int c = 1;
PFont col;
boolean paused;

void setup() {
  //create widow
  size(1000, 1000, P2D);
  background(0);
  //load roomba, sound, font
  r = new Roomba();
  collide1 = new SoundFile(this, "collide1.wav");  
  collide2 = new SoundFile(this, "collide2.wav");
  collide3 = new SoundFile(this, "collide3.wav");
  col = createFont("Arial", 16, true);
  textFont(col, 20);
}

void draw() {
  //draw the border walls and text to window
  fill(255);
  background(0);
  noStroke();
  rect(0, 0, 5, height);
  rect(width - 5, 0, 5, height);
  rect(0, 0, width, 5);
  rect(0, height -5, width, 5);
  r.display();
  r.move();
  r.collide();
  text("Sound: ", 20, 30);
  text(c, 83, 30);
  text("speed: ", width - 90, 30);
  text(r.v, width - 27, 30);

  //pause with space
  if (paused) {
    r.v = 0;
  }
}

void keyPressed() {
  //key inputs to pause and control speed and soundbank
  switch(key) {
  case'1':
    r.c = 1; 
    c = 1;
    break;
  case'2':
    r.c = 2; 
    c = 2;
    break;
  case'3':
    r.c = 3;  
    c = 3;
    break;
  case' ':
    paused = !paused;
    if (!paused) {
      r.v =2;
    }
    break;
  }
  switch(keyCode) {
  case UP:
    r.v++;
    break;
  case DOWN:
    r.v--;
    break;
  }
}
