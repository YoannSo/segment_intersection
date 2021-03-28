//Project L3 FST Limoges - Algo 4
//Contributors: TAYLOR Matt & SOCHAJ Yoann


//Fonction qui test si 2 segments s'intersectent
boolean intersect(Segment s1, Segment s2) { 

  float ori1, ori2, ori3, ori4;

  ori1 = orientation(s1.p1, s1.p2, s2.p1);
  ori2 = orientation(s1.p1, s1.p2, s2.p2);
  ori3 = orientation(s2.p1, s2.p2, s1.p1);
  ori4 = orientation(s2.p1, s2.p2, s1.p2);

  if ( (ori1 != ori2) && (ori3 != ori4) ) {// on verifie que les orientations ori1 et ori2 sont differentes ainsi que ori3 et ori4
    return true; // si c'est le cas alors les segments s'intersectent et on retourne true
  } else return false; // sinon on retourne false
}
