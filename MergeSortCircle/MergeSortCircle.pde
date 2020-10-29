//This sketch is made by using a merge sort algorithim on a set of values
//those values are drawn as lines starting at the middle of the screen pointing upwards
//the lines are then rotated x amount according to a rotation value stored in rotations[]
//this gives the impression that the values are being wrapped around a circle




//sets the size of the array, the drawing code isnt optimised so itll chunk passed 1000
int n = 500;
float[] arr = new float[n]; //stores the random values to be sorted
float[] rotations = new float[n]; //stores the rotation for each element
float a = 0;
void setup(){
  size(800,800);
  //initialize values and calculate rotations
  for(int i = 0; i < arr.length;i++){
     arr[i] = random(height/2); 
     rotations[i] = map(i,0,arr.length,0,TAU);
  }
}
//the two for loops here could be condensed into one for a performance boost
void draw(){
  background(255);
  stroke(0);
  translate(width/2,height/2);
  for(int i = 0; i < arr.length;i++){
     pushMatrix();
       rotate(rotations[i]);
       line(0,0,0,height/2-arr[i]-50*sin((i/a)-i));
     popMatrix();
  }
  for(int i = 0; i < arr.length/2;i++){
     pushMatrix();
       rotate(-rotations[i]);
       line(0,0,0,height/2-arr[i]+50*cos((i/a)-i));
     popMatrix();
  }
  //changes this to increase the speed of the lines moving up and down
  a += 0.005;
  //this makes a new thread and then sorts the array in that thread
  //otherwise the animation doesnt work
  if(frameCount==1)thread("Msort");
}

public  void Msort(){
   mergeSort(arr,0,arr.length-1); 
  
}

public  void mergeSort(float[] arr, int start, int end){
        if(start < end){
            int mid = (start+end)/2;
            mergeSort(arr, start, mid);
            mergeSort(arr, mid+1, end);
            
            merge(arr,start,mid,end);
        }
    }
    public  void merge(float[] Arr,int start, int mid, int end){
        // create a temp array
        float temp[] = new float[end - start + 1];

        // crawlers for both intervals and for temp
        int i = start, j = mid+1, k = 0;

        // traverse both arrays and in each iteration add smaller of both elements in temp 
        while(i <= mid && j <= end) {
            if(Arr[i] <= Arr[j]) {
                temp[k] = Arr[i];
                k += 1; i += 1;
            }
            else {
                temp[k] = Arr[j];
                k += 1; j += 1;
            }
        }
        // add elements left in the first interval 
        while(i <= mid) {
            temp[k] = Arr[i];
            k += 1; i += 1;
        }

        // add elements left in the second interval 
        while(j <= end) {
            temp[k] = Arr[j];
            k += 1; j += 1;
        }

        // copy temp to original interval
        for(i = start; i <= end; i += 1) {
          delay(1);  
          Arr[i] = temp[i - start];
             
        }
        delay(1);
      
    }

  public void swap(float[]arr,int a,int b){
   delay(1);
    float temp = arr[a];
    arr[a] = arr[b];
    arr[b] = temp;
   
 }
