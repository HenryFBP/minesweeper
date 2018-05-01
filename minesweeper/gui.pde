public void anybutton_click(GButton source, GEvent event)
{
  Location l = buttons.locationFromGButton(source);
  Cell c = buttons.minefield[l.x][l.y];
  
  if(mouseButton == LEFT)
  {
    source.setLocalColorScheme(GCScheme.RED_SCHEME);
  }
  else if(mouseButton == RIGHT)
  {
    source.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  }
  
  
    
}

void handleButtonEvents(GButton button, GEvent event)
{
  print("HandleButtonEvents");
    
  if(button == null && event == GEvent.CLICKED)
  {
  }
}


public void createGUI() 
{
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  surface.setTitle("Sketch Window");

  buttons = new GMineField(this, 3, 5, 
    new Cell(
      new GButton(this, 0, 0, 50, 50)
      ), 
  "anybutton_click");
  

}

static GMineField buttons;
