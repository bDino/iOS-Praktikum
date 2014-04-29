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

# pragma mark Edit

- (void)saveEditedBook {
    self.bookItem.title = self.txtTitle.text;
    self.bookItem.author = self.txtAuthor.text;
    self.bookItem.isbn = self.txtISBN.text;
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}


- (IBAction)actionEditDidBeginISBN:(id)sender {
    [self animateTextField:self.txtISBN up:YES];
}

- (IBAction)actionEditDidBeginAuthor:(id)sender {
    [self animateTextField:self.txtISBN up:YES];
}


- (IBAction)actionEditDidEndISBN:(id)sender {
    [self animateTextField:self.txtISBN up:NO];
}

- (IBAction)actionEditDidEndAuthor:(id)sender {
    [self animateTextField:self.txtISBN up:NO];
}
# pragma mark slideTextBox

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self animateTextField: textField up: YES];
}


- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self animateTextField: textField up: NO];
}

- (void) animateTextField: (UITextField*) textField up: (BOOL) up
{
    const int movementDistance = 80; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    
    int movement = (up ? -movementDistance : movementDistance);
    
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}

@end
