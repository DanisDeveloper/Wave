Agent[] agents;

float w = 1;

void setup() {
  size(600, 600);
  frameRate(144);
  agents = new Agent[(int)(width / w - 2)];
  for (int i=0; i<agents.length; ++i) {
    agents[i] = new Agent((i+1)*w,height/2, w, 1);
  }
  for (int i=0; i<1; ++i) {
    //agents[i].y = height/2+200 - (i+1)*10;
    //agents[i].mass = 10000000;
  }
  agents[0].y = height/2+500;
  agents[50].y = height/2+500;
  //agents[0].mass = 1000000000;
  //agents[5].y = height/2+10;
}

void draw() {
  background(0);
  for (int i=0; i<agents.length; ++i) {
    agents[i].display(true);
    if (i!=agents.length-1) {
      stroke(255);
      line(agents[i].x, agents[i].y, agents[i+1].x, agents[i+1].y);
    }
    agents[i].step();
    if (i == 0) {
      float s = (agents[i+1].y - agents[i].y)/ agents[i].mass;

      agents[i].speed += s;
      agents[i+1].speed -= s;
    } else if (i == agents.length-1) {
      float s = (agents[i-1].y - agents[i].y)/ agents[i].mass;
      agents[i].speed +=  s;
      agents[i-1].speed -= s;
    } else {
      float s = ((agents[i-1].y + agents[i+1].y)/2 - agents[i].y) / agents[i].mass;
      agents[i].speed += s*2;
      agents[i-1].speed -= s;
      agents[i+1].speed -= s;
    }
  }
}
