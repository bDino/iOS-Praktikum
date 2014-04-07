//
//  ViewController.m
//  iOS_Praktikum_1
//
//  Created by Dino on 05.04.14.
//  Copyright (c) 2014 Haw-Hamburg. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.manager = [[ItemListManager alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionAddBookToView:(id)sender
{
    if(![self.txtTitle.text  isEqual: @""] && ![self.txtISBN.text  isEqual: @""])
    {
        Book *newBook = [[Book alloc]init];
    
        newBook.Title = self.txtTitle.text;
        newBook.Author = self.txtAuthor.text;
        newBook.ISBN = self.txtISBN.text;
    
        //check if add was successfull and delte the old data
        NSInteger oldItemCount = [self.manager.items count];
        [self.manager addItem:newBook];
        
        if(oldItemCount != [self.manager.items count])
        {
            self.txtAuthor.text = @"";
            self.txtTitle.text = @"";
            self.txtISBN.text = @"";
            
            [self.manager printList];
        }
    }
}

@end
