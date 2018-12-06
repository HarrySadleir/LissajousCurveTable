class Curve {
  ArrayList<PVector> path;
  PVector current;

  Curve() {
    path = new ArrayList<PVector>();
    current = new PVector();
  }

  void setX(float x) {
    current.x = x;
  }

  void setY(float y) {
    current.y = y;
  }
  
  void reset() {
    path.clear(); 
  }

  void addPoint() {
    path.add(current);
  }

  void show() {
    stroke(255);
    strokeWeight(1);
    noFill();
    beginShape();
    for (PVector v : path) {
      vertex(v.x, v.y);
    }
    endShape();

    strokeWeight(w/50);
    point(current.x, current.y);

    
    if (path.get(0).equals(current) && path.size()>1) {
      path.remove(0);
    }

    current = new PVector();
  }
}