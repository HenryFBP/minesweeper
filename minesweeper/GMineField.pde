import java.util.*;
import java.util.concurrent.CopyOnWriteArraySet;

public static final int[] offsets = {-1, 0, 1};

class GMineField extends GAbstractControl
{
  GButtonCell[][] minefield;
    
  GMineField(PApplet applet)
  {
    super(applet);
  }
    
  GMineField(PApplet applet, int x, int y, GButtonCell template, String eventhandler)
  {    
    super(applet);
    
    template.setVisible(false);

    this.minefield = createCellList(applet, x, y, template, eventhandler);
  }
    
  public int minesAround(GButtonCell source)
  {
    int mines = 0;
    
    ArrayList<GButtonCell> cells = cellsAround(source);
    
    for(GButtonCell c : cells)
    {      
      if((c != null) && (c != source) && (c.cell.status == CellStatus.MINE))
      {
        mines++;
      }
    }
    
    return mines;
  }
  
  public void playerClick(GButtonCell c) //human clicks a cell
  {    
    if((!c.cell.shown) && this.hasNoMinesAround(c) && (c.cell.status != CellStatus.MINE))
    {
      this.clearChunk(c);
    }
    
    c.click();

    if((this.minesAround(c) > 0) && (c.cell.status != CellStatus.MINE))
    {
      this.showMinesText(c);
    }
    
  }
  
  public void resetGame() //resets game state
  {
    for(GButtonCell[] row : this.minefield)
    {
      for(GButtonCell cell : row)
      {
        cell.reset();
      }
    }
  }
  
  public Boolean hasNoMinesAround(GButtonCell source)
  {
    return (this.minesAround(source) == 0);
  }
  
  //Returns a list of cells around a source cell.
  public ArrayList<GButtonCell> cellsAround(GButtonCell source)
  {
    ArrayList<GButtonCell> cells = new ArrayList();
    
    for(int i = 0; i < offsets.length; i++)
    {
      for(int j = 0; j < offsets.length; j++)
      {
        int x = offsets[i];
        int y = offsets[j];
        GButtonCell temp = this.offset(source, x, y);
        
        if((temp != null) && (temp != source))
        {
          cells.add(temp);
        }
      }
    }    
    return cells;

  }
  
  public ArrayList<GButtonCell> cellsAroundCardinal(GButtonCell source)
  {
    ArrayList<GButtonCell> cells = new ArrayList();
    
    for(int i = 0; i < offsets.length; i++)
    {
      for(int j = 0; j < offsets.length; j++)
      {
        int x = offsets[i];
        int y = offsets[j];

        GButtonCell temp = this.offset(source, x, y);
        
        if((temp != null) && (x*y == 0) && (temp != source))
        {
          cells.add(temp);
        }
      }
    }    
    return cells;
  }
  
  //Returns a cell relative to source's position.
  public GButtonCell offset(GButtonCell source, int ox, int oy)
  {
    int x = source.cell.location.x;
    int y = source.cell.location.y;
    
    GButtonCell c = null;
    
    try
    {
      c = this.minefield[x+ox][y+oy];
      //println(c);
    }
    catch(ArrayIndexOutOfBoundsException e)
    {
      
    }
    
    return c;
  }
  
  public void showMinesText(GButtonCell c)
  {
    c.setText(str(this.minesAround(c))); 
    c.render();
  }
  
  //Gives one of eight random neighbors
  public GButtonCell randomNeighbor(GButtonCell source)
  {
    ArrayList<GButtonCell> cells = buttons.cellsAround(source);
    
    int x = ceil(random(0, cells.size()));
        
    GButtonCell c = buttons.cellsAround(source).get(x);
    
    return c;
  }
  
  //Clears all zeroes and highlights all non-zeroes.
  //This is suuuuper unoptimized but I don't care.
  public void clearChunk(GButtonCell source)
  {
    Set<GButtonCell> seen = new CopyOnWriteArraySet(); //list of all seen cells
    int old_size = seen.size();
    
    seen.add(source);
    
    int i = 0;
    while(seen.size() != old_size) //while we are still discovering new cells,
    {
      println(i,"th iter saw ",seen.size(),".");
      old_size = seen.size(); //set it up to fail if size does not change
      
      for(GButtonCell b : seen) //for all already-marked cells,
      {
        if((this.minesAround(b) == 0) && (b.cell.status == CellStatus.EMPTY)) //if cell HAS NO MINES AROUND and is not a mine, add all its neighbors
        {
          ArrayList<GButtonCell> cells = this.cellsAroundCardinal(b);
          seen.addAll(cells);
        }
      }
      i++;
    }
    
    for(GButtonCell c : seen) //click empty ones
    {
      c.click(); 
    }

    for(GButtonCell c : seen) //now, mark them all.
    {
      for(GButtonCell maybebad : this.cellsAround(c))
      {
        if((this.minesAround(maybebad) > 0) && (maybebad.cell.shown))
        {
          this.showMinesText(maybebad);
        }
      }
    }
    
  }
  
  public void randomize()
  {
    for(GButtonCell[] gbcells : this.minefield)
    {
      for(GButtonCell gbcell : gbcells)
      {
        gbcell.cell.randomize();
      }
    }
  }
  
}
