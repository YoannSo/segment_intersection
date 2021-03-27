//Project L3 FST Limoges - Algo 4
//Contributors: TAYLOR Matt & SOCHAJ Yoann


//global variables
ArrayList<Segment> segments = new ArrayList<Segment>();
ArrayList<Segment> segmentsNotInCollision = new ArrayList<Segment>();
Segment r1=null, r2=null, r3=null;

void setup() {

  int choix = -1;
  int smallSegments = 1; //true = -1 , false = 0, any non-zero value is true
  int choixSegments;
  int nbSegments;
  size(500, 500); //on definit une fenetre de taille 500 x 500
  background(255); //couleur de fond = blanc

  while (choix<0 || choix >4) {

    choix = askInteger("Choisissez un algorithme:\n 1. BrutForce\n 2. SwipeLine\n 3. Divide and Conquer\n 4. Tous\n 0. Exit program" ); //on demande un choix a l'utilisateur
    smallSegments = askInteger("Quel type de segments voulez-vous?\n 1. Petits\n 2. Grands");
    if ((choix<0 || choix >4) || (smallSegments < 1 || smallSegments > 2)) println("Choisissez des options valides"); //si le choix n'est pas valide on lui demande de rechoisir
  }
  if (choix>=1 && choix<5) {
    nbSegments = 100;
    println("Number of segments:", nbSegments, "\n");
    if (smallSegments == 1) choixSegments = 1;
    else choixSegments = 0;
    randomSegments(nbSegments, choixSegments); 
    int start, end;
    if (choix==1 || choix==4) {
      println("************** Brute Force Algorithm STARTING **************");
      start=millis();
      r1 = forceBrute(0, nbSegments);
      end =  millis() - start;
      println("************** Brute Force Algorithm FINISHED **************");
      println("Execution time Brute Froce (ms):", end, "\n");
      segmentsNotInCollision.clear();
    }
    if (choix==2 || choix==4) {
      println("************** Sweep Line Algorithm STARTING **************");
      start=millis();
      r2 = sweepLine();
      end =  millis() - start;
      println("************** Sweep Line Algorithm FINISHED **************");
      println("Execution time SweepLine (ms):", end, "\n");
      segmentsNotInCollision.clear();
    }
    if (choix==3 || choix==4) {
      println("************** Divide & Conquer Algorithm STARTING **************");
      start=millis();
      r3 = startDivideAndConquer(0, nbSegments);
      end =  millis() - start;
      println("************** Divide & Conquer Algorithm FINSIHED **************");
      println("Execution time D&C (ms):", end, "\n");
    }
    if (r2==null && r3==null && r1==null) {
      println("All the segments intersect");
    }
    if (r2!=r3|| r3!=r1 || r1!=r2) {
      println("PROBLEME");
    }
  } else {
    println("Exiting the program"); //on affiche un message pour informer l'utilisateur de la fermeture du programme
    exit();
  }
}

Segment startDivideAndConquer(int start, int end) {
  sortSegments(segments);
  return  divideAndConquer(start, end);
}

void draw() {
  for (Segment s : segments) { //on affiche tous les Segments en noir
    s.afficherNoir();
  }
  if (r1!=null)
    r1.afficherRouge(); //on affiche le bon Segment en rouge
  if (r2!=null)
    r2.afficherRouge();
  if (r3!=null) {
    r3.afficherRouge();
  }
  noLoop(); //on appelle ici noLoop() pour eviter de dessiner les Segments en continu et demander trop de ressources
}
