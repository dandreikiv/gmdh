//
//  ViewController.m
//  gauss
//
//  Created by Dmitriy Andreykiv on 4/18/13.
//  Copyright (c) 2013 XS2TheWorld. All rights reserved.
//

#import "ViewController.h"
#import "gauss.h"
#import "CHCSVParser.h"

@interface Delegate : NSObject <CHCSVParserDelegate>

@property (readonly) NSArray *lines;

@end

@implementation Delegate {
    NSMutableArray *_lines;
    NSMutableArray *_currentLine;
}

- (void)parserDidBeginDocument:(CHCSVParser *)parser {
    _lines = nil;
    _lines = [[NSMutableArray alloc] init];
}
- (void)parser:(CHCSVParser *)parser didBeginLine:(NSUInteger)recordNumber {
    _currentLine = [[NSMutableArray alloc] init];
}
- (void)parser:(CHCSVParser *)parser didReadField:(NSString *)field atIndex:(NSInteger)fieldIndex {
    NSLog(@"%@", field);
    [_currentLine addObject:field];
}
- (void)parser:(CHCSVParser *)parser didEndLine:(NSUInteger)recordNumber {
    [_lines addObject:_currentLine];
    _currentLine = nil;
}
- (void)parserDidEndDocument:(CHCSVParser *)parser {
}
- (void)parser:(CHCSVParser *)parser didFailWithError:(NSError *)error {
	NSLog(@"ERROR: %@", error);
    _lines = nil;
}
@end

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    NSString *file = [[NSBundle mainBundle]pathForResource:@"data.csv" ofType:nil];
	
	NSStringEncoding encoding = 0;
    NSInputStream *stream = [NSInputStream inputStreamWithFileAtPath:file];
	CHCSVParser * p = [[CHCSVParser alloc] initWithInputStream:stream usedEncoding:&encoding delimiter:','];
    [p setRecognizesBackslashesAsEscapes:YES];
    [p setSanitizesFields:YES];
	
	Delegate * d = [[Delegate alloc] init];
	[p setDelegate:d];
	[p parse];
    
    
    int size = 3;
    
    double **p_x = two_dimension_array_with_size(size);
    double *p_b  = (double*)malloc(size * sizeof(double));
    
    p_x[0][0] = 13.3551;
    p_x[0][1] = 13.53;
    p_x[0][2] = 13.3;
    
    p_x[1][0] = 13.53;
    p_x[1][1] = 14.48;
    p_x[1][2] = 14.6;
    
    p_x[2][0] = 13.3;
    p_x[2][1] = 14.6;
    p_x[2][2] = 16;

    p_b[0] = 14.703;
    p_b[1] = 15.96;
    p_b[2] = 16.5;
    
    p_printMatrix(p_x, size);
    
    if (check_if_matrix_is_correct(p_x, p_b, size)) {
        double * result = gauss_n(p_x, p_b, size);
        p_printBMatrix(result, size);
    } else {
        printf("the matrix is incorrect\n");
    }

    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
