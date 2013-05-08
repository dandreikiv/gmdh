//
//  Layer.h
//  gauss
//
//  Created by Dmitriy Andreykiv on 5/2/13.
//  Copyright (c) 2013 XS2TheWorld. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Component;

@interface Layer : NSObject {
@private
    NSMutableArray * _components;
}

- (instancetype)initWithComponents:(NSArray *)components;

- (void)calculate;

@end
