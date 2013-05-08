//
//  Component.h
//  gauss
//
//  Created by Dmitriy Andreykiv on 5/2/13.
//  Copyright (c) 2013 XS2TheWorld. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Layer.h"

@interface Component : Layer {
    double * _data;
    double * _realData;
    double * _params;
    double * _calculatedData;
    int      _size;
    double   _deviation;
}

- (instancetype)initWithData:(double *)data
                    realData:(double *)realData
                        size:(int)size;

- (void)calculate;
- (double)deviation;
- (double *)params;
- (double *)calculatedData;

@end
