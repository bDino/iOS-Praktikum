//
//  ItemListManager.m
//  iOS_Praktikum_1
//
//  Created by Dino on 05.04.14.
//  Copyright (c) 2014 Haw-Hamburg. All rights reserved.
//

#import "ItemListManager.h"

@interface ItemListManager ()

@property (strong,nonatomic) NSMutableArray *items;

@end

@implementation ItemListManager

-(id)init
{
    if (self = [super init])
    {
        self.items = [[NSMutableArray alloc] init];
    }
    return self;
}


-(NSUInteger) count
{
    return [self.items count];
}

-(Item *) objectAtIntex:(NSUInteger)index
{
    return [self.items objectAtIndex:index];
}

-(Item *) saveItem:(Item *)item
{
    if (item.uuid == nil)
    {
        item.uuid = [NSUUID UUID];
        [self.items addObject:item];
    }
    else
    {
        NSUInteger index = [self.items indexOfObjectPassingTest:
                            ^(id obj, NSUInteger idx, BOOL *stop) {
                                return [item.uuid isEqual:[(Item *)obj uuid]];
                            }];
        [self.items replaceObjectAtIndex:index withObject:item];
    }

    return item;
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
