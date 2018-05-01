class GMineField extends GAbstractControl
{
  Cell[][] minefield;
    
  GMineField(PApplet applet)
  {
    super(applet);
  }
    
  GMineField(PApplet applet, int x, int y, Cell template, String eventhandler)
  {    
    super(applet);
    
    template.button.setVisible(false);

    this.minefield = createCellList(applet, x, y, template, eventhandler);
  }
    
  public Location locationFromGButton(GButton b)
  {
    int x, y;

    x = -1;
    y = -1;
    
    try
    {
      String s = b.getText();
      String[] sa = s.split(",");
      
      x = parseInt(sa[0]);
      y = parseInt(sa[1]);
      
    }
    catch(Exception e)
    {
      e.printStackTrace();
    }
    
    return new Location(x, y);
  }
  
  public void populateCell(Cell c)
  {
    float x = random(100);
    
    if(x > 50.0)
    {
      c.status = CellStatus.MINE;
    }
    else
    {
      c.status = CellStatus.EMPTY;
    }

  }
  
  public void populateMinefield()
  {
    for(Cell[] cells : this.minefield)
    {
      for(Cell cell : cells)
      {
        
      }
    }
  }
  
}
