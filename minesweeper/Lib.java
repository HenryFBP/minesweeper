import java.util.Random;

public class Lib
{
  
  public static boolean between(int t, int a, int b)
  {
    return ((t >= a) && (t <= b));
  }
  
  public static String interpretKeyCode(int i)
  {
    if(between(i, 0, (('z' - 'a')+1))) //'a' through 'z'
    {
      return ("CTRL-"+((char)(i+'a'-1)));
    }
    
    return ""+(char)(i);
  }
  
  public static String formatKeyCode(int k, int kc)
  {
    String s = interpretKeyCode(k);
    
    return String.format("%s %s %s", s, (int)k, kc);
  }
  
  public static int random(int l, int h)
  {
    return new Random().nextInt((h - l) + 1) + l;
  }

}
