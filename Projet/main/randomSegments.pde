//fonction qui affiche un nombre donnee en parametre de segments

void randomSegments(int nombre) {
  int gapX = 50;
  int gapY = 50;
  int buffer = 20; //ce buffer permet de laisser un peu d'espace sur les contours de la fenetre pour mieux voir

  for ( int i = 0; i < nombre; i ++ ) {
    float randomX1, randomY1, randomX2, randomY2;
    randomX1 = random(buffer, width-buffer);
    randomY1 = random(buffer, height-buffer);
    //randomY2 = random(randomY1 + 5, randomY1 + gapY ); //ici on met la borne inferieur a randomY1 pour s'assurer que le prochain point sera plus bas dans l'axe Y
    //randomX2 = random(randomX1 - gapX, randomX1 + gapX);
    randomY2 = random(randomY1 + buffer, height-buffer ); //ici on met la borne inferieur a randomY1 pour s'assurer que le prochain point sera plus bas dans l'axe Y
    randomX2 = random(buffer, width-buffer);

    PVector p1 = new PVector(randomX1, randomY1);
    PVector p2 = new PVector(randomX2, randomY2);
    Segment s = new Segment(p1, p2);
    fill(0);
    textSize(20);
    //text(i, randomX1, randomY1);
    segments.add(s);
  }
}
