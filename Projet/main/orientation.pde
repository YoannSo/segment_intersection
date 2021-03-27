//Project L3 FST Limoges - Algo 4
//Contributors: TAYLOR Matt & SOCHAJ Yoann


//Pour savoir si 2 segments A(a1, a2) et B(b1, b2) s'intersectent il faut que
//(a1, b1, a2) et (a1, b1, b2) aient une orientation differente et que
//(a2, b2, a1) et (a2, b2, b1) aient une orientation differente

//La fonction ci-dessous retourne les valeurs suivantes
//0: colinear
//1: clockwise
//2: counterclockwise

float orientation(PVector p1, PVector p2, PVector p3) {
  float val = (p2.y - p1.y) * (p3.x - p2.x) - (p2.x - p1.x) * (p3.y - p2.y);
  if ( val > 0) return 1;
  else if ( val < 0) return 2;
  else return 0;
}
