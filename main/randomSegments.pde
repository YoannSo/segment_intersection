//Project L3 FST Limoges - Algo 4
//Contributors: TAYLOR Matt & SOCHAJ Yoann


//Fonction qui affiche un nombre donnee en parametre de segments

void randomSegments(int nombreSegments, int segmentsType) {
  int gapX = 50;
  int gapY = 50;
  int buffer = 20; //ce buffer permet de laisser un peu d'espace sur les contours de la fenetre pour mieux voir les segments

  for ( int i = 0; i < nombreSegments; i ++ ) {
    float randomX1, randomY1, randomX2, randomY2;

      // //!\\ CREATION DE POINTS RANDOM  //!\\
      
    randomX1 = random(buffer, width-buffer); //on genere des coordonnees aleatoires
    randomY1 = random(buffer, height-buffer);
    
    if (segmentsType == 1) { //si on precise des petits segments on genere les points de cette maniere
      randomY2 = random(randomY1 + 5, randomY1 + gapY ); //ici on met la borne inferieur a randomY1 pour s'assurer que le prochain point sera plus bas dans l'axe Y
      randomX2 = random(randomX1 - gapX, randomX1 + gapX);
    }
    else { //sinon on les genere comme suit
      randomY2 = random(buffer, height-buffer ); //ici on met la borne inferieur a randomY1 pour s'assurer que le prochain point sera plus bas dans l'axe Y
      randomX2 = random(buffer, width-buffer);
    }
    
     PVector p1,p2;
    if (randomY1<randomY2) { // si le points 1 est au dessus <!> attention au coor de processing
       p1 = new PVector(randomX1, randomY1); //on cree 2 vecteurs avec les coordonnees generes au dessus
       p2 = new PVector(randomX2, randomY2);
    }
    else {
       p1 = new PVector(randomX2, randomY2); //on cree 2 vecteurs avec les coordonnees generes au dessus
       p2 = new PVector(randomX1, randomY1);
    }
    
    Segment s = new Segment(p1, p2);
    segments.add(s); //on ajoute le segment a notre ArrayList globale
  }
}
