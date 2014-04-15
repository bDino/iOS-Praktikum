//
//  ItemListManager.h
//  iOS_Praktikum_1
//
//  Created by Dino on 05.04.14.
//  Copyright (c) 2014 Haw-Hamburg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"

@interface ItemListManager : NSObject

@property (strong,nonatomic) NSMutableArray *items;

-(void) addItem:(Item*) item;
-(BOOL) containsItem:(Item*) item;
-(void) printList;

@end
