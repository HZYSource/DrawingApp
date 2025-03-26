int sideBarWidth = 80;
int sideBarCentre;
int pDia = 50;

int drawSizeAdjDia = 60;
int drawSizeYPos = 800;

//Courtesy to https://imagecolorpicker.com/
int ccDia = 30;
int CCInterval;
int CCFirst = 180;
int CCLast = 600;
int CCGap = 60;
color currentColour;
color c1 = color(228,232,210);//Weird White
color c2 = color(231,161,31);//Orange
color c3 = color(50,71,142);//sky blue
color c4 = color(126,97,21);//poopoo brown
color c5 = color(24,24,23);//dark black
color c6 = color(237,205,86);//egg yellow
color c7 = color(104,132,170);//lighter blue
color c8 = color(255);//White.

void setup(){
  frameRate(120);
  noStroke();
  //app size
  size(2000,1200);
  //canvas
  fill(255);
  rect(0,0,width-sideBarWidth,height);

}

void draw(){
  sideBarCentre = (width-sideBarWidth)+(sideBarWidth/2);
  noStroke();
  
  //Drawing
  if(mousePressed){
    fill(currentColour);
    ellipse(mouseX,mouseY,drawSizeAdjDia-10,drawSizeAdjDia-10);
  }
  
  //sidebar
  fill(50);
  rect(width-sideBarWidth,0,sideBarWidth,height);
  
  //profile
  fill(255);
  ellipse(sideBarCentre, 50,pDia,pDia);
  fill(0);
  textSize(30);
  textAlign(CENTER,CENTER);
  text(":D",sideBarCentre, 50);
  
  //colours
  for(CCInterval = CCFirst; CCInterval <= CCLast; CCInterval = CCInterval + CCGap){
    fill(100);//filler
    ellipse(sideBarCentre, CCInterval,ccDia+10,ccDia+10);//the colour
    
    if(CCInterval == 180){
      fill(c1);
    }
    if(CCInterval == 240){
      fill(c2);
    }
    if(CCInterval == 300){
      fill(c3);
    }
    if(CCInterval == 360){
      fill(c4);
    }
    if(CCInterval == 420){
      fill(c5);
    }
    if(CCInterval == 480){
      fill(c6);
    }
    if(CCInterval == 540){
      fill(c7);
    }
    if(CCInterval == 600){
      fill(c8);
    }
    ellipse(sideBarCentre, CCInterval,ccDia,ccDia);//the colour
    //println(CCInterval);
  }
  
  //CurrentColour
  fill(100);
  rect(sideBarCentre-15,110,30,30);
  fill(currentColour);
  rect(sideBarCentre-13,112,26,26);
  
  //SizeAdjustor
  fill(100);
  triangle(sideBarCentre-15,800,sideBarCentre+15,800,sideBarCentre,1000);
  fill(240);
  ellipse(sideBarCentre,drawSizeYPos,drawSizeAdjDia,drawSizeAdjDia);
  fill(100);
  ellipse(sideBarCentre,drawSizeYPos,drawSizeAdjDia-10,drawSizeAdjDia-10);
  if(drawSizeYPos <= 800){//keeps scroller inside
    drawSizeYPos = drawSizeYPos++;
    drawSizeYPos = 800;
  }
  if(drawSizeYPos >= 1000){
    drawSizeYPos = drawSizeYPos--;
    drawSizeYPos = 1000;
  }
  drawSizeAdjDia = 60-(drawSizeYPos-800)/5;//size reference
  textSize(20);
  textAlign(CENTER,CENTER);
  text(drawSizeAdjDia-10,sideBarCentre, 1020);
  
}



void mouseDragged() {
  //SizeAdjusterLogic
  if(dist(mouseX,mouseY,sideBarCentre,drawSizeYPos)<25 && mouseY>799 && mouseY<1000){//detects when mouse drags size adjuster
    drawSizeYPos = mouseY;
  }
}
void mousePressed() {   //<>//
  //ColourPickerLogic
  if(dist(sideBarCentre,CCFirst,mouseX,mouseY)<30){
    currentColour = c1;
  }
  if(dist(sideBarCentre,CCFirst+CCGap,mouseX,mouseY)<30){
    currentColour = c2;
  }
  if(dist(sideBarCentre,CCFirst+CCGap*2,mouseX,mouseY)<30){
    currentColour = c3;
  }
  if(dist(sideBarCentre,CCFirst+CCGap*3,mouseX,mouseY)<30){
    currentColour = c4;
  }
  if(dist(sideBarCentre,CCFirst+CCGap*4,mouseX,mouseY)<30){
    currentColour = c5;
  }
  if(dist(sideBarCentre,CCFirst+CCGap*5,mouseX,mouseY)<30){
    currentColour = c6;
  }
  if(dist(sideBarCentre,CCFirst+CCGap*6,mouseX,mouseY)<30){
    currentColour = c7;
  }
  if(dist(sideBarCentre,CCFirst+CCGap*7,mouseX,mouseY)<30){
    currentColour = c8;
  }

}
