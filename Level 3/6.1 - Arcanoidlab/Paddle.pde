class Paddle extends Being {
  float w, h;
  Body body;
  float speed;

 Paddle(int x, int y){
    super(new Rectangle(new PVector(x, y), 100, 20));
    w = ((Rectangle)shape).rw;
    h = ((Rectangle)shape).rh;
    //STEP2 create a body;
    createBody();
    speed = 30;
  }
  
  void createBody(){
    //1. Create a body definition (position, and type)
    //type = DYNAMIC, STATIC, KINEMATIC
    BodyDef bd = new BodyDef();
    bd.position.set(b2dWorld.coordPixelsToWorld(location.x, location.y));
    bd.type = BodyType.KINEMATIC;
    //2. Create a body using the body definition
    body = b2dWorld.createBody(bd);
    //3. Create a geometry (a shape = CircleShape, PolygonShape, ChainShape)
    PolygonShape ps = new PolygonShape();
    float box2dw = b2dWorld.scalarPixelsToWorld(w/2);
    float box2dh = b2dWorld.scalarPixelsToWorld(h/2);
    ps.setAsBox(box2dw, box2dh);
    //4. Create a fixture (shape, density, friction, restitution)
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;
    //5. put everything together
    body.createFixture(fd);
  }

  void step() {
  }
  
  void move(boolean right){
    if(right){
      body.setLinearVelocity(new Vec2(speed, 0));
    }else{
      body.setLinearVelocity(new Vec2(-speed, 0));
    }
  }
  
  void drawme() {
    //STEP3 ask b2dWorld where the box is
    Vec2 pos = b2dWorld.getBodyPixelCoord(body);
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    rectMode(CENTER);
    fill(GREEN);
    rect(0,0,w,h); 
    popMatrix();
  }
}
