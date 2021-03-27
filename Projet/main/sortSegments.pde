//Project L3 FST Limoges - Algo 4
//Contributors: TAYLOR Matt & SOCHAJ Yoann

//method that will sort the segments on Y value from top to bottom

void sortSegments(ArrayList<Segment> list) {
  //println("********* Initial list *********");
  //for (Segment s : segments) { 
  //  println("P1 x: ", round(s.p1.x), "\t y: ", round(s.p1.y));  
  //  println("P2 x: ", round(s.p2.x), "\t y: ", round(s.p2.y), "\n");
  //}
  Collections.sort(list, new LexicalComparison()); //on trie notre ArrayList de Segment par rapport au Y le plus haut
  //println("********* Sorted list *********");
  //for (Segment s : segments) { 
  //  println("P1 x: ", round(s.p1.x), "\t y: ", round(s.p1.y));  
  //  println("P2 x: ", round(s.p2.x), "\t y: ", round(s.p2.y), "\n");
  //}
}
