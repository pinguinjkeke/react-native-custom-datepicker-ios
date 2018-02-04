//
//  CustomDatePicker.m
//  datepicker
//
//  Created by Alexander Avakov on 04/02/2018.
//  Copyright © 2018 Facebook. All rights reserved.
//


#import "CustomDatePicker.h"

#import <React/RCTUtils.h>
#import <React/UIView+React.h>

@interface CustomDatePicker ()

@property (nonatomic, copy) RCTBubblingEventBlock onChange;

@end

@implementation CustomDatePicker

- (instancetype)initWithFrame:(CGRect)frame
{
  if ((self = [super initWithFrame:frame])) {
    [self addTarget:self action:@selector(didChange) forControlEvents:UIControlEventValueChanged];
  }
  return self;
}

RCT_NOT_IMPLEMENTED(- (instancetype)initWithCoder:(NSCoder *)aDecoder)

- (void)didChange
{
  if (_onChange) {
    _onChange(@{ @"timestamp": @(self.date.timeIntervalSince1970 * 1000.0) });
  }
}

@end
