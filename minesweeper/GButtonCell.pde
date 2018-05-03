// A GButton that's associated with a Cell.
class GButtonCell extends GButton
{
  Cell cell;
  
  GButtonCell(PApplet applet, float x, float y, float width, float height, Cell c)
  {
    super(applet, x, y, width, height);
    
    this.cell = c;
  }
  
  GButtonCell(PApplet applet, float x, float y, float width, float height)
  {
    super(applet, x, y, width, height);
    
    this.cell = new Cell();
  }
  
  public void reset()
  {
    this.cell.shown = false;
    this.render();
  }
  
  public void render()
  {
    if(!this.cell.shown) //not shown
    {
      switch(this.cell.flag)
      {
        case NO_FLAG:
        {       
          this.setLocalColorScheme(GCScheme.BLUE_SCHEME);
          this.setText(""); 
          break;
        }
        case FLAG:
        {
          this.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
          this.setText("F");
          break;
        }
        case QUESTION:
        {
          this.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
          this.setText("?");
        }
      }
 
    }
    else //it is shown
    {
      switch(this.cell.status)
      {
        case MINE:
        {
          this.setLocalColorScheme(GCScheme.RED_SCHEME);
          this.setText("BOOM");
          break;
        }
        case EMPTY:
        {
          this.setLocalColorScheme(GCScheme.GREEN_SCHEME);
          break;
        }
      }
    }
  }
  
  public void click()
  {
    this.cell.shown = true;
    this.render();
    
    if(this.cell.deadly())
    {
      println("Cell at "+this.cell.toString()+" killed you!");
    }
  }
  
  public String toString()
  {
    return this.cell.toString();
  }
}

public GButtonCell[][] createCellList(PApplet applet, int x, int y, GButton template, String eventhandler)
{
  
  float width = template.getWidth();
  float height = template.getHeight();
  
  GButtonCell[][] cells = new GButtonCell[x][y];
  
  for(int i = 0; i < x; i++)
  {
    GButtonCell[] row = new GButtonCell[y];
    //println("On row "+i+"!");

    for(int j = 0; j < y; j++)
    {
      float xpos = (i * width);
      float ypos = (j * height);

      GButtonCell c = new GButtonCell(applet, xpos, ypos, width, height, new Cell(new Location(i,j)));
      
      //c.setText(c.cell.location.toString());
      
      c.render();
      
      row[j] = c;
      
      if(eventhandler != null)
      {
        row[j].addEventHandler(this, eventhandler);
      }
      
    }
    
    cells[i] = row;
  }
  
  return cells;
}
