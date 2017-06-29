import gifAnimation.*;
GifMaker gifExport;

void setup() {
  size(800, 800);

  gifExport = new GifMaker(this, "data/image.gif");//「data」フォルダーに「image.gif」というgifファイルができる
  gifExport.setRepeat(0); 
  gifExport.setTransparent(0, 0, 0);
}

void draw() {

  background(0);

  translate(width/2, height/2);

  rotate(radians(frameCount*30));

  //盤の背景

  fill(255, 51, 200);
  strokeWeight(2);
  stroke(0);
  ellipse(0, 0, width, height);


  pushMatrix();
  rotate(radians(15));
  for (int i=0; i<12; i++) {
    rotate(radians(30));
    fill(0);
    rect(0, height/2, -20, -60);
  }
  popMatrix();


  //驚き版のアニメーション部分

  noStroke();//円の線を消す


  //内側の円
  pushMatrix();
  for (int i=0; i<12; i++) {
    rotate(radians(30));
    fill(255);
    ellipse(0, -height/4, 55-i*10, 55-i*10);
  }
  popMatrix();


  //真ん中の円
  pushMatrix();
  for (int i=0; i<12; i++) {
    rotate(radians(30));
    fill(255);
    ellipse(0, 28.5+height/4, 55-i*10, 55-i*10);
  }
  popMatrix();


  //外側の円
  pushMatrix();
  for (int i=0; i<12; i++) {
    rotate(radians(30));
    fill(255);
    ellipse(0, -57.5-height/4, 55-i*10, 55-i*10);
  }
  popMatrix();

  gifExport.setDelay(1);
  gifExport.addFrame();


  //一周したら撮影終了
  if (frameCount==12) {
    gifExport.finish();
    println("finish!");
  }
}