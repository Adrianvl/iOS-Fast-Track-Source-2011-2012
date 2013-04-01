//
//  SimController.m
//  TimerDemo
//
//  Created by Nicholas Outram on 02/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "SimController.h"

@implementation SimController {
        
}
@synthesize model = _model;
@synthesize temperatureLabel;
@synthesize scrollView;
@synthesize imageViewCeramic;
@synthesize imageViewMetal;
@synthesize imageViewPlastic;
@synthesize imageView;
@synthesize timer = _timer;
@synthesize previousDate = _previousDate;
@synthesize currentDate = _currentDate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    double t = [self.model.initialConditions.initialTemperature doubleValue];
    self.temperatureLabel.text = [NSString stringWithFormat:@"%3.1f",t];
    
    //Setup scroll view
    float imageWidth = [self.scrollView frame].size.width;
    CGRect largeRect;
    largeRect.origin = CGPointZero;
    largeRect.size.width = imageWidth*3.0;
    largeRect.size.height = imageWidth;
    self.scrollView.contentSize = largeRect.size;
    [self.scrollView setPagingEnabled:YES];     //Important
    
    //Tweak subviews
    CGRect imageFrame;

    //Left
    imageFrame = self.imageViewPlastic.frame;
    imageFrame.origin = CGPointZero;
    imageFrame.size.width = imageWidth;
    imageFrame.size.height = imageWidth;
    self.imageViewPlastic.frame = imageFrame;

    //Middle
    imageFrame.origin.x = imageWidth;
    self.imageViewCeramic.frame = imageFrame;
    
    //Right
    imageFrame.origin.x = imageWidth*2.0;    
    self.imageViewMetal.frame = imageFrame;
    
    
    //Add subviews to scroll view - note that the scroll view is in paged mode
    [self.scrollView addSubview:self.imageViewMetal];
    [self.scrollView addSubview:self.imageViewCeramic];
    [self.scrollView addSubview:self.imageViewPlastic];
    
}

-(void)updateViewWithModel
{
    double t = [self.model.currentTemperature doubleValue];
    self.temperatureLabel.text = [NSString stringWithFormat:@"%3.1f",t];
    int whatCup = [self.model.materialType intValue];
    float imageWidth = [self.scrollView frame].size.width;
    switch (whatCup) {
        case kMaterialTypeMetal:
            [self.scrollView scrollRectToVisible:CGRectMake(imageWidth*2, 0, imageWidth, imageWidth) animated:NO];                        
            break;
        case kMaterialTypeCeramic:
            [self.scrollView scrollRectToVisible:CGRectMake(imageWidth, 0, imageWidth, imageWidth) animated:NO];            
            break;
        case kMaterialTypePlastic:
            [self.scrollView scrollRectToVisible:CGRectMake(0, 0, imageWidth, imageWidth) animated:NO];
            break;
        default:  
            NSLog(@"ERROR");
            break;
    }
}

- (void)viewDidUnload
{
    [self setTemperatureLabel:nil];
    [self setImageView:nil];
    [self setScrollView:nil];
    [self setImageViewCeramic:nil];
    [self setImageViewMetal:nil];
    [self setImageViewPlastic:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Actions
- (IBAction)doStartButton:(id)sender {
    self.previousDate = [NSDate date];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:kEpoch target:self selector:@selector(doEpoch:) userInfo:nil repeats:YES];        
}

- (IBAction)soStopButton:(id)sender {
    [self.timer invalidate];
    [self.model reset];
    self.timer = nil;
    [self updateViewWithModel];
}


-(void)doEpoch:(NSTimer*)t
{
    self.currentDate = [NSDate date];
    double deltaT = [self.currentDate timeIntervalSinceDate:self.previousDate];
    self.previousDate = [NSDate date];
    [self.model iterateWithDelta:[NSNumber numberWithDouble:deltaT]];
    [self updateViewWithModel];
}

#pragma mark - StoryBoard
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    InitialConditionsController *icc = (InitialConditionsController*)[segue destinationViewController];
    [self.timer invalidate];
    self.timer = nil;
    icc.delegate = self;
}

#pragma mark - call back
-(void)updateParametersWithInitialConditions:(InitialConditionsModel*)ic
{
//    self.model.initialConditions = ic;
    [self.model reset];
    [self updateViewWithModel];
}
-(InitialConditionsModel*)initialConditions
{
    return self.model.initialConditions;
}
#pragma mark - accessors
-(SimulationModel*)model {
    if (_model == nil) {
        _model = [[SimulationModel alloc] init];
    }
    return _model;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)theScrollView
{    
    float imageWidth = [self.scrollView frame].size.width;    
    self.model.k = nil; //Reset the cofficient
    
    //Decide which page we are on
    CGPoint p = theScrollView.contentOffset;
    if (p.x == 0.0) {
        self.model.materialType = [NSNumber numberWithInt:kMaterialTypePlastic];
    } else if (p.x == imageWidth) {
        self.model.materialType = [NSNumber numberWithInt:kMaterialTypeCeramic];
    } else {
        self.model.materialType = [NSNumber numberWithInt:kMaterialTypeMetal];
    }
    [self updateViewWithModel];
}
@end