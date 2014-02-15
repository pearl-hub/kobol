
-  c



## Allocazione dinamica della memoria (DMA) per matrici bi-dimensionali





- include <stdio.h>
- include <malloc.h>

int** new_int_matrix(int size_x, int size_y)
{
int** matrix;
matrix = calloc(size_x, 1+sizeof(int*)); // alloc one extra ptr
int i
for(i = 0,i<size_x; i++) {
matrix[i] = calloc(size_y, sizeof(int));
}
matrix[size_x] = NULL; // set the extra ptr to NULL

return matrix;
}

void free_mem(int** matrix){
// keep looping until you find the NULL one
int i;
for(i=0; matrix[i] != NULL; i++ ) {
free( matrix[i] );
}
free( matrix );

}

void main(){
int** first_matrix = new_int_matrix(1000,1000);

int i;
for(i = 0;i<1000;i++) {
int j;
for(j = 0;j<1000;j++) {
first_matrix[i][j] = i*10+j;
}
}

printf("9:3 %d - 4:6 %d \n", first_matrix[9][3], first_matrix[4][6]);
free_mem(first_matrix);
}






