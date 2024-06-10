void mouseClicked() {
  
//MAIN MENU 
if(mode == 0  && mouseX > 120 && mouseX < 280 && mouseY > 550 && mouseY < 630) //Button for setting the difficulty to easy and initialising all the variables for easy mode
{
  difficulty = "easy";
  speedMult = 0;
  lives = 5;
  offset = 1000;
  hasBanana = false;
  hasPaper = false;
  hasTrash = false;
  hasBottle = false;
  rings_y=(int)(random(800));
  rings_x=-(int)random(offset);
  ringtime = false;
  minim = new Minim(this);
  click= minim.loadFile("click.mp3");
  click.rewind();
  click.play();
}

if(mode == 0  && mouseX > 320 && mouseX < 480 && mouseY > 550 && mouseY < 630) //Button for setting the difficulty to medium and initialising all the variables for medium mode
{
  difficulty = "medium";
  speedMult = 0.1;
  lives = 5;
  offset = 700;
  hasBanana = false;
  hasPaper = false;
  hasTrash = false;
  hasBottle = false;
  rings_y=(int)(random(800));
  rings_x=-(int)random(offset);
  ringtime = false;
  minim = new Minim(this);
  click= minim.loadFile("click.mp3");
  click.rewind();
  click.play();
}

if(mode == 0  && mouseX > 520 && mouseX < 680 && mouseY > 550 && mouseY < 630) //Button for setting the difficulty to hard and initialising all the variables for hard mode
{
  difficulty = "hard";
  speedMult = 0.15;
  lives = 3;
  offset = 500;
  hasBanana = false;
  hasPaper = false;
  hasTrash = false;
  hasBottle = false;
  rings_y=(int)(random(800));
  rings_x=-(int)random(offset);
  ringtime = false;
  minim = new Minim(this);
  click= minim.loadFile("click.mp3");
  click.rewind();
  click.play();
}

//END SCREEN
if(mode == 2 && mouseX > 150 && mouseX < 350 && mouseY > 550 && mouseY < 630) //if you click the retry button on the endscreen
{
  mode = 0;
  paper_x =-(int)random(offset);
  trash_x =-(int)random(offset);
  banana_x =-(int)random(offset);
  bottle_x =-(int)random(offset);
  score = 0;
  objSpeed = 2;
  hasBanana = false;
  hasPaper = false;
  hasTrash = false;
  rings_y=(int)(random(800));
  rings_x=-(int)random(offset);
  ringtime = false;
  minim = new Minim(this);
  click= minim.loadFile("click.mp3");
  click.rewind();
  click.play();
}

if(mode == 2 && mouseX > 450 && mouseX < 650 && mouseY > 550 && mouseY < 630)//if you click the screenshot button on the endscreen
{
  saveFrame("Score.png"); //from lab4
  minim = new Minim(this);
  click= minim.loadFile("click.mp3");
  click.rewind();
  click.play();
}
}
