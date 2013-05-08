//
//  Component.m
//  gauss
//
//  Created by Dmitriy Andreykiv on 5/2/13.
//  Copyright (c) 2013 XS2TheWorld. All rights reserved.
//

#import "Component.h"
#import "array_helpers.h"
#import "mnk.h"

@implementation Component

- (instancetype)initWithData:(double *)data
                    realData:(double *)realData
                        size:(int)size
{
    self = [super init]; 
    if (self) {
        _size = size;
        
        _data     = (double*)malloc(size * sizeof(double));
        _realData = (double*)malloc(size * sizeof(double));
        
        copyFrom(data, _data, size);
        copyFrom(realData, _realData, size);
        
        p_printBMatrix(_data, size);
        p_printBMatrix(_realData, size);
    }
    return self;
}

- (void)calculate
{
    _params  = mnk_linear(_data, _realData, _size);
    _deviation = standartDeviation(_params, 2, _data, _realData, _size);
}

- (void)dealloc
{
    free(_data);
    free(_realData);
    free(_params);
}

- (double *)params {
    return _params;
}

- (double)deviation {
    return _deviation;
}

- (double *)calculatedData {
    _calculatedData = (double*)malloc(_size * sizeof(double));
    for (int idx = 0; idx < _size; idx++) {
        _calculatedData[idx] = _data[idx] * _params[0] + _params[1];
    }
    return _calculatedData;
}

@end
