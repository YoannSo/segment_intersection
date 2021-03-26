//global variables
ArrayList<Segment> segments = new ArrayList<Segment>();
ArrayList<Segment> segmentsNotInCollision = new ArrayList<Segment>();

void setup() {
  int nbPoints = 10;
  size(500, 500); //on definit une fenetre de taille 500 x 500
  background(255); //couleur de fond = blanc
  randomSegments(nbPoints);
  Segment result, result1, result2;
  int start = millis();

  //result = sweepLine();
  //result1 = forceBrute(0, nbPoints);
  //result2 = divideAndConquer(0, nbPoints);
  //print(result.getLength(), result1.getLength());
  int end =  millis() - start;
  println("Number of segments:", nbPoints);
  println("Execution time (ms):", end);
}
