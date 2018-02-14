Button[] numButtons = new Button[10];
Button[] opButtons = new Button[8];
String ls, rs; //help to construct 2 pieces of info that goes into calculator: left side/right side.
float ans; //answer
char op; //Operator
boolean left, eq; //Left of Operator, equal button
void setup() {
  size(375, 550);
  ls = " ";
  rs = " ";
  ans = 0.0;
  op = ' ';
  left = true;
  eq = false;
  //number buttons-done
  numButtons[0] = new Button(25, 387, 50, 50).asNumber(0);
  numButtons[1] = new Button (25, 325, 50, 50).asNumber(1);
  numButtons[2] = new Button(88, 325, 50, 50).asNumber(2);
  numButtons[3] = new Button (150, 325, 50, 50).asNumber(3);
  numButtons[4] = new Button (25, 263, 50, 50).asNumber(4);
  numButtons[5] = new Button (88, 263, 50, 50).asNumber(5);
  numButtons[6] = new Button (150, 263, 50, 50).asNumber(6);
  numButtons[7] = new Button (25, 200, 50, 50).asNumber(7);
  numButtons[8] = new Button (88, 200, 50, 50).asNumber(8);
  numButtons[9] = new Button (150, 200, 50, 50).asNumber(9);
  //operation buttons-not finished-how to do clear?
  opButtons[0]= new Button (294, 450, 68, 75).asOperator('c'); 
  opButtons[1]= new Button (150, 387, 50, 50).asOperator('n'); //I want to make you able to make the unkown number negative if they didn't type the number on the screen yet. 
  opButtons[2]= new Button (25, 450, 175, 75 ).asOperator('=');//I want the equal to clear the screen when another button is pushed after equal is pushed
  opButtons[3]= new Button (225, 200, 56, 50 ).asOperator('+');
  opButtons[4]= new Button (294, 200, 56, 50 ).asOperator('-');
  opButtons[5]= new Button (225, 263, 56, 50 ).asOperator('*'); // how can the display show × instead of *?
  opButtons[6]= new Button (294, 263, 56, 50 ).asOperator('/');
  opButtons[7]= new Button (88, 387, 50, 50 ).asOperator('.');
}
void draw() {
  background(20);
  for (int i=0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover();
  }
  for (int i=0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover();
  }
  updateDisplay();
}
void mousePressed() {
  for (int i=0; i<numButtons.length; i++) {
    if (numButtons[i].hov &&left) {
      ls += numButtons[i].v;
    } else if (numButtons[i].hov && !left) {
      rs += numButtons[i].v;
    }
  }
  for (int i=0; i<opButtons.length; i++) {
    if (opButtons[i].hov && opButtons[i].o =='c') {
      performClear();
    } else if (opButtons[i].hov && opButtons[i].o =='n') {
      if (left) {
        ls = str(float(ls)*-1);
      } else {
        rs = str(float(rs)*-1);
      }
    } 
    //HOW CAN I MAKE EQUALS RESET THE SCREEN AFTER ANOTHER BUTTON IS PUSHED?
    /*else if (opButtons[i].hov && opButtons[i].o =='=') {
     //I want the equal to clear the screen when another button is pushed after clear
     if (eq){
     eq=true;
     performCalc();
     left= true;
     } 
     }*/
    else if (opButtons[i].hov && opButtons[i].o =='=') {
      //I want the equal to clear the screen when another button is pushed after clear
      eq=true;
      performCalc();
      left= true;
    } else if (opButtons[i].hov && opButtons[i].o =='+') {
      left = false;
      op=opButtons[i].o;
      rs="";
    } else if (opButtons[i].hov && opButtons[i].o =='-') {
      left = false;
      op=opButtons[i].o;
      rs="";
    } else if (opButtons[i].hov && opButtons[i].o =='*') {
      left = false;
      op=opButtons[i].o;
      rs="";
    } else if (opButtons[i].hov && opButtons[i].o =='/') {
      left = false;
      op=opButtons[i].o;
      rs="";
    } else if (opButtons[i].hov && opButtons[i].o =='.') {
      if (left) {
        ls += opButtons[i].o;
      } else {
        rs += opButtons[i].o;
      }
    }
  }
}
void updateDisplay() {
  textAlign(LEFT);
  fill(201, 252, 248);
  rect(25, 25, 325, 163);
  fill(255);
  textSize(25);
  text(ls + " " + op + " " + rs, 30, 140);
  text(ans, 75, 180);
}
void performClear() {
  ls = " ";
  rs = " ";
  op = ' '; 
  ans = 0.0;
  left = true;
  eq = false;
}
void performCalc() {
  switch(op) {
  case '+':
    ans = float(ls)+float(rs);
    left = true;
    break;

  case'-':
    ans = float(ls)-float(rs);
    left = true;
    break;

  case'*':
    ans = float(ls)*float(rs);
    left = true;
    break;

  case'/':
    ans = float(ls)/float(rs);
    left = true;
    break;
  }
}