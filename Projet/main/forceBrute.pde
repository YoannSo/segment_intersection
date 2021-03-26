//fonction qui determine le plus grand segment qui n'intersecte aucun autre segment de maniere "brute force"

Segment forceBrute(int start, int end) {
  Segment maximum=null;
  boolean intersection ;

  for ( int i = start; i < end; i ++ ) {
    intersection=false;
    for ( int j = start; j < end; j ++) {
      if (intersect(segments.get(i), segments.get(j))) {
        //println("Segment", i, "and Segment", j, "intersect !");
        intersection=true;
      }
    }
    if (!intersection)
      segmentsNotInCollision.add(segments.get(i));
    if (maximum==null) {
      maximum=segments.get(i);
    } else if (maximum.getLength()<segments.get(i).getLength()) {
      maximum=segments.get(i);
    }
  }
  return maximum;
}
