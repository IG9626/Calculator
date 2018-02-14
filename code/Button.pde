class Button {
  //Member variables also curly Q need to suround entire code
  int x, y, w, h, v; //position, Dimension and value
  char o;
  boolean hov, num; //hover
  //Constructor
  Button(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  Button asNumber(int v) {
    num = true;
    this.v = v;
    return this;
  }
  Button asOperator(char o) {
    num = false;
    this.o = o;
    return this;
  }

  //Dislay method
  void display() {
    //fill(230);
    /*THIS WILL DETECT WETHER THE MOUSE IS HOVERING OVER A BOTTON-
     -AND LIGHTEN/DARKEN THE BACKGROUND OF THE BUTTON:*/
    if (hov) {
      fill(20);
      strokeWeight(3);
      stroke(222, 252, 250);
      rect(x, y, w, h);
    } else {
      fill(20);
      strokeWeight(3);
      stroke(3, 255, 232);
      rect(x, y, w, h);
    }
    //stroke(0);
    //rect(x+20,y-20,w,h);
    //fill(230);
    //TEXT PLACEMENT FOR BUTTONS:
    textSize(18);
    textAlign(LEFT);
    if (num) {
      fill(255);
      text(v, x+5, y+h-4);
    } else {
      fill(255);
      if (o == 'n') {
        text("+/-", x+7, y+h-5);
      } else if (o == 'c') {
        text("CA", x+5, y+h-4);
      } else if (o == '=') {
        textSize(30);
        textAlign(CENTER, TOP);
        text("equals", x+85, y+15);
      } else if (o == '+') {
        textSize (18);
        textAlign(LEFT);
        text("+", x+5, y+h-4);
      } else if (o == '-') {
        textSize (18);
        textAlign(LEFT);
        text("-", x+5, y+h-4);
      } else if (o == '*') {
        textSize (18);
        textAlign(LEFT);
        text("×", x+5, y+h-4);
      } else if (o == '/') {
        textSize (18);
        textAlign(LEFT);
        text("÷", x+5, y+h-4);
      } else if (o == '.') {
        textSize (18);
        textAlign(LEFT);
        text(".", x+5, y+h-4);
      }
    }
  }
  //Hover method
  void hover() {
    hov = mouseX>x && mouseX<x+w && mouseY>y && mouseY<y+h;
  }
}