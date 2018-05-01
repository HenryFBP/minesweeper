class GButtonArray extends GAbstractControl
{
  
  GButton[][] buttons = null;
  
  GButtonArray(PApplet applet)
  {
    super(applet);
  }
  
  GButtonArray(PApplet applet, int x, int y, GButton template, String eventhandler)
  {
    super(applet);
    
    this.buttons = createButtonList(applet, x, y, template, eventhandler);
  }
  
}

public GButton[][] createButtonList(PApplet applet, int x, int y, GButton template, String eventhandler)
{
  
  float width = template.getWidth();
  float height = template.getHeight();
  
  GButton[][] buttons = new GButton[y][x];
  
  for(int i = 0; i < x; i++)
  {
    GButton[] row = new GButton[y];
    //println("On row "+i+"!");

    for(int j = 0; j < y; j++)
    {
      float xpos = (i * width);
      float ypos = (j * height);
      
      //println("Row["+j+"] = new GButton!");
      row[j] = new GButton(applet, xpos, ypos, width, height);
      row[j].setText(i+","+j);

      if(eventhandler != null)
      {
        row[j].addEventHandler(this, eventhandler);
      }
      
    }
    
    
    buttons[i] = row;
  }
  
  return buttons;
}
