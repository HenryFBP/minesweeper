public static final float MINE_CHANCE = 20.0;

// A single Cell.
public class Cell
{
  public CellStatus status = CellStatus.EMPTY; //what's in da cell?
  public FlagStatus flag = FlagStatus.NO_FLAG; //if we have a flag
  
  public Boolean shown = false; //whether or not this cell is revealed
  public Location location = new Location(0, 0); //pos of cell
    
  Cell()
  {
  }
  
  Cell(CellStatus s)
  {
    this.status = s;
  }
  
  Cell(Location l)
  {
    this.location = l;
  }
  
  Cell(CellStatus s, Location l)
  {
    this.status = s;
    this.location = l;
  }
  
  public void randomize()
  {
    float num = random(0, 100);
    
    if(num < MINE_CHANCE)
    {
      this.status = CellStatus.MINE;
    }
    else
    {
      this.status = CellStatus.EMPTY;
    }
  }

  public boolean deadly()
  {
    return (this.shown && (this.status == CellStatus.MINE));
  }
  
  public void flag()
  {
    switch(this.flag)
    {
      case NO_FLAG:
      {
        this.flag = FlagStatus.FLAG;
        break;
      }
      case FLAG: 
      {
        this.flag = FlagStatus.QUESTION;
        break;
      }
      case QUESTION: 
      {
        this.flag = FlagStatus.NO_FLAG;
        break;
      }
    }
  }
  
  public String toString()
  {
    String ret = "";
    
    ret += this.location.toString();
    
    return ret;
  }
}
