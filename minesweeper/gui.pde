private static int ROWS = 10;
private static int COLS = 10;


public void anybutton_click(GButtonCell source, GEvent event)
{  
  if(mouseButton == LEFT)
  {
    source.click();
    
    if(buttons.hasNoMinesAround(source) && (source.cell.status != CellStatus.MINE))
    {
      buttons.clearChunk(source);
    }
  }
  else if(mouseButton == RIGHT)
  {
    source.cell.flag();
  }
  else if(mouseButton == CENTER)
  {
    source.setText(str(buttons.minesAround(source)));
  }
}

public void createGUI() 
{
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  surface.setTitle("Sketch Window");

  buttons = new GMineField(this, ROWS, COLS, 
      new GButtonCell(this, 0, 0, 50, 50),
  "anybutton_click");
  
  buttons.randomize();

}

static GMineField buttons;
