//
//  array_helpers.c
//  gauss
//
//  Created by Dmitriy Andreykiv on 5/7/13.
//  Copyright (c) 2013 XS2TheWorld. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

double **two_dimension_array_with_size(int rows, int columns){
    // Allocates memory for rows.
    double **result = (double**)malloc(rows * sizeof(double*));
    // Allocates memory for cells in each row.
    for (int rowIdx = 0; rowIdx < rows; rowIdx++) {
        result[rowIdx] = (double*)malloc(columns * sizeof(double));
    }
    return result;
}



void swap_rows_in_matrix(double **x, int source, int destination, int size) {
    for (int col = 0; col < size; col++) {
        double t = x[source][col];
        x[source][col] = x[destination][col];
        x[destination][col] = t;
    }
}

void p_printMatrix(double **x, int rows, int columns){
    for (int rowIdx = 0; rowIdx < rows; rowIdx++) {
        printf("[");
        for (int colIdx = 0; colIdx < columns; colIdx++) {
            printf("%2.2f ", x[rowIdx][colIdx]);
        }
        printf("]\n");
    }
    printf("--------------------------------\n");
}

void p_printBMatrix(double *m, int size){
    printf("[ ");
    for (int i = 0; i < size; i++) { printf("%f ", m[i]); };
    printf("]\n\n");
}

void copyFrom(double * from, double * to, int size)
{
    for (int idx = 0; idx < size; idx++) {
        to[idx] = from[idx];
    }
}

double * columnWithNumber(int column, double **array, int rows,  int columns) {
    
    double *result = (double*)malloc(rows * sizeof(double));
    
    for (int idx = 0; idx < rows; idx++) {
        result[idx] = array[idx][column];
    }
    
    return result;
}