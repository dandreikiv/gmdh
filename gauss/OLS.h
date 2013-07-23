//
//  OLS.h
//  gauss
//
//  Created by Dmitriy Andreykiv on 7/23/13.
//  Copyright (c) 2013 XS2TheWorld. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OLS : NSObject

- (double *)ols:(double **)x_values
       y_values:(double *)y_values
       dataSize:(CGSize)dataSize;


@end
