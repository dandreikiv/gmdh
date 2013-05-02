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

- (void)calculateWithData:(id)data
{
    for (Component * component in components_) {
        [component calculateWithData:data];
    }
}

@end
