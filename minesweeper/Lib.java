public boolean between(int t, int a, int b)
{
  return ((t >= a) && (t <= b));
}

public String interpretKeyCode(int i)
{
  if(between(i, 0, (('z' - 'a')+1))) //'a' through 'z'
  {
    return ("CTRL-"+((char)(i+'a'-1)));
  }
  
  return ""+(char)(i);
}

public String formatKeyCode(int k, int kc)
{
  String s = interpretKeyCode(k);
  
  return String.format("%s %s %s", s, int(k), kc);
}
