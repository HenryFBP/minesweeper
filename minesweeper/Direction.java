public enum Direction
{
  // XXX
  // ...
  // ...
  NW    (0); // X..
  N     (1); // .X.
  NE    (2); // ..X

  // ...
  // XXX
  // ...
  W     (3); // X..
  C     (4); // .X.
  E     (5); // ..X

  // ...
  // ...
  // XXX
  SW    (6); // X..
  S     (7); // .X.
  SE    (8); // ..X
  
  private final int direction;
  
  public Direction(int d)
  {
    this.direction = d;
  }
}
