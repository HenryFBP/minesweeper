public class Key
{
  Character code;
  String mn;
  boolean pressed = false;
  
  public Key(Character k)
  {
    this.code = k;
  }
  
  public Key(int k)
  {
    this.code = (char)k;
  }

  public Key(int k, String s)
  {
    this.code = (char)k;
    this.mn = s;    
  }
  
  public Key(char k, String s)
  {
    this.code = k;
    this.mn = s;
  } 
}
