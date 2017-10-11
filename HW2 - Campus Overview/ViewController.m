//
//  ViewController.m
//  HW2 - Campus Overview
//
//  Created by Langston Duncanson on 10/10/17.
//  Copyright © 2017 Langston Duncanson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    int currentSelection;
}
@property (weak, nonatomic) IBOutlet UIImageView *campusImageView;
@property (weak, nonatomic) IBOutlet UILabel *campusInfo;
@property (weak, nonatomic) IBOutlet UIButton *previousBtn;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;
@property (weak, nonatomic) IBOutlet UISlider *fontSlider;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _campusInfo.text = [self campusSelection:1];
    [self fontSliderChange:self];
    currentSelection = 1;
    self.previousBtn.enabled = NO;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)previousBtnPress:(id)sender {
    currentSelection--;
    _campusInfo.text = [self campusSelection:currentSelection];
    if (currentSelection==1) {
        self.previousBtn.enabled = NO;
    }
    if (currentSelection == 6) {
        self.nextBtn.enabled = YES;
    }
}
- (IBAction)nextBtnPress:(id)sender {
    currentSelection++;
    _campusInfo.text = [self campusSelection:currentSelection];
    if (currentSelection==7) {
        self.nextBtn.enabled = NO;
    }
    if (currentSelection == 2) {
        self.previousBtn.enabled = YES;
    }
}
- (IBAction)fontSliderChange:(id)sender {
    _campusInfo.font = [_campusInfo.font fontWithSize:_fontSlider.value];
}

-(NSString*)campusSelection:(int) selection{
    NSString * result;
    NSString * image;
    switch (selection)
    {
    case 1:
            result = [NSString stringWithFormat:@"Campus:North\nAddress: 11380 NW 27th Ave, Miami, FL 33167\nPhone: (305) 237-1000"];
            image = [NSString stringWithFormat:@"north.jpg"];
        break;
    case 2:
            result = [NSString stringWithFormat:@"Campus:Wolfson\nAddress: 300 NE 2nd Ave, Miami, FL 33132\nPhone: (305) 237-8888"];
            image = [NSString stringWithFormat:@"Wolfson.jpg"];
        break;
    case 3:
            result = [NSString stringWithFormat:@"Campus:InterAmerican\nAddress: 627 SW 27th Ave, Miami, FL 33135\nPhone: (305) 237-6000"];
            image = [NSString stringWithFormat:@"Interamerican.jpg"];
        break;
    case 4:
            result = [NSString stringWithFormat:@"Campus:Hialeah\nAddress: 1780 W 49th St, Hialeah, FL 33012\nPhone: (305) 237-8700"];
            image = [NSString stringWithFormat:@"hialeah.jpg"];
        break;
    case 5:
            result = [NSString stringWithFormat:@"Campus:Kendall\nAddress: 11011 SW 104th St, Miami, FL 33176\nPhone: (305) 237-2000"];
            image = [NSString stringWithFormat:@"Kendall.jpg"];
        break;
    case 6:
            result = [NSString stringWithFormat:@"Campus:Medical\nAddress: 950 NW 20th St. Miami, FL 33127\nPhone: (305) 237-4000"];
            image = [NSString stringWithFormat:@"medical.jpg"];
        break;
    case 7:
            result = [NSString stringWithFormat:@"Campus:West\nAddress: 3800 NW 115th Ave, Doral, FL 33178\nPhone: (305) 237-8000"];
            image = [NSString stringWithFormat:@"west-campus.jpg"];
        break;
    }
    self.campusImageView.image = [UIImage imageNamed:image];
    return result;
}
@end
