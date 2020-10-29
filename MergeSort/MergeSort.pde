
public static float[] arr = new float[5000]; 
void setup(){
  size(800,500);
  for(int i = 0; i<arr.length;i++){
      arr[i] = random(height);
  }
 // Msort();
 
}
int i = 0;
int j = 0;
float a = 0;
void draw(){
  background(255);
for(int i = 0; i < arr.length;i++){
              int colIndex = (int)map(arr[i],0,height,0,colors.length);
              stroke(colors[colIndex]);
              float xPos = map(i,0,arr.length,0,width);
              line(xPos,height,xPos,height-arr[i]);   
            }
 
 if(frameCount == 1)thread("Msort");
   
  //frameRate(30);
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
      
    }
  public void swap(float[]arr,int a,int b){
   delay(1);
    float temp = arr[a];
    arr[a] = arr[b];
    arr[b] = temp;
   
 }
 
 int[] colors = {#73eedc,#a755c2,#776885,#5f1a37,#04030f};
 
