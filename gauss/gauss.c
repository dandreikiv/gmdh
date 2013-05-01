//
//  gauss.c
//  gauss
//
//  Created by Dmitriy Andreykiv on 4/19/13.
//  Copyright (c) 2013 XS2TheWorld. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include "gauss.h"


double **two_dimension_array_with_size(int size){
    double **result = (double**)malloc(size * sizeof(double*));
    for (int i = 0; i < size; i++) {
        result[i] = (double*)malloc(size * sizeof(double));
    }
    return result;
}

double *gauss_n(double **x, double *b, int size)
{
    if (x == NULL) {
        printf("X matrix cannot be NULL");
        return NULL;
    }
    
    if (b == NULL) {
        printf("B matrix cannot be NULL");
        return NULL;
    }
    
    if (size == 0 && size >= 2) {
        printf("Maxtrix size should be at least 2x2");
        return NULL;
    }
    
    double *result = malloc(size * sizeof(double));
    
    for (int ki = 0; ki < size; ki++)
    {
        for (int i = ki + 1; i < size; i++)
        {
            double k = ( x[i][ki] / x[ki][ki] ) * (-1);
            for (int j = ki; j < size; j++)
            {
                x[i][j] = x[i][j] + x[ki][j] * k;
            }
            b[i] = b[i] + b[ki] * k;
        }
    }
    
    for (int i = size - 1; i >= 0; i--)
    {
        double r = 0;
        for (int  j = size - 1 ; j > i; j--)
        {
            r = r + x[i][j] * result[j];
        }
        result[i] = (b[i] - r) / x[i][i];
    }
    return result;
}

int check_if_matrix_is_correct(double **x, double *b, int size)
{
    if (x == NULL) return 0;
    if (size == 0) return 0;
    
    int row = 1;
    while (x[0][0] == 0 && row < size) {
        // Swap X matrix rows
        swap_rows_in_matrix(x, 0, row, size);
        
        // Swap results
        double t = b[0];
        b[0] = b[row];
        b[row] = t;
        
        p_printMatrix(x, size);
        p_printBMatrix(b, size);
        
        row++;
    }
    
    return x[0][0] != 0;
}

void swap_rows_in_matrix(double **x, int source, int destination, int size) {
    for (int col = 0; col < size; col++) {
        double t = x[source][col];
        x[source][col] = x[destination][col];
        x[destination][col] = t;
    }
}

void p_printMatrix(double **x, int size){
    for (int i = 0; i < size; i++) {
        printf("[");
        for (int j = 0; j < size; j++) {
            printf("%2.2f ", x[i][j]);
        }
        printf("]\n");
    }
    printf("--------------------------------\n");
}

void p_printBMatrix(double *m, int size){
    printf("[");
    for (int i = 0; i < size; i++) { printf("%f ", m[i]); };
    printf("]\n\n");
}