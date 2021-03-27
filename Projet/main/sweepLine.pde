//Project L3 FST Limoges - Algo 4
//Contributors: TAYLOR Matt & SOCHAJ Yoann

Segment sweepLine() {
  float lowerY;
  float maxLength = 0;
  ArrayList<Segment> candidates = new ArrayList<Segment>();
  sortSegments(segments); //on trie les segments

  //stroke(255, 0, 0);
  //line(0, segments.get(0).p1.y, width, segments.get(0).p1.y); //trace la premiere ligne de balayage pour mieux comprendre la methode "sweep line"

  int posLine = 0; //la position de la ligne de balayage
  while (posLine <= segments.size()-1) { //tant que la ligne de balayage n'est pas sur le segment le plus bas (le dernier de la liste)
    for (int i = 0; i < segments.size(); i ++) { //on parcourt tous les segments de notre liste triee
      lowerY = segments.get(posLine).p2.y; //on affecte la valeur du point le plus bas (sur l'axe Y) du segment a l'index posLine dans notre liste
      if ((segments.get(i).p1.y < lowerY || segments.get(i).p2.y < lowerY)) { //si le segment est dans l'intervalle Y du segment ou se trouve la ligne de balayage (pas la peine de regarder les intersection s'ils ne sont pas dans l'intervalle car ce n'est pas possible)
        if (intersect(segments.get(posLine), segments.get(i)) && i!= posLine) { //alors on regarde l'intersection de ces segments
          segments.get(i).hasIntersection = true; //on "marque" les segment en mettant leur boolean hasIntersection a vrai
          segments.get(posLine).hasIntersection = true;
          break; //on sort de la boucle (pas besoin d'aller plus loin)
        }
      }
    } 
    if (segments.get(posLine).hasIntersection == false) {
      if (segments.get(posLine).length > maxLength) { //si le segment a une longueur plus grande que maxLength
        if (candidates.size()>0) candidates.remove(0); //si il posssede deja un segment on le supprime
        candidates.add(segments.get(posLine)); //on l'ajoute a notre liste de segments "candidats"
        maxLength = segments.get(posLine).length;
      }
    }
    posLine++; //on increment la position de notre ligne de balayage
  }
  for (Segment s : candidates) s.afficherRouge(); //on affiche en rouge notre seul segment dans notre liste candidats
  if (candidates.size() == 0) { //si il n'y a pas de candidats
    return null; //on retourne un segment nul
  } else return candidates.get(0); //sinon on retourne notre segment unique dans notre ArrayList "candidats"
}
