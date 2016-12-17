int scl = 20;
boolean running = false;
ArrayList<ArrayList<Cell>> cells = new ArrayList<ArrayList<Cell>>();
ArrayList<Cell> killList = new ArrayList<Cell>();
ArrayList<Cell> reviveList = new ArrayList<Cell>();

void setup() {

  background(100);
  size(600, 600);

  for (int y=0; y<height/scl; ++y) {
    ArrayList<Cell> newCs = new ArrayList<Cell>();
    for (int x=0; x<width/scl; ++x) {
      Cell c = new Cell(y, x);
      c.show();
      newCs.add(c);
      if (this.running == true) {
        c.check();
      }
    }
    cells.add(newCs);
  }
}  

void draw() {
  if (this.running == true) {
    frameRate(1);
  } else {
    frameRate(60);
  }
  killList.clear();
  reviveList.clear();
  for (int y=0; y<height/scl; ++y) {
    for (int x=0; x<width/scl; ++x) {
      Cell c = cells.get(x).get(y);
      c.show();
      if (this.running == true) {
        c.check();
      }
    }
  }
  for (Cell c : killList) {
    c.alive = false;
  }
  for (Cell c : reviveList) {
    c.alive = true;
  }
}

void keyPressed() {
  if (key == ENTER) {
    if (this.running == true) {
      this.running = false;
      println("Stopping..");
    } else {
      this.running = true;
      println("Starting...");
    }
  } else if (key == BACKSPACE) {
    for (int y=0; y<height/scl; ++y) {
      for (int x=0; x<width/scl; ++x) {
        Cell c = cells.get(x).get(y);
        c.alive = false;
      }
    }
  }
}


void mouseClicked() {

  int pX = floor(mouseX / scl);
  int pY = floor(mouseY / scl);
  Cell cell = cells.get(pX).get(pY);




  if (cell.alive == true) {
    cell.alive = false;
  } else {
    cell.alive = true;
  }
  println("(" + pX + ", " + pY + ") , " + cell.alive + ", Neighbors: " + cell.getBorders() + " type: " + cell.getType());
}