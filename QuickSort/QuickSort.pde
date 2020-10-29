float[] arr = new float[1600]; 
void setup(){
  fullScreen();
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
for(int i = 0; i < arr.length;i++){
              int colIndex = (int)map(arr[i],0,height,0,colors.length);
              stroke(colors[colIndex]);
              float xPos = map(i,0,arr.length,0,width);
              line(xPos,height,xPos,height-arr[i]);   
            }
 
 if(frameCount == 1)thread("Qsort");
   
  //frameRate(3);
}
 public void sort(float[] arr, int low, int high){
   if (low < high) 
        { 
            /* pi is partitioning index, arr[pi] is  
              now at right place */
            int pi = partition(arr, low, high); 
            
         
           // delay(100);
  
            // Recursively sort elements before 
            // partition and after partition 
            sort(arr, low, pi-1); 
            sort(arr, pi+1, high); 
        } 
   }
 public void Qsort(){
    sort(arr,0,arr.length-1); 
   
 }
 
 int partition(float arr[], int low, int high) 
    { 
        float pivot = arr[high];  
        int i = (low-1); // index of smaller element 
        for (int j=low; j<high; j++) 
        { 
            // If current element is smaller than the pivot 
            if (arr[j] < pivot) 
            { 
                i++; 
  
                // swap arr[i] and arr[j] 
               swap(arr,i,j);
            } 
        } 
  
        // swap arr[i+1] and arr[high] (or pivot) 
        swap(arr,i+1,high);
  
        return i+1; 
    } 
 
 
  public void swap(float[]arr,int a,int b){
   delay(1);
    float temp = arr[a];
    arr[a] = arr[b];
    arr[b] = temp;
   
 }
 
 int[] colors = {#6622cc,#a755c2,#b07c9e,#b59194,#d2a1b8};
 
