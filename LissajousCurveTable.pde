/*
   boolean flip toggleable by user
 */

boolean flip = true;

float angle = 3*PI/2;
int w = 100;
int cols;
int rows;

Curve[][] curves;

void setup() {
  colorMode(HSB);
  fullScreen(P2D);
  cols = width/w-1;
  rows = height/w-1;

  curves = new Curve[rows][cols];

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      curves[j][i] = new Curve();
    }
  }
}

void draw() {
  background(0);
  stroke(255);

  noFill();
  float d = .9*w-10;
  float r = d/2;
  for (int i = 0; i < cols; i++) {
    float cx = i*w+3*w/2;
    float cy = w/2;

    stroke(255);
    strokeWeight(1);
    ellipse(cx, cy, d, d);

    float x = r*cos(angle*(i+1));
    float y = r*sin(angle*(i+1));

    strokeWeight(8);
    point(cx+x, cy+y);

    strokeWeight(1);
    stroke(255, 50);

    line(cx+x, 0, cx+x, height);

    angle+=.002;

    for (int j = 0; j < rows; j++) {
      curves[j][i].setX(cx+x);
    }
  }

  for (int j = 0; j < rows; j++) {
    float cy = j*w+3*w/2;
    float cx = w/2;

    stroke(255);
    strokeWeight(1);
    ellipse(cx, cy, d, d);

    float x = r*cos(angle*(j+1));
    float y = r*sin(angle*(j+1));

    strokeWeight(8);
    point(cx+x, cy+y);

    strokeWeight(1);
    stroke(255, 50);

    line(0, cy+y, width, cy+y);


    for (int i = 0; i < cols; i++) {
      curves[j][i].setY(cy+y);
    }
  }

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      curves[j][i].addPoint();
      curves[j][i].show();
    }
  }

  if (flip && angle> TWO_PI + 3*HALF_PI) {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        curves[j][i].reset();
      }
    }
    
    angle = 3*HALF_PI;
  }
}