//
//  ViewController.m
//  gauss
//
//  Created by Dmitriy Andreykiv on 4/18/13.
//  Copyright (c) 2013 XS2TheWorld. All rights reserved.
//

#import "ViewController.h"
#import "gauss.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    int size = 2;
    
    double **p_x = two_dimension_array_with_size(size);
    double *p_b  = (double*)malloc(size * sizeof(double));
    
    p_x[0][0] = 14.48;
    p_x[0][1] = 14.6;
    
    
    p_x[1][0] = 14.6;
    p_x[1][1] = 16;

    p_b[0] = 15.96;
    p_b[1] = 16.5;


    
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
