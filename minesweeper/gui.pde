
public void anybutton_click(GButton source, GEvent event)
{
  println("Anybutton_Click");
  println(event);

  int scheme = source.getLocalColorScheme();
  source.setLocalColorScheme(GCScheme.RED_SCHEME);
}

public void createGUI() 
{
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  surface.setTitle("Sketch Window");

  GButton template = new GButton(this, 0, 0, 50, 50);

  GMineField buttons = new GMineField(this, 3, 5, template, "anybutton_click");
  
}
