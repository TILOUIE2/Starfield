Pollen [] bob = new Pollen [200];

void setup(){
  size(600, 600);
  for(int i = 0; i < 5; i++){
    bob[i] = new Bee();  
  }
  for(int i = 5 ; i < bob.length; i++){
    bob[i] = new Pollen();  
  }
}

void mousePressed(){
 for(int i = 0; i < 5; i++){
    bob[i] = new Bee();  
  }
  for(int i = 5; i < bob.length; i++){
    bob[i] = new Pollen();  
  }
}

void draw(){
  background(#A3E9EA);
  //flower
  stroke(0);
  //stem
  fill(#0F9524);
  bezier(300, 500, 390, 450, 400, 500, 300, 550);
  quad(295, 290, 305, 290, 305, 610, 295, 610);
  //petals
  fill(#FF3903);
  bezier(275, 290, 175, 100, 425, 100, 325, 290);
  bezier(275, 310, 175, 500, 425, 500, 325, 310);
  bezier(290, 275, 100, 175, 100, 425, 290, 325);
  bezier(310, 275, 500, 175, 500, 425, 310, 325);
  //middle
  fill(#342E17);
  ellipse(300, 300, 100, 100);
  //stuff
  for(int i = 0; i < bob.length; i++){
    bob[i].move();
    bob[i].show();
  }
}

class Pollen{
  double myX, myY, myAngle, mySpeed, mySize;
  
  Pollen(){
    myX = 300;
    myY = 300;
    myAngle = (Math.random()*2)*Math.PI;
    mySpeed = Math.random()*10;
    mySize = 5;
  }
  void move(){
    myX = myX + (Math.cos(myAngle)*mySpeed);
    myY = myY + (Math.sin(myAngle)*mySpeed);
  }
  void show(){
     if(myX < 250 && mySize < 30){
      mySize = mySize + (250 - myX)*0.001;
    } else if(myX > 250 && mySize < 30){
      mySize = mySize + (myX - 250)*0.001;
    }
    if(myY < 250 && mySize < 30){
      mySize = mySize + (250 - myY)*0.001;
    } else if(myY > 250 && mySize < 30){
      mySize = mySize + (myY - 250)*0.0005;
    }
    noStroke();
    fill(#FAFF08);
    ellipse((float)myX, (float)myY, (float)mySize, (float)mySize);
  }
}

class Bee extends Pollen{
  Bee(){
    myX = 300;
    myY = 300;
    myAngle = (Math.random()*2)*Math.PI;
    mySpeed = Math.random()*10;
  }
   void show(){
    stroke(0);
    //wings
    if(myX < 250){
      fill(#FFFFFF);
      ellipse((float)myX - 2.5, (float)myY - 20, 15, 20); 
      ellipse((float)myX + 7.5, (float)myY - 20, 15, 20);
    } else {
      fill(#FFFFFF);
      ellipse((float)myX - 7.5, (float)myY - 20, 15, 20);
      ellipse((float)myX + 2.5, (float)myY - 20, 15, 20);  
    }
   //body
    fill(#FAFF08);
    ellipse((float)myX, (float)myY, 50, 35);
    //face
    if(myX < 250){
      fill(0);
      ellipse((float)myX - 15, (float)myY - 3, 5, 5);
      bezier((float)myX - 5, (float)myY - 17, (float)myX + 30, (float)myY - 15, (float)myX + 30, (float)myY + 15, (float)myX - 5, (float)myY + 17);
      fill(#FAFF08);
      bezier((float)myX + 5, (float)myY - 17, (float)myX + 30, (float)myY - 15, (float)myX + 30, (float)myY + 15, (float)myX + 5, (float)myY + 17);
      fill(0);
      bezier((float)myX + 15, (float)myY - 15, (float)myX + 30, (float)myY - 5, (float)myX + 30, (float)myY + 5, (float)myX + 15, (float)myY + 15);
    } else {
      fill(0);
      ellipse((float)myX + 15, (float)myY - 3, 5, 5);
      bezier((float)myX + 5, (float)myY - 17, (float)myX - 30, (float)myY - 15, (float)myX - 30, (float)myY + 15, (float)myX + 5, (float)myY + 17);
      fill(#FAFF08);
      bezier((float)myX - 5, (float)myY - 17, (float)myX - 30, (float)myY - 15, (float)myX - 30, (float)myY + 15, (float)myX - 5, (float)myY + 17);
      fill(0);
      bezier((float)myX - 15, (float)myY - 15, (float)myX - 30, (float)myY - 5, (float)myX - 30, (float)myY + 5, (float)myX - 15, (float)myY + 15);
    }
  }
}
