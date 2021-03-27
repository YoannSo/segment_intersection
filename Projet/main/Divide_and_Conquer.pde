//fonction qui determine le plus grand segment qui n'intersecte aucun autre segment de maniere "divide and conquer"
Segment divideAndConquer(int start, int end) {
  // Si   y a strictement moins de 4 segments alors il faut faire le brutForce

  if ((end - start) <= 4) {
    Segment temp= forceBrute(start, end);
    //segmentsNotInCollision.add(temp);
    return temp;
  }
  int mid=(start+end)/2;

  //Segment newMidSegment=segments.get(mid);
  divideAndConquer(start, mid);
  divideAndConquer(mid, end);
  //plusGrandBas.afficherRouge();
  //boolean intersectionHaut=false,intersectionBas=false;
  //Segment result=null;


  if (segmentsNotInCollision.size()!=0) {
    for ( int i = 0; i < segmentsNotInCollision.size(); i ++ ) {
      for ( int j = 0; j < segments.size(); j ++) {
        if(segmentsNotInCollision.get(i)!=segments.get(j)){
          if (intersect(segmentsNotInCollision.get(i), segments.get(j))) {
            segmentsNotInCollision.remove(i);
            i--;
            break;
          }
        }
      }
    }
    if (segmentsNotInCollision.size()==0)
      return null;
    else if (segmentsNotInCollision.size()==1)
      return segmentsNotInCollision.get(0);
    else {
       
      float maxDist=segmentsNotInCollision.get(0).length;
      int index=0;
      for ( int i = 1; i < segmentsNotInCollision.size(); i ++ ) {
        if (maxDist<segmentsNotInCollision.get(i).length) {
          index=i;
        }
      }
      return segmentsNotInCollision.get(index);
    }
  }
  return null;
}
