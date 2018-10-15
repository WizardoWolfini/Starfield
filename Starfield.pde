ArrayList<Particle> ParticleArray = new ArrayList<Particle>();
void setup()
{
  background(0);
  size(1080,720);
  noStroke();
	for(int i = 0; i <= 3; i++){
  if(i == 0){
  ParticleArray.add(new JumboParticle());
  }else if(i == 1){
  ParticleArray.add(new OddballParticle());
  } else{
  ParticleArray.add(new NormalParticle());
  }
  }
}
void draw()
{
  background(0);
	for(Particle Particle : ParticleArray){
  Particle.show();
  Particle.move();
  }
  if(ParticleArray.size() <= 50){
  ParticleArray.add(new NormalParticle());
  }
}
class NormalParticle implements Particle
{
  double myX,myY,speedx, speedy;
  int colornum;
  int taillength = 1;
  float size = 1;
  NormalParticle(){
  initiate();
  }
  void initiate(){
  myX = 540;
  myY = 360;
  double angle = Math.random()*6.28;
  double speed = (Math.random()*10)+2;
  speedx = Math.cos(angle) * speed;
  speedy = Math.sin(angle) * speed;
  myX += speedx *3;
  myY += speedy *3;
  colornum = 0;
      taillength = 1;
    size = 0;
  }
  void show(){
   for(int i = 0; i <= taillength; i++){
     fill(colornum/2 - colornum/2 * i / taillength);
      ellipse((float)(myX - speedx * .2* i), (float)(myY - speedy * .2 * i),size - i * .02,size - i * .02);
   }
   fill(colornum);
   ellipse((float)myX,(float)myY,size,size);
   taillength++;
  }
  void move(){
  myX = myX + speedx;
  myY = myY + speedy;
  speedx *= 1.02;
  speedy *= 1.02;
  if(colornum < 249){
  colornum += 5;
  size += .05;
  }
  if(myY >= 720 || myY <= 0 || myX >= 1080 || myX <= 0){
    initiate();
  }
  }
}
interface Particle
{
	public void show();
  public void move();
}
class OddballParticle extends NormalParticle
{
  double[] previousx = new double[10];
  double[] previousy = new double[10];
  int[] colora = new int[10];
  int indexn = 0;
  int lengtha = 0;
  OddballParticle(){
    myX = 540;
  myY = 360;
  double angle = Math.random()*6.28;
  double speed = (Math.random()*10)+2;
  speedx = Math.cos(angle) * speed;
  speedy = Math.sin(angle) * speed;
  myX += speedx *3;
  myY += speedy *3;
  colornum = 0;
      taillength = 1;
    size = 0;
  }
	void show(){
  indexn++;
  if(indexn > 9){
  indexn = 0;
  }
  previousx[indexn] = myX;
  previousy[indexn] = myY;
  colora[indexn] = 255;
  for(int i = 0; i < lengtha; i++){
   fill(colora[i]); 
  rect((float)previousx[i],(float)previousy[i],10,10);
  colora[i] -= 25;
  }
    if(lengtha <= 9){
  lengtha++;
  }
  fill(colornum);
  rect((float)myX,(float)myY,10,10);
  }
  void initiate(){
    if(myX < 0 || myX > 1080){
  speedx *= -1;
  }
  if(myY < 0 || myY > 720){
  speedy *= -1;
  }
  }
  void move(){
  myX = myX + speedx;
  myY = myY + speedy;
  if(colornum < 249){
  colornum += 5;
  size += .05;
  }
  }
}  
class JumboParticle extends OddballParticle
{
	void show(){
  indexn++;
  if(indexn > 9){
  indexn = 0;
  }
  previousx[indexn] = myX;
  previousy[indexn] = myY;
  colora[indexn] = 255;
  for(int i = 0; i < lengtha; i++){
 fill(colora[i]); 
  ellipse((float)previousx[i],(float)previousy[i],15,15);
  colora[i] -= 10;
  }
    if(lengtha <= 9){
  lengtha++;
  }
  fill(colornum);
  ellipse((float)myX,(float)myY,15,15);
  }
}
