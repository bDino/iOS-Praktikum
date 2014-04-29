//
//  ViewController.m
//  iOS_Praktikum_1
//
//  Created by Dino on 05.04.14.
//  Copyright (c) 2014 Haw-Hamburg. All rights reserved.
//

#import "BookDetailViewController.h"

@implementation BookDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if(self.isEdit)
    {
        self.btnAddBook.hidden = YES;
        
        UIBarButtonItem *saveBtn = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(saveEditedBook)];
        self.navigationItem.rightBarButtonItem = saveBtn;
        
        self.txtAuthor.text = self.bookItem.author;
        self.txtTitle.text = self.bookItem.title;
        self.txtISBN.text = self.bookItem.isbn;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionAddBookToView:(id)sender
{
    if(![self.txtTitle.text isEqualToString:@""] && ![self.txtISBN.text isEqualToString:@""])
    {
        Book *book = [self createBookFromInputs];
        if (![self.manager containsItem: book])
        {
            [self.manager addItem:book];
            [self clearInputFields];
            //[self.manager printList];
            
            self.bookItem = nil;
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
    }
}

- (Book*)createBookFromInputs
{
    Book *book = [[Book alloc] init];

    book.title = self.txtTitle.text;
    book.author = self.txtAuthor.text;
    book.isbn = self.txtISBN.text;

    return book;
}

- (void)clearInputFields
{
    self.txtAuthor.text = @"";
    self.txtTitle.text = @"";
    self.txtISBN.text = @"";
}

# pragma mark Navigation

- (void)saveEditedBook {
    self.bookItem.title = self.txtTitle.text;
    self.bookItem.author = self.txtAuthor.text;
    self.bookItem.isbn = self.txtISBN.text;
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end