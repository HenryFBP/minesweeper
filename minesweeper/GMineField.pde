class GMineField extends GButtonArray
{
  
  public int[][] minefield;
  
  public GMineField(PApplet applet)
  {
    super(applet);
  }
  
  public GMineField(PApplet applet, int x, int y, GButton template, String eventhandler)
  {
    super(applet, x, y, template, eventhandler);
    
    this.minefield = new int[x][y];
  }
  
}
