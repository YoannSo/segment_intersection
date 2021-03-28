//Project L3 FST Limoges - Algo 4
//Contributors: TAYLOR Matt & SOCHAJ Yoann


//global variables
ArrayList<Segment> segments = new ArrayList<Segment>(); // list de tous les segments
Segment r1=null, r2=null, r3=null;//Les resultats des differents algo

void setup() {

    // //!\\ Variable utile/setup  //!\\
  
  int choix = -1;// on setup les valeurs a -1 pour rentrer dans les boucles
  int segmentsType = -1; //true = -1 , false = 0, any non-zero value is true
  int nbSegments=-1;
  size(500, 500); //on definit une fenetre de taille 500 x 500
  background(255); //couleur de fond = blanc

     // //!\\ Interface pour l'utilisateur  //!\\

  while ((choix<0 || choix >4)||(segmentsType<1 || segmentsType>2) ) {
    choix = askInteger("Choisissez un algorithme:\n 1. BrutForce\n 2. SwipeLine\n 3. Divide and Conquer\n 4. Tous\n 0. Exit program" ); //on demande un choix a l'utilisateur
    if (choix==0)
      break;
    segmentsType = askInteger("Quel type de segments voulez-vous?\n 1. Petits\n 2. FullRandom");
    if ((choix<0 || choix >4) || (segmentsType <   1 || segmentsType > 2)) println("Choisissez des options valides"); //si le choix n'est pas valide on lui demande de rechoisir
  }
  
  if (choix>0 && choix<5) {
    while (nbSegments<0 ||nbSegments >20000000) { // while qui va demander a l'utilisateur le nombre de segment (mais il faut que cela soit valide) pas plus grand que 20M
      nbSegments = askInteger("Choisissez le nombre de segments ou 0 pour exit" );

      if (nbSegments>20000000) {
        println("Veillez choisir un nombre plus petit de 20000000");
      } else if (nbSegments<1) {
        println("Veillez choisir un nombre strictement plus grand de -1");
      }
    }
    
    int start, end; //int pour le temps
    
    
    // //!\\ GENERATIONS DES SEGMENTS  //!\\
   
    println("************** Segment generation STARTING **************"); // debut generation des points
    println("Number of segments:", nbSegments);
    start=millis();
    randomSegments(nbSegments, segmentsType);  //generation des segments en fonction du type de segments
    end =  millis() - start;
    println("************** Segments generation FINSIHED **************");
    println("Execution time Segment generation (ms):", end, "\n"); 


    int startTri=0, endTri=0; //var pour avoir le temps de tri
    
    
     // //!\\ BrutForce  //!\\
    
    if (choix==1 || choix==4) { //si le choix==1 ou 4 alors on fait le brut Force
      println("************** Brute Force Algorithm STARTING **************");
      start=millis();//start le timer
      if (nbSegments>50000) { //Pour le brut force si on a plus de 50000 segments pour eviter de trop attendre on ne lance pas l'algo
        println("Nombre de segments trop elever pour le brut force");
      } else {
        r1 = forceBrute(0, nbSegments); //si on a un nombre plus petit de 50000 on fait l'algo (on met un debut et une fin pour nous aider pour la fonction recursive)
      }
      end =  millis() - start; // on peut alors recuperer le temps
      println("************** Brute Force Algorithm FINISHED **************");
      println("Execution time Brute Froce (ms):", end, "\n"); // pour ensuite l'afficher
      //segmentsNotInCollision.clear(); // on clear la liste des Segment qui ne sont pas en collision
    }
    
     // //!\\ Tri si besoin  //!\\
    
    if (choix>1&& choix <5) { // en fonction de choix on doit trier
      startTri=millis();
      sortSegments(segments); //on trie les segmentss
      endTri =  millis() - startTri; // on recupere le temps du sort
    }
    
     // //!\\ SweepLine  //!\\
    
    if (choix==2 || choix==4) {//pareil que brutForce mais on prends le temps du tri
      println("************** Sweep Line Algorithm STARTING **************");
      start=millis();
      r2 = sweepLine();
      end =  millis() - start;
      println("************** Sweep Line Algorithm FINISHED **************");
      println("Total execution time SweepLine (ms):", end+endTri, "  Sort time (ms):", endTri, "\n");
      //segmentsNotInCollision.clear();
    }
    
     // //!\\ Divide And Conquer  //!\\
    
    if (choix==3 || choix==4) {//pareil que brutForce
      println("************** Divide & Conquer Algorithm STARTING **************");
      start=millis();
      r3 = startDivideAndConquer(0, nbSegments);
      end =  millis() - start;
      println("************** Divide & Conquer Algorithm FINSIHED **************");
      println("Total execution time D&C (ms):", end+endTri, "Sort time (ms):", endTri, "\n");
    }
    
     // //!\\ Affichage des resultats  //!\\
    
    if (r2==null && r3==null && r1==null) { // si les resultats sont null alors ils s'intersectent tous
      println("All the segments intersect");
    }
    
    //Ensuite on va informer l'utilisateur du resultat a l'aide de notre methode toString()S
    else if (choix ==1) {
      println("Voici le segment le plus grand qui n'a pas de collision: "+r1.toString());
    } else if (choix ==2) {
      println("Voici le segment le plus grand qui n'a pas de collision: "+r2.toString());
    } else if (choix ==3) {
      println("Voici le segment le plus grand qui n'a pas de collision: "+r3.toString());
    } else if (choix ==4) {
      println("Voici le segment le plus grand qui n'a pas de collision: "+r3.toString());
    }
    
  } else {
    println("Exiting the program"); //on affiche un message pour informer l'utilisateur de la fermeture du programme
    exit();
  }
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
