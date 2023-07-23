class Agent {
  float x;
  float y;
  float speed=0; // скорость только вертикальная
  float w = 10;
  float mass = 1;


  Agent(float _x, float _y, float _w, float _mass) {
    x = _x;
    y = _y;
    w = _w;
    mass = _mass;
  }

  void step() {
    y += speed/frameRate;
  }

  void display(boolean point) {
    if (point) {

      stroke(255);
      point(x, y);
    } else {
      fill(255);
      stroke(0);
      strokeWeight(1);
      rect(x, y, w, w);
    }
  }
}
