void draw()
{
  
  //MAIN MENU
  if(mode == 0) //https://www.youtube.com/watch?v=FVapAzb44DY Source for how to make a game menu in processing. I used the mode 0,1,2 from this source to switch between the different menues of the game
  {
    background(water); 
    
    pushMatrix();   //make a duck image move across the screen on the main menu
    translate(duck_x,duck_y);
    beginShape();
    texture(duck); 
    
    vertex( -40, -40, 0, 0); 
    vertex(40, -40, 1, 0); 
    vertex(40, 40, 1, 1); 
    vertex( -40, 40, 0, 1);
    endShape(CLOSE);
    popMatrix(); 
 
    duck_x+=4; //moves 4 pixels at a time
    if(duck_x>1000) // If x value is going off screen
      {
        duck_x=-100; //return to starting position 
        duck_y=(int)random(800); // randomise y position.
      } 
    
    //text for main menu
    textSize(70);//set the size of text
    fill(0,0,0);//black text
    text("Press enter to start",140,200);
    textSize(40);
    text("Select Difficulty",275,400);
    text("Difficulty: " + difficulty,275,500);
    
    //main menu buttons
    if(mouseX > 120 && mouseX < 280 && mouseY > 550 && mouseY < 630)//check  if the mouse is on the buttons
      {
        fill(0,0,100); //darker if the mouse is on the button
      }
    else
      {
        fill(0,0,255);
      }
    rect(120,550,160,80);
    fill(0,0,0);
    text("easy",160,600); //easy mode button
    
    if(mouseX > 320 && mouseX < 480 && mouseY > 550 && mouseY < 630)
      {
        fill(0,0,100);
      }
    else
      {
        fill(0,0,255);
      }
    rect(320,550,160,80);
    fill(0,0,0);
    text("medium",327,600); //medium mode button
    
    if(mouseX > 520 && mouseX < 680 && mouseY > 550 && mouseY < 630)
      {
        fill(0,0,100);
      }
    else
      {
        fill(0,0,255);
      }
    rect(520,550,160,80);
    fill(0,0,0);
    text("hard",560,600); //hard mode button
  }
  
  //End Screen displaying your score
  if(mode == 2)
  {
    background(water);
    textSize(70);
    fill(0,0,0);
    text("GAME OVER",230,200);
    text("SCORE: " + score,270,400);
    
    //buttons for end screen. working similarly to the menu buttons
    textSize(35);
    if(mouseX > 150 && mouseX < 350 && mouseY > 550 && mouseY < 630)
      {
        fill(0,0,100);
      }
    else
      {
        fill(0,0,255);
      }
    rect(150,550,200,80);
    fill(0,0,0);
    text("Retry",210,600);//retry Button
    
    if(mouseX > 450 && mouseX < 650 && mouseY > 550 && mouseY < 630)
      {
        fill(0,0,100);
      }
    else
      {
        fill(0,0,255);
      }
    rect(450,550,200,80);
    fill(0,0,0);
    text("Screenshot",465,600);//button to take a screenshot of your score;
           
  }
  
//the code for the game itself
if(mode == 1)//the game
{
 //make a wave that will continuiously move across the screen in the upper third of the screen.
 background(water); // Clear screen to the water image.
 //from lab 3
 pushMatrix(); // Store current location of origin (0,0)
 translate(wave_x,wave_y); // Change origin (0,0) for drawing to (wave_x,wave_y)
 beginShape(); // Open graphics pipeline
 texture(wave); // Tell GPU to use wave to texture the polygon
 vertexWave(); //using the method I made in startup for the waves.
 wave_x+=8; // Make "wave" move across the screen (8 pixels at a time)
 if(wave_x>900) // If x value is going off screen
   {
     wave_x=(int)random(100)-((int)random(300)); // Choose wave starting position
     wave_y=(int)random(263);//top third of the screen
   } 
 
 //second wave
 pushMatrix();
 translate(wave2_x,wave2_y);
 beginShape();
 texture(wave2);
 vertexWave();
 wave2_x+=8; 
 if(wave2_x>900)
   {
     wave2_x=(int)random(100)-((int)random(300));
     wave2_y=(int)random(263)+263;//middle third of the screen
   } 
 
 //third wave
 pushMatrix();
 translate(wave3_x,wave3_y);
 beginShape(); 
 texture(wave3);
 vertexWave();
 wave3_x+=8;
 if(wave3_x>900)
   {
     wave3_x=(int)random(100)-((int)random(300));
     wave3_y=(int)random(263)+530;//bottom third of the screen
   }
 
 image(island, 620, 670, 200, 100);//island images to put the bins onto
 image(island2, 620, 50, 200, 100);
 
 //spawn paper that will move across the screen
 pushMatrix();
 translate(paper_x,paper_y);
 beginShape(); 
 texture(paper);
 vertex( -40, -40, 0, 0);
 vertex(40, -40, 1, 0);            //same code as for the waves but for the paper object using different vertexes instead of the method I made for the waves.
 vertex(40, 40, 1, 1); 
 vertex( -40, 40, 0, 1);
 endShape(CLOSE);
 popMatrix();
 paper_x+=objSpeed;
 //if the paper goes off screen
 if(paper_x>840)
   {
    paper_y=(int)(random(800));//randomise the y position of the object
    paper_x=-(int)random(offset);//offset it's x position by the variable "offset" (this changes with difficulty)
    lives--; // lose a life
    minim = new Minim(this); //play damage noise
    damage= minim.loadFile("damage.mp3");
    damage.rewind();
    damage.play();
   }
 
 pushMatrix(); 
 translate(trash_x,trash_y);
 beginShape(); 
 texture(trash); 
 vertex( -40, -40, 0, 0); 
 vertex(40, -40, 1, 0);            //same code as for the paper but for the trash object.
 vertex(40, 40, 1, 1); 
 vertex( -40, 40, 0, 1);
 endShape(CLOSE); 
 popMatrix();
 trash_x+=objSpeed;
 if(trash_x>840)
   {
    trash_y=(int)(random(800));
    trash_x=-(int)random(offset);
    lives--;
    minim = new Minim(this);
    damage= minim.loadFile("damage.mp3");
    damage.rewind();
    damage.play();
   }
 
 if(difficulty == "hard")            //when the difficulty is hard there will be 3 objects active. the third object will either be a bottle or banana depending on the value of the variable thirdObj
 {
   if(thirdObj == 0)
     {
       pushMatrix(); 
       translate(banana_x,banana_y);
       beginShape(); 
       texture(banana); 
       vertex( -40, -40, 0, 0); 
       vertex(40, -40, 1, 0);               //same code as for the paper but for the banana object.
       vertex(40, 40, 1, 1); 
       vertex( -40, 40, 0, 1);
       endShape(CLOSE); 
       popMatrix(); 
       banana_x+=objSpeed;
       if(banana_x>840)
       {
        banana_y=(int)(random(800));
        banana_x=-(int)random(offset);
        lives--;
        minim = new Minim(this);
        damage= minim.loadFile("damage.mp3");
        damage.rewind();
        damage.play();
        thirdObj= (int)random(2);
       }
     }
 
   if(thirdObj == 1)
     {
       pushMatrix(); 
       translate(bottle_x,bottle_y);
       beginShape(); 
       texture(bottle); 
       vertex( -40, -40, 0, 0); 
       vertex(40, -40, 1, 0);               //same code as for the paper but for the bottle object.
       vertex(40, 40, 1, 1); 
       vertex( -40, 40, 0, 1);
       endShape(CLOSE); 
       popMatrix(); 
       bottle_x+=objSpeed;
       if(bottle_x>840)
         {
          bottle_y=(int)(random(800));
          bottle_x=-(int)random(offset);
          lives--;
          minim = new Minim(this);
          damage= minim.loadFile("damage.mp3");
          damage.rewind();
          damage.play();
          thirdObj= (int)random(2);
         }
      }
 }
 
 //if the score is divisable by 10 set ringtime to true
 if(score%10==0 && score > 1)
   {
    ringtime = true;
   }
 
 if(ringtime == true)
   {// only active if the score is a multiple of 10, Spawns a 6 pack ring that decreases the score by 5 if you pick it up.
     pushMatrix(); 
     translate(rings_x,rings_y); 
     beginShape(); 
     texture(rings); 
     vertex( -40, -40, 0, 0); 
     vertex(40, -40, 1, 0); 
     vertex(40, 40, 1, 1);                 //same code as for the paper but for the rings object.
     vertex( -40, 40, 0, 1);
     endShape(CLOSE); 
     popMatrix(); 
     rings_x+=objSpeed;
     if(rings_x>840)
       {
        rings_y=(int)(random(800));
        rings_x=-(int)random(offset);
        ringtime = false;//disable ringtime after the rings have finished their path            
       }
   }
 
 //duck
 if(pmouseX > mouseX)//if the mouse x position is decreasing, flip the duck image
   {
    pushMatrix();            //source: https://stackoverflow.com/questions/17759396/how-do-you-flip-a-image-horizontally-using-processing-js
    scale(-1.0, 1.0);        //I modified this code to make it work with an image following the mouse 
    image(duck, -mouseX-40, mouseY-40,width/10,height/10);
    popMatrix();
   }
 else
   {
     image(duck, mouseX-40, mouseY-40, width/10, height/10);//mouse image is duck
   }
 
 image(recycle,700,40,100,100);//recycling bin image
 image(bin,650,660,100,100);//trash bin image
 
 if(((paper_x-20) < mouseX && mouseX < (paper_x+20))&&((paper_y-20) < mouseY && mouseY < (paper_y+20))&& hasPaper == false && hasTrash == false && hasBanana == false && hasBottle == false)//if the mouse is on the paper and you aren't holding any other objects
   {
    hasPaper = true;
    paper_y=(int)(random(800));//reset the paper object
    paper_x=-(int)random(offset);
   }
 
 if(((trash_x-20) < mouseX && mouseX < (trash_x+20))&&((trash_y-20) < mouseY && mouseY < (trash_y+20))&& hasTrash == false && hasPaper == false && hasBanana == false && hasBottle == false)//if the mouse is on the trash and you aren't holding any other objects
   {
    hasTrash = true;
    trash_y=(int)(random(800));//reset the trash object
    trash_x=-(int)random(offset);
   }
 
  if(((banana_x-20) < mouseX && mouseX < (banana_x+20))&&((banana_y-20) < mouseY && mouseY < (banana_y+20))&& hasTrash == false && hasPaper == false && hasBanana == false && hasBottle == false)//if the mouse is on the banana and you aren't holding any other objects
   {
    hasBanana = true;
    banana_y=(int)(random(800));//reset the banana object
    banana_x=-(int)random(offset);
    thirdObj= (int)random(2);
   }
 
  if(((bottle_x-20) < mouseX && mouseX < (bottle_x+20))&&((bottle_y-20) < mouseY && mouseY < (bottle_y+20))&& hasTrash == false && hasPaper == false && hasBanana == false && hasBottle == false)//if the mouse is on the banana and you aren't holding any other objects
   {
    hasBottle = true;
    bottle_y=(int)(random(800));//reset the bottle object
    bottle_x=-(int)random(offset);
    thirdObj= (int)random(2);
   }
 
  if(((rings_x-20) < mouseX && mouseX < (rings_x+20))&&((rings_y-20) < mouseY && mouseY < (rings_y+20)))//if the mouse is on the rings
   {
    score = score - 5;// lose 5 points
    minim = new Minim(this);//play damage noise and then reset it
    damage= minim.loadFile("damage.mp3");
    damage.rewind();
    damage.play();
    rings_y=(int)(random(800));//return to starting position
    rings_x=-(int)random(offset);
  
    ringtime = false;//disable ringtime
   }
 
 //add image of the object you collected beside the duck character
 if(hasPaper == true)
   {
     image(paper, mouseX, mouseY, width/10, height/10);
   }
 
 if(hasTrash == true)
   {
     image(trash, mouseX, mouseY, width/10, height/10);
   }
 
  if(hasBanana == true)
   {
     image(banana, mouseX, mouseY, width/10, height/10);
   }
 
   if(hasBottle == true)
   {
     image(bottle, mouseX, mouseY, width/10, height/10);
   }
 
 if(mouseX >700 && mouseY<150 && (hasPaper==true || hasBottle==true))//if you have paper and the mouse is at the recycling bin
   {
     score++;//increase score by 1
     hasPaper = false;//remove the paper
     hasBottle = false;
     objSpeed = objSpeed + speedMult;//increase the object speed
     minim = new Minim(this);
     ding = minim.loadFile("ding.mp3"); //play ding noise
     ding.rewind();
     ding.play();
   }
 
 if(mouseX > 650 && mouseY > 650 && (hasTrash==true || hasBanana==true))//if you have trash and the mouse is at the trash bin
   {
     score++;
     hasTrash = false;
     hasBanana = false;
     objSpeed = objSpeed + speedMult;
     minim = new Minim(this);
     ding = minim.loadFile("ding.mp3");
     ding.rewind();
     ding.play();
   }
 
 //if your lives are at zero switch to endscreen
 if(lives <= 0)
   {
     mode = 2;
   }

//display the score and lives at the top of the screen
textSize(40);
text("Score: " + score, 40, 50); 
text("Lives: " + lives, 570, 50);

//displaying variables to check the program is running as expected.
 if(score > 0)
   {
    println("score = " + score);
    println("speed = " + objSpeed);
    println("mode = " + mode);
    println(offset);
   }
 }
} 
