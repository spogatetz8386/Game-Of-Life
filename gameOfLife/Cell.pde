class Cell {
  int x, y;
  boolean alive = false;
  Cell(int x, int y) {
    this.x = x;
    this.y = y;
  }

  void show() {
    if (this.alive == true) {
      fill(0, 200, 0);
      rect(x * scl, y * scl, scl, scl);
    } else {

      fill(100);
      rect(x * scl, y * scl, scl, scl);
    }
  }

  String getType() {
    if (this.x == 0 || this.y == 0 || this.x == ((width / scl) - 1) || this.y == ((height / scl) - 1)) {
      //All border cells
      if (this.x == 0 && this.y == 0) {
        return "topLeft";
      } else if (this.x == 0 && this.y == (height / scl) - 1) {
        return "bottomLeft";
      } else if (this.x == 0) {
        return "left";
      } else if (this.x == (width / scl) - 1 && this.y == 0) {
        return "topRight";
      } else if (this.x == (width / scl) - 1 && this.y == (height / scl) - 1) {
        return "bottomRight";
      } else if (this.x == (width / scl) - 1) {
        return "right";
      } else if (this.y == (height / scl) - 1) {
        return "bottom";
      } else if (this.y == 0) {
        return "top";
      }
    } else {
      return "inside";
    }
    return "";
  }


  int getBorders() {
    int total = 0;
    String type = this.getType();
    if (type != "inside") {
      //All border cells
      if (type == "left") {
        for (int x = 0; x < 2; ++x) {
          for (int y = -1; y < 2; ++y) {
            if ((cells.get(this.x + x).get(this.y + y).alive == true)) {
              if (cells.get(this.x + x).get(this.y + y) != this) {
                total = total + 1;
              }
            }
          }
        }
      } else if (type == "right") {
        for (int x = -1; x < 1; ++x) {
          for (int y = -1; y < 2; ++y) {
            if ((cells.get(this.x + x).get(this.y + y).alive == true)) {
              if (cells.get(this.x + x).get(this.y + y) != this) {
                total = total + 1;
              }
            }
          }
        }
      } else if (type == "top") {
        for (int x = -1; x < 2; ++x) {
          for (int y = 0; y < 2; ++y) {
            if ((cells.get(this.x + x).get(this.y + y).alive == true)) {
              if (cells.get(this.x + x).get(this.y + y) != this) {
                total = total + 1;
              }
            }
          }
        }
      } else if (type == "bottom") {
        for (int x = -1; x < 2; ++x) {
          for (int y = -1; y < 1; ++y) {
            if ((cells.get(this.x + x).get(this.y + y).alive == true)) {
              if (cells.get(this.x + x).get(this.y + y) != this) {
                total = total + 1;
              }
            }
          }
        }
      } else if (type == "topLeft") {
        for (int x = 0; x < 2; ++x) {
          for (int y = 0; y < 2; ++y) {
            if ((cells.get(this.x + x).get(this.y + y).alive == true)) {
              if (cells.get(this.x + x).get(this.y + y) != this) {
                total = total + 1;
              }
            }
          }
        }
      } else if (type == "bottomLeft") {
        for (int x = 0; x < 2; ++x) {
          for (int y = -1; y < 1; ++y) {
            if ((cells.get(this.x + x).get(this.y + y).alive == true)) {
              if (cells.get(this.x + x).get(this.y + y) != this) {
                total = total + 1;
              }
            }
          }
        }
      } else if (type == "topRight") {
        for (int x = -1; x < 1; ++x) {
          for (int y = 0; y < 2; ++y) {
            if ((cells.get(this.x + x).get(this.y + y).alive == true)) {
              if (cells.get(this.x + x).get(this.y + y) != this) {
                total = total + 1;
              }
            }
          }
        }
      } else if (type == "bottomRight") {
        for (int x = -1; x < 1; ++x) {
          for (int y = -1; y < 1; ++y) {
            if ((cells.get(this.x + x).get(this.y + y).alive == true)) {
              if (cells.get(this.x + x).get(this.y + y) != this) {
                total = total + 1;
              }
            }
          }
        }
      }
    } else {
      for (int x = -1; x < 2; ++x) {
        for (int y = -1; y < 2; ++y) {
          if ((cells.get(this.x + x).get(this.y + y).alive == true)) {
            if (cells.get(this.x + x).get(this.y + y) != this) {
              total = total + 1;
            }
          }
        }
      }
    }
    return total;
  }
  void check() {
    if (this.alive == true) {
      if (this.getBorders() != 2 && this.getBorders() != 3) {
        killList.add(this);
      }
    } else {
      if (this.getBorders() == 3) {
        reviveList.add(this);
      }
    }
  }
}