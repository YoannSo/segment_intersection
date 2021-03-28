//Project L3 FST Limoges - Algo 4
//Contributors: TAYLOR Matt & SOCHAJ Yoann 


//Class Segment
class Segment {
  PVector p1;
  PVector p2;
  float length = 0; //attribut de longueur du Segment
  boolean hasIntersection = false; //attribut de type boolean pour savoir si le Segment intersecte d'autres Segments
  
  public Segment(PVector p1, PVector p2) { // constructeur
    this.p1 = p1;
    this.p2 = p2;
    this.length = dist(p1.x, p1.y, p2.x, p2.y);//calcul de distance
  }
  //Methode qui affiche le segment en noir
  void afficherNoir() {
    stroke(0);
    line(p1.x, p1.y, p2.x, p2.y);
  }

  //Methode qui affiche le segment en rouge
  void afficherRouge() {
    stroke(255, 0, 0);
    line(p1.x, p1.y, p2.x, p2.y);
  }

  //Methode qui affiche le segment en vert 
  void afficherVert() {
    stroke(0, 255, 0);
    line(p1.x, p1.y, p2.x, p2.y);
  }

  String toString() { // methode to string plus simple pour afficher des resultats à l'utilisateur 
    return "\n-Premier point:"+p1.toString()+"\n-Deuxieme Point"+p2.toString()+"\n-Longueur:"+length;
  }
}
