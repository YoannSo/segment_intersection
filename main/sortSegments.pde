//Project L3 FST Limoges - Algo 4
//Contributors: TAYLOR Matt & SOCHAJ Yoann

//method that will sort the segments on Y value from top to bottom

void sortSegments(ArrayList<Segment> list) { // fonction plus parlante pour trier
  Collections.sort(list, new LexicalComparison()); //on trie notre ArrayList de Segment par rapport au Y le plus haut  
}
