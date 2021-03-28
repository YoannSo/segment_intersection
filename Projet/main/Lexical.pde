//Project L3 FST Limoges - Algo 4
//Contributors: TAYLOR Matt & SOCHAJ Yoann


//LexicalComparison class to allow us to compare our Segments
import java.util.Collections;
import java.util.Comparator;

public class LexicalComparison implements Comparator<Segment> {
  public LexicalComparison() {
  }

  public int compare(Segment s1, Segment s2) { // on va comparer les points a l'aide de la coordonnée Y de p1 en effet p1 est le point le plus haut 
    if (s1.p1.y > s2.p1.y) {
      return 1;
    } else if (s1.p1.y < s2.p1.y) {
      return -1;
    } else { // y component is the same, check x
      if (s1.p1.x > s2.p1.x) {
        return 1;
      } else {
        return -1;
      }
    }
  }
}
