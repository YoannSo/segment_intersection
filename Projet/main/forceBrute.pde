//Project L3 FST Limoges - Algo 4
//Contributors: TAYLOR Matt & SOCHAJ Yoann


//Fonction (aucune optimisation expres) qui determine le plus grand segment qui n'intersecte aucun autre segment de maniere "brute force"

Segment forceBrute(int start, int end) {
  Segment maximum=null; // le segment a return
  boolean intersection ; //boolean qui va nous indiquer si il y aintersection 

  for ( int i = start; i < end; i ++ ) { //double boucle for pour tester les segment un a un sur tous les segments
    intersection=false; // on met intersection a false
    for ( int j = start; j < end; j ++) {
      if (intersect(segments.get(i), segments.get(j))) { // si il y a intersection alors on met intersection a true
        intersection=true;
      }
    }
    if (!intersection) { // si on a pas eu d'intersection 
      if (maximum==null) { // si max est null alors on l'init
        maximum=segments.get(i);
      } else if (maximum.length<segments.get(i).length) { // si la taille est plus grande que max actuel on le change
        maximum=segments.get(i);
      }
    }
  }
  return maximum;
}
