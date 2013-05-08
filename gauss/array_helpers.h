//
//  array_helpers.h
//  gauss
//
//  Created by Dmitriy Andreykiv on 5/7/13.
//  Copyright (c) 2013 XS2TheWorld. All rights reserved.
//

#ifndef gauss_array_helpers_h
#define gauss_array_helpers_h

double **two_dimension_array_with_size(int rows, int columns);
void swap_rows_in_matrix(double **x, int source, int destination, int size);
void p_printMatrix(double **x, int rows, int columns);
void p_printBMatrix(double *m, int size);
void copyFrom(double * from, double * to, int size);
double * columnWithNumber(int column, double **array, int rows, int columns);


#endif
