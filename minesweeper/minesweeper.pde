import g4p_controls.*;

private static int ROWS = 10;
private static int COLS = 10;

private static int BUTTON_SIZE = 50;

public void setup() {
  size(500, 500, JAVA2D);
  createGUI();  
}

public void anybutton_click(GButtonCell source, GEvent event)
{  
  if(mouseButton == LEFT)
  {
    buttons.playerClick(source);
  }
  else if(mouseButton == RIGHT)
  {
    source.cell.flag();
    source.render();
  }
  else if(mouseButton == CENTER)
  {
    source.setText(str(buttons.minesAround(source)));
  }
}

public void keyPressed()
{
  
  println(Lib.formatKeyCode(key, keyCode));
  
  char k = Character.toUpperCase(key);
  
  if(k == Keys.R.code)
  {
    println("Resetting game state WITHOUT randomizing board...");
    buttons.resetGame();
  }
  else if(k == Keys.CTRL_R.code)
  {
    println("Randomizing and resetting game...");
    buttons.randomize();
    buttons.resetGame();
  }
}

public void keyReleased()
{
  
}


public void createGUI() 
{
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  surface.setTitle("Sketch Window");

  buttons = new GMineField(this, ROWS, COLS, 
      new GButtonCell(this, 0, 0, BUTTON_SIZE, BUTTON_SIZE),
  "anybutton_click");
  
  buttons.randomize();
}

static GMineField buttons;

public void draw() {
  background(230);
  
}
