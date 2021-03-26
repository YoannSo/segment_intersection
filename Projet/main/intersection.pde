//fonction qui test si 2 segments s'intersectent

boolean intersect(Segment s1, Segment s2) {
  float ori1, ori2, ori3, ori4;
  ori1 = orientation(s1.p1, s1.p2, s2.p1);
  ori2 = orientation(s1.p1, s1.p2, s2.p2);
  ori3 = orientation(s2.p1, s2.p2, s1.p1);
  ori4 = orientation(s2.p1, s2.p2, s1.p2);

  //println("ori1 =", ori1);
  //println("ori2 =", ori2);
  //println("ori3 =", ori3);
  //println("ori4 =", ori4);
  //println("...");
  if ( (ori1 != ori2) && (ori3 != ori4) ) {
    return true;
  } else return false;
}
