public class MinesweeperPlayerDumb implements MinesweeperPlayer
{
  public GMineField board = null;
  
  public void uncover(Location l)
  {
    return;
  }
  
  public Double mineChance(Location l)
  {
    return 0.50d;
  }
  public GButtonCell byLocation(Location l)
  {
    return null;
  }
}
