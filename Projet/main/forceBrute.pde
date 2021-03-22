//fonction qui determine le plus grand segment qui n'intersecte aucun autre segment de maniere "brute force"
void forceBrute(int nbPoints) {
  randomSegments(nbPoints); //on affiche un nombre de segments aleatoires
  ArrayList<Integer> index = new ArrayList<Integer>();
  float distMax = 0;

  for ( int i = 0; i < segments.size(); i ++ ) {
    for ( int j = 0; j < segments.size(); j ++) {
      if (intersect(segments.get(i), segments.get(j))) {
        //println("Segment", i, "and Segment", j, "intersect !");
        if (!index.contains(i)) index.add(i);
      }
    }
  }
  //println("black segments", index);
  int answerIndex = -1;

  for (int k = 0; k < nbPoints; k++ ) {
    if (!index.contains(k)) {

      float distCurr = dist(segments.get(k).p1.x, segments.get(k).p1.y, segments.get(k).p2.x, segments.get(k).p2.y);

      if (distCurr > distMax) { 
        distMax = distCurr;
        answerIndex = k;
      }
    }
  }
  //println("biggest seg that does not intersetct", distMax);
  //println(answerIndex);

  for ( int l = 0; l < nbPoints; l++) {
    if (l == answerIndex) segments.get(l).afficherRouge();
    else segments.get(l).afficherNoir();
  }
  
  if(answerIndex == -1) println("All segments intersect !");
}
