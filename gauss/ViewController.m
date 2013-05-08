//
//  ViewController.m
//  gauss
//
//  Created by Dmitriy Andreykiv on 4/18/13.
//  Copyright (c) 2013 XS2TheWorld. All rights reserved.
//

#import "ViewController.h"
#import "gauss.h"
#include <stdio.h>
#include <stdlib.h>
#import "array_helpers.h"
#import "Component.h"
#import "Layer.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    NSString *file = [[NSBundle mainBundle]pathForResource:@"data.csv" ofType:nil];
	NSLog(@"fileName:%@", file);
    NSArray * values = [self readFile:file];
    NSLog(@"Values:%@", values);
    
    NSInteger length  = [values count];
    NSInteger columns = 4;
    NSInteger rows    = length - columns + 1;
    
    double ** dataArray = [self convert:values toArrayOfRows:rows columns:columns];
    
    double *firstColumn = columnWithNumber(0, dataArray, rows, columns);
    p_printBMatrix(firstColumn, rows);
    double *bColumn     = columnWithNumber(columns - 1, dataArray, rows, columns);
    
    NSMutableArray * components = [NSMutableArray array];
    
//    for (int colIdx = 0; colIdx < columns - 1; colIdx++) {
//        double * column  = columnWithNumber(colIdx, dataArray, rows, columns);
//        double * params  = mnk_linear(column, bColumn, rows);
//        
//        double deviation = standartDeviation(params, 2, column, bColumn, rows);
//        printf("deviation = %f\n", deviation);
//    }

    
    for (int colIdx = 0; colIdx < columns - 1; colIdx++) {
        double * column       = columnWithNumber(colIdx, dataArray, rows, columns);
        Component * component = [[Component alloc] initWithData:column realData:bColumn size:rows];
        [components addObject:component];
    }

    Layer * layer = [[Layer alloc] initWithComponents:components];
    [layer calculate];
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


- (NSArray *)readFile:(NSString *)file
{
    NSMutableArray * result = [NSMutableArray array];
    
    FILE * fp;
    char * line = NULL;
    size_t len = 0;
    ssize_t read;
    
    fp = fopen([file cStringUsingEncoding:NSUTF8StringEncoding], "r");
    if (fp == NULL)
        exit(EXIT_FAILURE);
    
    while ((read = getline(&line, &len, fp)) != -1) {
        printf("Retrieved line of length %zu :\n", read);
        printf("%s", line);
        
        double value = [[NSString stringWithCString:line encoding:NSUTF8StringEncoding] doubleValue];
        [result addObject:@(value)];
    }
    
    if (line)
        free(line);
    
    return [NSArray arrayWithArray:result];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (double **)convert:(NSArray *)source toArrayOfRows:(NSInteger)rows columns:(NSInteger)columns
{
    NSParameterAssert(source);
    NSAssert(columns > 2, @"There is no point to create an array with less then 2 columns");
    NSAssert(source.count > columns, @"Not enough data. The source array is smaller then number of columns");
    
    double **result = two_dimension_array_with_size(rows, columns);
    
    for (int rowIdx = 0; rowIdx < rows; rowIdx++) {
        for (int colIdx = 0; colIdx < columns; colIdx++) {
            double value = [source[colIdx + rowIdx] doubleValue];
            result[rowIdx][colIdx] = value;
        }
    }
    
    p_printMatrix(result, rows, columns);
    
    return result;
}

@end
