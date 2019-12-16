class Roomba {
  float w = 100;
  float x = (w + (random(width) - w));
  float y = (w + (random(height) - w));
  int v = 2;
  int r = floor(random(8));
  int d = 300;
  float i = 1;
  float j = 1;
  // c acts as a 3 way bool
  int c = 1;

  void angle() {
    //randomise direction using i and j
    i = random(0.5, 1.5);
    j = random(0.5, 1.5);
  }

  void display() {
    //display roomba
    ellipse(x, y, w, w);
  }

  void move() {
    //pick random value from switch statment when initialised
    switch(r) {
      //each case is using vector math to direct the roomba 
      //(could be improved using polar coords and random angles. would reduce extra triggers)
    case 1: 
      {
        x += (v * i);
        y += (v * j);
        break;
      }
    case 2:
      {    
        x += (v * i);
        y -= (v * j);        
        break;
      } 
    case 3:
      {
        x -= (v * i);
        y += (v * j);        
        break;
      }
    case 4:
      {  
        x -= (v * i);
        y -= (v * j);        
        break;
      }
    case 5:
      {
        x += v;        
        break;
      }
    case 6:
      {
        x -= v;        
        break;
      }    
    case 7:
      {
        y += v;        
        break;
      }
    case 0:
      {
        y -= v;        
        break;
      }
    }
  }

  void collide() {
    int q = 0;
    //change direction and play sound if colliding with wall 
    if (x - (w/2) <= 0 &&  y - (w/2) <= 0 ) {
      if (c == 1) {      
        collide1.play();
      } else if ( c == 2) {      
        collide2.play();
      } else {      
        collide3.play();
      };
      angle();
      //pause at the wall to indecate 'turning'
      delay(100);
      //if in the corner go cardinal direction (this is repeated for each corner)
      q = floor(random(3));
      switch(q) {
      case 0:
        {
          r = 5;
          break;
        }
      case 1:
        {
          r = 7;          
          break;
        }
      case 2:
        {
          r = 1;          
          break;
        }
      }
    } else if (x - (w/2) <= 0 &&  y + (w/2) >= height ) {
      if (c == 1) {      
        collide1.play();
      } else if ( c == 2) {      
        collide2.play();
      } else {      
        collide3.play();
      };
      angle();
      delay(d);
      //corner
      q = floor(random(3));
      switch(q) {
      case 0:
        {
          r = 5;          
          break;
        }
      case 1:
        {
          r = 8;          
          break;
        }
      case 2:
        {
          r = 2;          
          break;
        }
      }
    } else if (x + (w/2) >= width &&  y - (w/2) <= 0 ) {
      if (c == 1) {      
        collide1.play();
      } else if ( c == 2) {      
        collide2.play();
      } else {      
        collide3.play();
      };
      angle();
      delay(d);
      //corner
      q = floor(random(3));
      switch(q) {
      case 0:
        {
          r = 6;          
          break;
        }
      case 1:
        {
          r = 7;          
          break;
        }
      case 2:
        {
          r = 2;          
          break;
        }
      }
    } else if (x + (w/2) >= width &&  y + (w/2) >= width ) {
      if (c == 1) {      
        collide1.play();
      } else if ( c == 2) {      
        collide2.play();
      } else {      
        collide3.play();
      };
      angle();
      delay(d);
      //corner
      q = floor(random(3));
      switch(q) {
      case 0:
        {
          r = 6;          
          break;
        }
      case 1:
        {
          r = 0;          
          break;
        }
      case 2:
        {
          r = 4;          
          break;
        }
      }
    } else if (x + (w/2) >= width) {
      if (c == 1) {      
        collide1.play();
      } else if ( c == 2) {      
        collide2.play();
      } else {      
        collide3.play();
      };
      angle();
      delay(d);
      //wall rebound
      q = floor(random(3));
      switch(q) {
      case 0:
        {
          r = 6;          
          break;
        }
      case 1:
        {
          r = 3;          
          break;
        }
      case 2:
        {
          r = 4;          
          break;
        }
      }
    } else if (x - (w/2) <= 0) {
      if (c == 1) {      
        collide1.play();
      } else if ( c == 2) {      
        collide2.play();
      } else {      
        collide3.play();
      };
      angle();
      delay(d);
      //wall rebound
      q = floor(random(3));
      switch(q) {
      case 0:
        {
          r = 5;          
          break;
        }
      case 1:
        {
          r = 1;          
          break;
        }
      case 2:
        {
          r = 2;          
          break;
        }
      }
    } else if (y + (w/2) >= width ) {
      if (c == 1) {      
        collide1.play();
      } else if ( c == 2) {      
        collide2.play();
      } else {      
        collide3.play();
      };
      angle();
      delay(d);
      //wall rebound
      q = floor(random(3));
      switch(q) {
      case 0:
        {
          r = 2;          
          break;
        }
      case 1:
        {
          r = 0;          
          break;
        }
      case 2:
        {
          r = 4;          
          break;
        }
      }
    } else if (x + (w/2) >= width &&  y + (w/2) >= width ) {
      if (c == 1) {      
        collide1.play();
      } else if ( c == 2) {      
        collide2.play();
      } else {      
        collide3.play();
      };
      angle();
      delay(d);
      //wall rebound
      q = floor(random(3));
      switch(q) {
      case 0:
        {
          r = 6;          
          break;
        }
      case 1:
        {
          r = 0;          
          break;
        }
      case 2:
        {
          r = 4;          
          break;
        }
      }
    } else if (y - (w/2) <= 0 ) {
      if (c == 1) {      
        collide1.play();
      } else if ( c == 2) {      
        collide2.play();
      } else {      
        collide3.play();
      };
      angle();
      delay(d);
      //wall rebound
      q = floor(random(3));
      switch(q) {
      case 0:
        {
          r = 6;          
          break;
        }
      case 1:
        {
          r = 1;          
          break;
        }
      case 2:
        {
          r = 3;          
          break;
        }
      }
    }
    //
  }
}
