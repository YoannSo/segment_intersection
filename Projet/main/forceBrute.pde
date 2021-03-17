//fonction qui determine le plus grand segment qui n'intersecte aucun autre segment de maniere "brute force"
void forceBrute(int nbPoints) {
  randomSegments(nbPoints); //on affiche un nombre de segments aleatoires
  ArrayList<Integer> index = new ArrayList<Integer>();
  float distMin = width + height;

  for ( int i = 0; i < segments.size(); i ++ ) {
    for ( int j = 0; j < segments.size(); j ++) {
      if (intersect(segments.get(i), segments.get(j))) {
        println("Segment", i, "and Segment", j, "intersect !");
        if (!index.contains(i)) index.add(i);
      }
    }
  }
  println(index);
  for (Integer i : index) {
    for (int k = 0; k < nbPoints; k++ ) {
      if (!index.contains(k)) {
        segments.get(k).afficherRouge();
        
        float distCurr = dist(segments.get(k).p1.x, segments.get(k).p1.y, segments.get(k).p2.x, segments.get(k).p2.y);
        if(distCurr < distMin) distMin = distCurr;
      }
    }
  }
  println(distMin);
}
