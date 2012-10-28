//
//  QuizViewController.m
//  Quiz
//
//  Created by Vinay Siddharam Hiremath on 10/27/12.
//  Copyright (c) 2012 Vinay Siddharam Hiremath. All rights reserved.
//

#import "QuizViewController.h"

@interface QuizViewController ()

@end

@implementation QuizViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        questions = [[NSMutableArray alloc] init];
        answers = [[NSMutableArray alloc] init];
        
        [questions addObject:@"What is the coolest thing you can do?"];
        [answers addObject:@"Hang out with Vinay!"];
        
        [questions addObject:@"Who's the chillest bro of all of brodom?"];
        [answers addObject:@"Jack Johnson"];
        
        [questions addObject:@"How do I become as awesome as Vinay?"];
        [answers addObject:@"Not all questions have a solution."];
    }
    
    return self;
}

- (IBAction)showQuestion:(id)sender {
    currQuestion++;
    
    if (currQuestion == [questions count]) {
        currQuestion = 0;
    }
    
    NSString *question = [questions objectAtIndex:currQuestion];
    NSLog(@"displaying question: %@", question);
    
    [questionField setText:question];
    [answerField setText:@"???"];
}

- (IBAction)showAnswer:(id)sender {
    NSString *answer = [answers objectAtIndex:currQuestion];
    [answerField setText:answer];
}

@end
