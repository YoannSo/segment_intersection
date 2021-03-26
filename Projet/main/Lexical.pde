import java.util.Collections;
import java.util.Comparator;

public class LexicalComparison implements Comparator<Segment> {
  public LexicalComparison() {
  }

  public int compare(Segment s1, Segment s2) {
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
