//fonction qui affiche un nombre donnee en parametre de segments

void randomSegments(int nombre){
  int buffer = 20; //ce buffer permet de laisser un peu d'espace sur les contours de la fenetre pour mieux voir
  
  for ( int i = 0 ; i < nombre ; i ++ ){
    float randomX1, randomY1, randomX2, randomY2;
    randomX1 = random(buffer, width-buffer);
    randomX2 = random(buffer, width-buffer);
    randomY1 = random(buffer, height-buffer);
    randomY2 = random(buffer, height-buffer);
    
    PVector p1 = new PVector(randomX1, randomY1);
    PVector p2 = new PVector(randomX2, randomY2);
    Segment s = new Segment(p1, p2);
    fill(0);
    textSize(20);
    //text(i, randomX1, randomY1);
    segments.add(s);
  }
  
  //for ( Segment s : segments){
  //  s.afficher();
  //}
}
