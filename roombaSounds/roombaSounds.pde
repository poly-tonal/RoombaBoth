import processing.sound.*;

//init sounds
SoundFile on1;
SoundFile on2;
SoundFile on3;
SoundFile batt1;
SoundFile batt2;
SoundFile batt3;
SoundFile stuck1;
SoundFile stuck2;
SoundFile stuck3;
SoundFile move1;
SoundFile move2;
SoundFile move3;
SoundFile fin1;
SoundFile fin2;
SoundFile fin3;

//init images
PImage roombaON;
PImage roombaOFF;
PImage roombaBAT;
PImage roombaSTUCK;
PImage count0;
PImage count1;
PImage count2;
PImage count3;
PImage count4;
PImage count5;

//init ints
int circleX, circleY;
int circleSize = 45;
int count = 0;
int on = 0;
int samples = 1;
int time = 0;

//init bools
boolean stuck = false;
boolean move = false;
boolean timer = false;
boolean finished = false;
boolean help = false;

void setup() {
  //create window and load in images and soundfiles
  size(500, 500);
  background(255);
  roombaON = loadImage("roombaON.png");
  roombaOFF = loadImage("roombaOFF.png");
  roombaBAT = loadImage("roombaBAT.png");
  roombaSTUCK = loadImage("roombaSTUCK.png");
  count0 = loadImage("count0.png");
  count1 = loadImage("count1.png");
  count2 = loadImage("count2.png");
  count3 = loadImage("count3.png");
  count4 = loadImage("count4.png");
  count5 = loadImage("count5.png");

  on1 = new SoundFile(this, "on_1.wav");
  on2 = new SoundFile(this, "on_2.wav");
  on3 = new SoundFile(this, "on_3.wav");
  batt1 = new SoundFile(this, "low_bat1.wav");
  batt2 = new SoundFile(this, "low_bat2.wav");
  batt3 = new SoundFile(this, "low_bat3.wav");
  stuck1 = new SoundFile(this, "stuck1.wav");
  stuck2 = new SoundFile(this, "stuck2.wav");
  stuck3 = new SoundFile(this, "stuck3.wav");
  move1 = new SoundFile(this, "need_moving1.wav");
  move2 = new SoundFile(this, "need_moving2.wav");
  move3 = new SoundFile(this, "need_moving3.wav");
  fin1 = new SoundFile(this, "finished1_2.wav");
  fin2 = new SoundFile(this, "finished2_2.wav");
  fin3 = new SoundFile(this, "finished3_2.wav");
}

void draw() {
  //help bool changes between standard view and help screen
  if (!help) {
    //basic window setup and text
    background(255);
    fill(0);
    textAlign(LEFT, TOP);
    textSize(16);
    text("sound: ", 10, 5);
    text(samples, 65, 5);
    text("press 'h' for help", 10, height - 25);

    //countdown timer
    if (timer) {
      time++;
    } else {
      time = 0;
    }

    //resizing images to fit widow
    roombaON.resize(500, 500);  
    roombaOFF.resize(500, 500);
    roombaBAT.resize(500, 500);
    roombaSTUCK.resize(500, 500);
    count0.resize(500, 500);
    count1.resize(500, 500);
    count2.resize(500, 500);
    count3.resize(500, 500);
    count4.resize(500, 500);
    count5.resize(500, 500);

    //switch image based on "on" 3 way bool
    if (on == 0) {
      image(roombaOFF, 0, 0);
    } else if (on == 1) {
      image(roombaON, 0, 0);
    } else if (on == 2) {

      //flashes red and green clean button
      if (count < 30) {
        image(roombaBAT, 0, 0);
        count++;
      } else {
        image(roombaON, 0, 0);
        count++;
        if (count == 60) {
          count = 0;
        }
      }
    }
    //displays timer images
    if (timer) {
      if (time < 60) {
        image(count5, 0, 0);
      } else if (time < 120) {
        image(count4, 0, 0);
      } else if (time < 180) {
        image(count3, 0, 0);
      } else if (time < 240) {
        image(count2, 0, 0);
      } else if (time<300) {
        image(count1, 0, 0);
      } else if (time == 301) {
        finished = true;
      } else {
        image(count0, 0, 0);
      }
    }

    //change button colour
    if (!stuck) {
      fill(0);
      rect((width - 90), 5, 60, 30);  
      textAlign(LEFT, TOP);
      textSize(16);
      fill(255);
      text("stuck", width - 80, 10);
    } else if (stuck && on == 1) {
      image(roombaSTUCK, 0, 0);
      fill(255, 0, 0);
      rect((width - 90), 5, 60, 30);  
      textAlign(LEFT, TOP);
      textSize(16);
      fill(0);
      text("stuck", width - 80, 10);
    }

    if (!move) {
      fill(0);
      rect((width - 90), 45, 60, 30);
      textAlign(LEFT, TOP);
      textSize(16);
      fill(255);
      text("move", width - 80, 50);
    } else if (move && on == 1) {
      fill(255, 0, 0);
      rect((width - 90), 45, 60, 30);
      textAlign(LEFT, TOP);
      textSize(16);
      fill(0);
      text("move", width - 80, 50);
    }

    if (!timer) {
      fill(0);
      rect(10, 45, 60, 30);  
      textAlign(LEFT, TOP);
      textSize(16);
      fill(255);
      text("GO!", 20, 50);
    } else if (timer && on == 1) {
      fill(255, 0, 0);
      rect(10, 45, 60, 30);  
      textAlign(LEFT, TOP);
      textSize(16);
      fill(0);
      text("GO!", 20, 50);
    }
  } else {
    //display help screen
    background(255);
    fill(0);
    text("help! (close with 'h')", 25, 25);
    text("press 'o' or the 'clean' button to turn on.", 25, 55);
    text("press space for low battery.", 25, 80);
    text("press 1, 2, or 3 to change soundbank.", 25, 105);
  }
}

void mousePressed() {
  //check on button press
  if (circleOver((width/2) -2, (width/2) + 9, 45) && on == 1) {
    on = 0;
    stuck = false;
    move = false;
    timer = false;
    time = 0;
  } else if (circleOver((width/2) -2, (width/2) + 9, 45) && on == 0) {
    on = 1;
    if (samples ==1) {
      on1.play();
    } else if (samples == 2) {
      on2.play();
    } else {
      on3.play();
    }
  }
  //check sound button press
  if (boxOver(width-90, 5, width - 30, 35)  && on == 1) {
    stuck = !stuck;
    move = false;
    timer = false;
    if (stuck) {
      if (samples ==1) {
        stuck1.play();
      } else if (samples == 2) {
        stuck2.play();
      } else {
        stuck3.play();
      }
    }
  }
  if (boxOver(width-90, 45, width - 30, 75) && on == 1) {
    move = !move;
    stuck = false;
    timer = false;
    if (move) {    
      if (samples == 1) {
        move1.play();
      } else if (samples == 2) {
        move2.play();
      } else {
        move3.play();
      }
    }
  } else if (boxOver(10, 45, 70, 75) && on == 1) {
    timer = !timer;
    if (timer) {
      playFin();
    }
    stuck = false;
    move = false;
  }
}

void keyPressed() {
  //check key pressed
  switch(key) {
  case' ': 
    //low battery sounds loop instead of playing once
    if (on < 2) {
      stuck = false;
      move = false;
      timer = false;
      on = 2;
      if (samples == 1) {
        batt1.loop();
      } else if (samples == 2) {
        batt2.loop();
      } else {
        batt3.loop();
      }
    } else {
      on = 0;
      count = 0;
      timer = false;
      time = 0;
      batt1.stop();
      batt2.stop();
      batt3.stop();
    }
    break;
    //1, 2, and 3 choose samplebank
  case'1': 
    samples = 1; 
    break;
  case'2': 
    samples = 2; 
    break;
  case'3': 
    samples = 3; 
    break;
  case 'o':
    //turns on, when turning off turns off any sounds
    if (on == 0) {
      on = 1;
      if (samples ==1) {
        on1.play();
      } else if (samples == 2) {
        on2.play();
      } else {
        on3.play();
      }
      break;
    } else if (on == 1) {
      on = 0;
      stuck = false;
      move = false;
      timer = false;
      help = false;
      break;
    }
  case 'h':
    //opens help screen
    help = !help;
    break;
  }
}

//check mouse over for circle (from Examples/Topics/GUI/Button)
boolean circleOver(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}

//check mouse over for rectangle
boolean boxOver(int x1, int y1, int x2, int y2) {
  if (mouseX > x1 && mouseX < x2 && mouseY > y1 && mouseY < y2) {
    return true;
  } else {
    return false;
  }
}

//sepperate function because was called sepperate
void playFin() {
  if (samples == 1) {
    fin1.play();
  } else if (samples == 2) {
    fin2.play();
  } else {
    fin3.play();
  }
}
