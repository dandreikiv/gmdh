//
//  gauss.h
//  gauss
//
//  Created by Dmitriy Andreykiv on 4/19/13.
//  Copyright (c) 2013 XS2TheWorld. All rights reserved.
//

#ifndef gauss_gauss_h
#define gauss_gauss_h

double **two_dimension_array_with_size(int size);

double *gauss_n(double **x, double *b, int size);

int check_if_matrix_is_correct(double **x, double *b, int size);
void swap_rows_in_matrix(double **x, int source, int destination, int size);
void p_printMatrix(double **x, int size);
void p_printBMatrix(double *m, int size);

#endif
