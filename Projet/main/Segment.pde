class Segment {
  PVector p1;
  PVector p2;
  boolean hasIntersection = false;

  public Segment(PVector p1, PVector p2) {
    this.p1 = p1;
    this.p2 = p2;
  }

  void afficherNoir() {
    stroke(0);
    line(p1.x, p1.y, p2.x, p2.y);
    //println("Segment:", p1.x, p1.y, p2.x, p2.y);
  }

  void afficherRouge() {
    stroke(255, 0, 0);
    line(p1.x, p1.y, p2.x, p2.y);
  }

  float getLength() {
    float length = dist(p1.x, p1.y, p2.x, p2.y);
    return length;
  }
}
