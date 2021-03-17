class Segment{
  PVector p1;
  PVector p2;
  
  public Segment(PVector p1, PVector p2){
    this.p1 = p1;
    this.p2 = p2;
  }
  
  void afficher(){
    line(p1.x, p1.y, p2.x, p2.y);
    //println("Segment:", p1.x, p1.y, p2.x, p2.y);
  }
  
  void afficherRouge(){
    stroke(255,0,0);
    line(p1.x, p1.y, p2.x, p2.y);
  }
}
