float[] arr = new float[550]; 
void setup(){
  size(800,500);
  for(int i = 0; i<arr.length;i++){
      arr[i] = random(height);
  }
}
int i = 0;
int j = 0;
float a = 0;
void draw(){
  background(0);
  fill(255);
  stroke(255);
  strokeWeight(1.25);
  for(int n = 0; n < 500;n++){
    if(i < arr.length){
      if(arr[i] < arr[j])Swap(arr,i,j);
    j++;
    if(j >=arr.length-1){
     j = 0;
     i++;
    }
    }
  }
 
  for(int i = 0; i < arr.length;i++){
    if(i == j)stroke(255,0,0); else stroke(255);
    float xPos = map(i,0,arr.length,0,width);
    line(xPos,height,xPos,height-arr[i]);
    
  }
 // println(i,j);
  
  
}
 public void Swap(float[]arr,int a,int b){
   // delay(20);
    float temp = arr[a];
    arr[a] = arr[b];
    arr[b] = temp;
  }
 
