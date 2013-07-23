//
//  mnk.c
//  gauss
//
//  Created by Dmitriy Andreykiv on 5/7/13.
//  Copyright (c) 2013 XS2TheWorld. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "array_helpers.h"
#include "gauss.h"


// y = ax + b;
// Returen params as array r[0] = a, r[1] = b;
double * mnk_linear(double * x_array, double * y_array, int size)
{
    /*
     we are goint to crate matrixes
     x:
     [x0_0 x0_1]
     [x1_0 x1_1]
     
     b:
     [b0 b1];
     */
    
    // Calculation of sum of x1^2
    double x0_0 = 0;
    for (int xIdx = 0; xIdx < size; xIdx++) {
        x0_0 += x_array[xIdx] * x_array[xIdx];
    }
    
    // Calculation of sum x1 * x2
    double x0_1 = 0;
    for (int xIdx = 0; xIdx < size; xIdx++) {
        x0_1 += x_array[xIdx];
    }
    
    double x1_0 = x0_1;
    double x1_1 = size;
    
    double b0 = 0;
    for (int yIdx = 0; yIdx < size; yIdx++) {
        b0 += x_array[yIdx] * y_array[yIdx];
    }
    
    double b1 = 0;
    for (int yIdx = 0; yIdx < size; yIdx++) {
        b1 += y_array[yIdx];
    }
    
    double ** x_ = two_dimension_array_with_size(2, 2);
    x_[0][0] = x0_0; x_[0][1] = x0_1;
    x_[1][0] = x1_0; x_[1][1] = x1_1;
    
    double *b_  = (double*)malloc(2 * sizeof(double));
    b_[0] = b0; b_[1] = b1;
    
    double * result = gauss_n(x_, b_, 2);
    
    p_printBMatrix(result, 2);
    
    return result;
}

double averageSum(double *data, int size)
{
    double result = 0;
    for (int idx = 0; idx < size; idx++) {
        result += data[idx] / size;
    }
    
    return result;
}

double standartDeviation(double * mnkParams, int mnkParamsSize, double * column, double * realResults, int rows) {
    
    double average = averageSum(realResults, rows);
    double sum     = 0;
    for (int idx = 0; idx < rows; idx++) {
        double yRez = (column[idx] * mnkParams[0] + mnkParams[1]);
        sum += pow(yRez - average, 2);
    }
    
    double result = sqrt(1.0 / (rows - 1.0) * sum);
    return result;
}


