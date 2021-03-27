class Segment {
  PVector p1;
  PVector p2;
  float length=0;
  boolean hasIntersection = false;

  public Segment(PVector p1, PVector p2) {
    this.p1 = p1;
    this.p2 = p2;
    this.length = dist(p1.x, p1.y, p2.x, p2.y);

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
 void afficherVert() {
    stroke(0, 255, 0);
    line(p1.x, p1.y, p2.x, p2.y);
            
 
}
  String toString(){
  return p1.toString()+" "+p2.toString();
  }
}
