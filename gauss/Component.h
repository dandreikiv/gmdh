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
@private
    NSArray * parameters_;
}

- (void)calculateComponent;

@end
