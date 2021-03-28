//Project L3 FST Limoges - Algo 4
//Contributors: TAYLOR Matt & SOCHAJ Yoann


//Fonction qui determine le plus grand segment qui n'intersecte aucun autre segment de maniere "Divide & Conquer"

ArrayList<Segment> divideAndConquer(int start, int end) {
    ArrayList<Segment> segmentNotInCollision=new ArrayList<Segment>();// liste qui va nous servir pour les segments a save
 
      // //!\\ CONDITIONS D'ARRET  //!\\
  
  if ((end - start) <= 10) { // Si il y a 10 ou moins segments alors il faut faire le brutForce
    segmentNotInCollision= brutForceDivideNConquer(start, end); // on return le resultat du brut force donc les segment sans collision d'un groupe de 10 segment
    return segmentNotInCollision;
  
}  

      // //!\\ APPEL RECURSIF  //!\\

  int mid=(start+end)/2; // on prends le milieu de ce qu'on a (vu que c'est recursif ca va etre un milieu different a chaque appel)

  ArrayList<Segment> segmentNotCollisionsHaut=  divideAndConquer(start, mid); // on fait un appel recursif sur la partie du haut 
  ArrayList<Segment> segmentNotCollisionsBas=  divideAndConquer(mid, end); // et celle de bas et cela va nous servir a subdiviser l'ecran pour limiter les tests

      // //!\\ TEST DE COLLISIONS SUR L'AUTRE PARTIE  //!\\
    
  for (int i=0; i<segmentNotCollisionsHaut.size(); i++) { // double boucle for qui va regarde si les resultat du haut sont en collisions avec les segments du bas 
         Segment temp=segmentNotCollisionsHaut.get(i);
    for (int j=mid; j<segments.size(); j++) { // on doit donc faire les test sur segment avec les bon indices 
      if (intersect(temp, segments.get(j))) {// si il y a une collisions 
        temp.hasIntersection=true; //on set l'attribut a true
        break; // on peut break car plus besoin de tester le segment courant
      }
    }
    if (!temp.hasIntersection) { // si on a pas de collisions avec le segment 
      segmentNotInCollision.add(temp); // alors on l'ajoute a la liste finale 
    }
  }
  
  for (int i=0; i<segmentNotCollisionsBas.size(); i++) {//pareil que la boucle d'avant mais on test si les segments resultat du bas on une intersection avec tous les segments du haut 
     Segment temp=segmentNotCollisionsBas.get(i);
    
    for (int j=0; j<mid; j++) {
      if (intersect(temp, segments.get(j))) {// si il y a une collisions 
        temp.hasIntersection=true; 
        break; // on peut break car plus besoin de tester le segment courant
      }
    }
    if (!temp.hasIntersection) {
      segmentNotInCollision.add(temp);
    }
  }

  return segmentNotInCollision; // on return la list on va tester le max dans une autre fonction
}

Segment startDivideAndConquer(int start, int end) {//Fonction qui va init le divideAndConquer
  
           // //!\\ Lancement divideAndConquer  //!\\
       
  ArrayList<Segment> result = divideAndConquer(start, end); // on recupere les segments restant apres les differents test c'est a dire ceux sans intersection pour ensuite envoyer que le max
  
  
      // //!\\ RETOURNER LE BON SEGMENT  //!\\

  if (result.size()!=0) { // si on a des segments sans collisions 
    if (result.size()==0) // si il reste plus aucun segment on return null
      return null;
      
    else if (result.size()==1) //si il en reste 1 on return ce segment 
      return result.get(0);
      
    else { // si il en reste plus alors il faut prendre le plus grand 
      double maxDist=result.get(0).length;  // on prends le taille du premier segment et on setup un index a 0 (l'indice du premier segment)
      int index=0;
      
      for (int i=1; i<result.size(); i++) { // on commence une boucle sur les segments sans collisions en commencant a 1
        if (maxDist<result.get(i).length) { // si on trouve un segment plus grand alors on change maxDist et on change l'index
          maxDist=result.get(i).length;
          index=i;
        }
      }
      
      return result.get(index);// a la fin on return on segment avec l'index approprier
    }
  }
  return null;
}
