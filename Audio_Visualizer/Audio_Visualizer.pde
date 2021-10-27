import processing.sound.*;
SoundFile file;
FFT fft;
float speed = 0;
float smoothingFactor = .1;
float amp;
float nextamp;
int bands = 32;
float[] spectrum = new float[bands];
float w;
float[] sum = new float[bands];
void setup(){
  size(1000,600, P3D);
  fft = new FFT(this, bands);
  file = new SoundFile(this, "testfile.MP3");
  fft.input(file);
  file.play();
  w = width/bands;
}

void draw(){
  background(255);
  fft.analyze(spectrum);
  camera(width/2,500,(height/2)/tan(PI/6) + 500, width/2,height/2,0,0,1,0);
  translate(width/2, height/2);
  rotateY(speed);
  translate(-width/2, -height/2);
  for(int i = 0; i < bands; i++){
    sum[i] += (spectrum[i] - sum[i]) * smoothingFactor;
    //float y = map(amp, 0, 1, height, 0);
    push();
    //translate(i*w, height);
    beginShape();
    vertex(i*w, height);
    vertex(i*w + w, height);
    vertex(i*w + w, (height - sum[i]*height));
    vertex(i*w, (height- sum[i]*height));
    endShape(CLOSE);
    //box(w, -sum[i]*height, 30);
    pop();
    speed += .00005;
  }
  
}

float[] center(float[] array){
  
}
