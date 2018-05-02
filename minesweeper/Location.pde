class Location
{
  int x = 0;
  int y = 0;
  
  Location(int a, int b)
  {
    this.x = a;
    this.y = b;
  }
  
  public String toString()
  {
    return this.x + "," + this.y;
  }
}
