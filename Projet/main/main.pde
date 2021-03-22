//global variables
ArrayList<Segment> segments = new ArrayList<Segment>();

void setup() {
  
  size(500,500); //on definit une fenetre de taille 500 x 500
  background(255); //couleur de fond = blanc
  
  int start = millis();
  forceBrute(10);
  int end =  millis() - start;
  println("Temps (ms):", end);
}
