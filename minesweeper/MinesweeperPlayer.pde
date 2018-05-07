public abstract interface MinesweeperPlayer
{
  public GMineField board = null;
  
  public GButtonCell byLocation(Location l); //given a Location, return a GButtonCell
  public GButtonCell uncover(Location l); //'show' a cell. This returns the cell.

  public Double mineChance(Location l); //given a Location, return the chance that there is a mine at that location.
  
  public Double[][] mineChances(); //Return a list of all mine chances.
}
