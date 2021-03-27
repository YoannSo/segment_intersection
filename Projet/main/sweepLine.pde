//Project L3 FST Limoges - Algo 4
//Contributors: TAYLOR Matt & SOCHAJ Yoann

Segment sweepLine() {
  float lowerY;
  float maxLength = 0;
  ArrayList<Segment> candidates = new ArrayList<Segment>();
  sortSegments(segments); //on trie les segments

  //for (Segment s : segments) s.afficherNoir();
  //stroke(255, 0, 0);
  //line(0, segments.get(0).p1.y, width, segments.get(0).p1.y); //trace la premiere ligne de balayage
  lowerY = segments.get(0).p2.y;

  int posLine = 0;
  while (posLine <= segments.size()-1) {
    for (int i = 0; i < segments.size(); i ++) {
      lowerY = segments.get(posLine).p2.y;
      if (segments.get(i).p1.y < lowerY || segments.get(i).p2.y < lowerY) {
        if (intersect(segments.get(posLine), segments.get(i)) && i!= posLine) {
          segments.get(i).hasIntersection = true;
          segments.get(posLine).hasIntersection = true;
          break;
        }
      }
    } 
    if (segments.get(posLine).hasIntersection == false) {
      if (segments.get(posLine).length > maxLength) {
        if (candidates.size()>0) candidates.remove(0);
        candidates.add(segments.get(posLine));
        maxLength = segments.get(posLine).length;
      }
    }
    posLine++;
  }
  for (Segment s : candidates) s.afficherRouge(); 
  if (candidates.size() == 0) {
    return null;
  } else return candidates.get(0);
}
