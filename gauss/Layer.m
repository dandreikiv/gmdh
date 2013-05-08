 //
//  Layer.m
//  gauss
//
//  Created by Dmitriy Andreykiv on 5/2/13.
//  Copyright (c) 2013 XS2TheWorld. All rights reserved.
//

#import "Layer.h"
#import "Component.h"

@implementation Layer

- (instancetype)initWithComponents:(NSArray *)components
{
    self = [super init];
    if (self) {
        _components = [NSMutableArray arrayWithArray:components];
    }
    
    return self;
}


- (void)calculate
{
    for (Component * component in _components) {
        [component calculate];
        printf("deviation:%f\n\n", component.deviation);
    }

    [_components sortUsingComparator:^NSComparisonResult(Component * obj1, Component * obj2) {
        if (obj1.deviation > obj2.deviation)
            return NSOrderedDescending;
        else if (obj2.deviation < obj1.deviation)
            return NSOrderedAscending;
        return NSOrderedSame;
    }];

    for (Component * component in _components) {
        printf("deviation:%f\n\n", component.deviation);
    }
}


@end
