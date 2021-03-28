//Project L3 FST Limoges - Algo 4
//Contributors: TAYLOR Matt & SOCHAJ Yoann


//Fonction qui retourne une liste de tous les segments qui ne sont pas en collision (pour DivideAndConquer)

ArrayList<Segment> brutForceDivideNConquer(int start, int end) { // pareil que BrutForce avec un break pour opti un peu, et cette fois si on va renvoyer une liste des segments sans intersection, cela va servir au D&C
  ArrayList<Segment> segmentsNotInCollision = new ArrayList<Segment>(); // list de tous les segments qu'on va retourner
  boolean intersection ;

  for ( int i = start; i < end; i ++ ) {
    intersection=false;
    for ( int j = start; j < end; j ++) {
      if (intersect(segments.get(i), segments.get(j))) {
        intersection=true;
        break;
      }
    }
    if (!intersection)  // sauf que sur ce programme on ajoute le segment a une liste qu'on retourne, on ne regarde pas le max car on a besoin d'avoir tous les segments pour le D&C
      segmentsNotInCollision.add(segments.get(i));
  }
  return segmentsNotInCollision; // on return la list de segment
}
