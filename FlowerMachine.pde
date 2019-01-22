float vineWeight = 7;
int totalBudFrames = 20;

ArrayList<FlowerBud> buds;
Point2D lastMousePosition;

// 
public void setup() {
  
  size(600, 600);
  
  background(0, 155, 255);
  
  drawDirt();
  
  buds = new ArrayList();
  lastMousePosition = null;
}


//
public void draw() {
  
  if(mousePressed && lastMousePosition != null) {
    stroke(0, 155, 0);
    strokeWeight(vineWeight);
    
    float newMouseX = mouseX;
    float newMouseY = mouseY;
    line(lastMousePosition.x, lastMousePosition.y, newMouseX, newMouseY);
    lastMousePosition = new Point2D(newMouseX, newMouseY);
  }
  
  drawFlowers();
}


//
public void drawFlowers() {
  for(int i = 0; i < buds.size(); i++) {
    if(buds.get(i).framesDrawn < totalBudFrames) {
      buds.get(i).drawFrame();
    } else {
      buds.remove(i);
      i--;
    }
  }
}


//
public void mousePressed() {
  float pressX = mouseX;
  float pressY = mouseY;
  
  if(pressY >= 500) {
    lastMousePosition = new Point2D(pressX, pressY);
  }
}


//
public void mouseReleased() {
  if(lastMousePosition != null) {
    buds.add(new FlowerBud(lastMousePosition));
    lastMousePosition = null;
  }
}




//
class FlowerBud {
  Point2D origin;
  int framesDrawn;
  
  FlowerBud(Point2D origin) {
    this.origin = origin;
    this.framesDrawn = 0;
  }
  
  public void drawFrame() {
    
    if(framesDrawn < totalBudFrames) {
      
      // Draw petals emerging.
      noStroke();
      fill(255);
      float petalRadius = vineWeight + framesDrawn;
      ellipse(origin.x + framesDrawn, origin.y, petalRadius, petalRadius);
      ellipse(origin.x - framesDrawn, origin.y, petalRadius, petalRadius);
      ellipse(origin.x, origin.y + framesDrawn, petalRadius, petalRadius);
      ellipse(origin.x, origin.y - framesDrawn, petalRadius, petalRadius);
      
      // Draw middle of flower.
      noStroke();
      fill(255, 0, 255);
      ellipse(origin.x, origin.y, vineWeight * 2, vineWeight * 2);
      
      framesDrawn++;
    }
  }
}


//
public void drawDirt() {
  fill(160, 80, 0);
  noStroke();
  rect(0, 500, 600, 600);
  /*
  fill(100, 50, 0);
  for(int i = 0; i < 600; i++) {
    for(int j = 500; j < 600; j++) {
      if(random(100) < 10) {
        rect(i, j, 1, 1);
      }
    }
  }
  */
}


//
class Point2D {
  float x, y;
  
  Point2D(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  public float distance(Point2D other) {
    Math.sqrt(Math.pow(other.x - this.x, 2) + Math.pow(other.y - this.y, 2));
    return 0;
  }
}