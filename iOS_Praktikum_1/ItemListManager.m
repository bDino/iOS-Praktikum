//
//  ItemListManager.m
//  iOS_Praktikum_1
//
//  Created by Dino on 05.04.14.
//  Copyright (c) 2014 Haw-Hamburg. All rights reserved.
//

#import "ItemListManager.h"

@implementation ItemListManager

-(id)init
{
    if (self = [super init])
    {
        self.items = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void) addItem:(NSObject *)item
{
    [self.items addObject:item];
}

-(BOOL) containsItem:(Item *)item
{
    return [self.items containsObject:item];
}

-(void) printList
{
    NSLog(@"%@", self.items);
}

@end
