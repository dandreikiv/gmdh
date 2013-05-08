//
//  mnk.h
//  gauss
//
//  Created by Dmitriy Andreykiv on 5/7/13.
//  Copyright (c) 2013 XS2TheWorld. All rights reserved.
//

#ifndef gauss_mnk_h
#define gauss_mnk_h

double * mnk_linear(double * x_array, double * y_array, int size);
double averageSum(double *data, int size);
double standartDeviation(double * mnkParams, int mnkParamsSize, double * column, double * realResults, int rows);

#endif
