int[][]arr = new int[100][160];
int[]mainIndex = new int[100], searchIndex = new int[100];
boolean toggle = true, rowsSorted[] = new boolean[100];

void setup(){
  size(800, 500);
  frameRate(120);
  colorMode(HSB, 255, 255, 255);
  noStroke();
  reset();
  drawArray();
}

void draw(){
  // frameRate (120);
  for(int i = 0; i<100; i++){
    if(mainIndex[i]<160){
      if(insertionSort(arr[i], searchIndex[i])){
        //println ("main = " + mainIndex + ", search = " + searchIndex);
        mainIndex[i]++;
        searchIndex[i] = mainIndex[i];
      } 
      else searchIndex[i]--;
    } 
    else{
      rowsSorted[i] = true;
      boolean reset = true;
      for(int j = 0; j<100; j++){
        if(!rowsSorted[j]){
          reset = false;
          break;
        }
      } 
      if(reset)reset();
    }
  }
  drawArray();
}

void mouseReleased(){
  if(toggle)noLoop();
  else loop();
  toggle = !toggle;
}

void keyReleased(){
  if(toggle)noLoop();
  else loop();
  toggle = !toggle;
}

public boolean insertionSort(int[]arr, int index){
  int temp = arr[index];
  if(index-1>=0&&arr[index-1]>temp){
    arr[index] = arr [index-1];
    arr[index-1] = temp;
    return false;
  } 
  else return true;
}

public int[]randomArr(int n) {
  int[]arr = new int [n];
  for(int i = 0; i<n; i++){
    arr[i] = (int)random(0.0, 256.0);
  }
  return arr;
}

public void reset(){
  for(int i = 0; i<100; i++){
    mainIndex[i] = 1;
  }
  for(int i = 0; i<100; i++){
    searchIndex[i] = mainIndex[i];
  }
  for(int i = 0; i<100; i++){
    arr[i] = randomArr(160);
  }
}

public void drawArray(){
  background(0);
  for(int i = 0; i<100; i++){
    for(int j = 0; j<160; j++){
      fill(arr[i][j], 159, 232);
      rect(j*5, i*5, 5, 5);
    }
  }
}
