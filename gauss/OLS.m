//
//  OLS.m
//  gauss
//
//  Created by Dmitriy Andreykiv on 7/23/13.
//  Copyright (c) 2013 XS2TheWorld. All rights reserved.
//

#import "OLS.h"
#import "array_helpers.h"
#import "gauss.h"

@implementation OLS

- (double *)ols:(double **)x_values
       y_values:(double *)y_values
       dataSize:(CGSize)dataSize
{
    double **olsXMatrix = two_dimension_array_with_size(dataSize.width, dataSize.width);
    double *olsYMatrix  = (double *)malloc(sizeof(double) * dataSize.width);
    
    for (int col1 = 0; col1 < dataSize.width; col1++)
    {
        for (int col2 = 0; col2 < dataSize.width; col2++)
        {
            if (col1 <= col2)
            {
                double sum = 0;
                
                for (int row = 0; row < dataSize.height; row++)
                    sum = sum + x_values[row][col1] * x_values[row][col2];
                
                olsXMatrix[col1][col2] = sum;
            }
            else
            {
                olsXMatrix[col1][col2] = olsXMatrix[col2][col1];
            }
        }

        double sum = 0;
        
        for (int row = 0; row < dataSize.height; row++)
            sum = sum + x_values[row][col1] * y_values[row];
        
        olsYMatrix[col1] = sum;
    }
    
    p_printMatrix(olsXMatrix, dataSize.width, dataSize.width);
    p_printBMatrix(olsYMatrix, dataSize.width);
    
    return  gauss_n(olsXMatrix, olsYMatrix, dataSize.width);
}


@end
