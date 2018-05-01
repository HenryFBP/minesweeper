public class Cell
{
  public GButton button;
  public CellStatus status = CellStatus.EMPTY;
  public boolean shown = false; //whether or not this cell is revealed
  public int x = 0;
  public int y = 0;
  
  Cell(GButton b)
  {
    this.button = b;
    this.status = CellStatus.EMPTY;
  }
  
  Cell(GButton b, CellStatus s)
  {
    this.button = b;
    this.status = s;
  }
  
  Cell(GButton b, int x, int y)
  {
    this.button = b;
    this.x = x;
    this.y = y;
  }
  
  Cell(GButton b, CellStatus s, int x, int y)
  {
    this.button = b;
    this.status = s;
    this.x = x;
    this.y = y;
  }
  
  public void render()
  {
    
  }
  
}

public Cell[][] createCellList(PApplet applet, int x, int y, Cell template, String eventhandler)
{
  
  float width = template.button.getWidth();
  float height = template.button.getHeight();
  
  Cell[][] cells = new Cell[y][x];
  
  for(int i = 0; i < x; i++)
  {
    Cell[] row = new Cell[y];
    //println("On row "+i+"!");

    for(int j = 0; j < y; j++)
    {
      float xpos = (i * width);
      float ypos = (j * height);

      Cell c = new Cell(new GButton(applet, xpos, ypos, width, height), i, j);
      
      c.button.setText(c.x+","+c.y);
      
      row[j] = c;
      
      if(eventhandler != null)
      {
        row[j].button.addEventHandler(this, eventhandler);
      }
      
    }
    
    cells[i] = row;
  }
  
  return cells;
}
