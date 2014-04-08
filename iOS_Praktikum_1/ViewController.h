//
//  ViewController.h
//  iOS_Praktikum_1
//
//  Created by Dino on 05.04.14.
//  Copyright (c) 2014 Haw-Hamburg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemListManager.h"
#import "Book.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *txtAuthor;
@property (weak, nonatomic) IBOutlet UITextField *txtTitle;
@property (weak, nonatomic) IBOutlet UITextField *txtISBN;
@property (weak, nonatomic) IBOutlet UIButton *btnAddBook;

- (IBAction)actionAddBookToView:(id)sender;

@property (strong,nonatomic) ItemListManager *manager;

@end
