import ddf.minim.analysis.*;
import ddf.minim.*;            //From MinimLibrary Intro (Joe Timoney's Slides 2020)
Minim minim, minim2;
AudioPlayer ding, damage, click, menu;  // Variables to store information about audio

PImage wave,wave2,wave3,duck, water, paper, recycle, trash, garbage, bin, bubble, banana, rings, bottle, island, island2; // Variables to store information about images
int wave_x,wave_y,wave_count,wave2_x,wave2_y,wave2_count,wave3_x,wave3_y,wave3_count, paper_x, paper_y, trash_x, trash_y, score, duck_x, duck_y, banana_x, banana_y, rings_x, rings_y, bottle_x, bottle_y; // Variables to store (x,y) positions

int mode;  //game modes, menu, game and endscreen
String difficulty = "easy"; 

//boolean variables for the objects to check what you're holding 
boolean hasPaper, hasTrash, hasBanana, hasBottle, ringtime;

//Double variables
double objSpeed = 2, speedMult = 0;

//Int variables 
int random, lives, offset, thirdObj;

//from lab3
void vertexWave(){
 vertex( -200, -40, 0, 0); // Load vertex data (x,y) and (U,V) texture data into GPU
 vertex(200, -40, 1, 0); // Square centred on (0,0) of width 40 and height 40
 vertex(200, 40, 1, 1); // Textured with an image of a wave
 vertex( -200, 40, 0, 1);
 endShape(CLOSE); // Tell GPU you have loaded shape into memory.
 popMatrix(); // Recover origin(0,0)means top left hand corner again.

}

void setup() // Entry point (start of program), runs once
{
 score = 0;  
 mode = 0;  //start on menu
 hasTrash = false;  
 hasPaper = false;
 hasBanana = false;
 size(800,800,P2D); // window of 800*800
 wave = loadImage("wave.png"); // loading images into the GPU
 wave2 = loadImage("wave.png");
 wave3 = loadImage("wave.png");
 duck = loadImage("duck.png"); //
 water = loadImage("water.jpg"); 
 paper = loadImage("paper.png");
 recycle = loadImage("recycle.png");
 trash = loadImage("trash.png");
 banana = loadImage("banana.png");
 bin = loadImage("bin.png");
 rings = loadImage("rings.png");
 bottle = loadImage("plastic.png");
 island = loadImage("island.png");
 island2 = loadImage("island2.png");
 
 minim2 = new Minim(this);
 menu= minim2.loadFile("menu.mp3");//https://www.youtube.com/watch?v=0ByCY7xdkR4
 menu.loop();

//from lab 3
 textureMode(NORMAL); // Scale texture Top right (0,0) to (1,1)
 blendMode(BLEND); //how to blend the layers of imaegs
 noStroke(); // Don't outline objects
 
 thirdObj= (int)random(2);   //Set the value for the third object on hard difficulty

 paper_x=-(int)random(500);  // object starting positions
 paper_y=(int)(random(800));
 
 trash_x=-(int)random(500);  
 trash_y=(int)(random(800));
 
 banana_x=-(int)random(500);
 banana_y=(int)(random(800));
 
 bottle_x=-(int)random(500);
 bottle_y=(int)(random(800));
 
 rings_x=(int)random(100)-((int)random(300)); 
 rings_y=(int)random(263)+530;

 wave_x=(int)random(100)-((int)random(300)); 
 wave_y=(int)random(263);
 
 wave2_x=(int)random(100)-((int)random(300)); 
 wave2_y=(int)random(263)+263;
 
 wave3_x=(int)random(100)-((int)random(300)); 
 wave3_y=(int)random(263)+530;
}
