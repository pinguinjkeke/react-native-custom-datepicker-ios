//
//  CustomDatePickerManager.m
//  datepicker
//
//  Created by Alexander Avakov on 04/02/2018.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import "CustomDatePickerManager.h"
#import "CustomDatePicker.h"

#import <React/RCTBridge.h>
#import <React/RCTEventDispatcher.h>
#import <React/UIView+React.h>

@implementation RCTConvert(UIDatePicker)

RCT_ENUM_CONVERTER(UIDatePickerMode, (@{
  @"time": @(UIDatePickerModeTime),
  @"date": @(UIDatePickerModeDate),
  @"datetime": @(UIDatePickerModeDateAndTime),
  @"countdown": @(UIDatePickerModeCountDownTimer),
}), UIDatePickerModeTime, integerValue)

@end

@implementation CustomDatePickerManager

RCT_EXPORT_MODULE()

- (UIView *)view
{
  return [CustomDatePicker new];
}

RCT_EXPORT_VIEW_PROPERTY(date, NSDate)
RCT_EXPORT_VIEW_PROPERTY(locale, NSLocale)
RCT_EXPORT_VIEW_PROPERTY(minimumDate, NSDate)
RCT_EXPORT_VIEW_PROPERTY(maximumDate, NSDate)
RCT_EXPORT_VIEW_PROPERTY(minuteInterval, NSInteger)
RCT_EXPORT_VIEW_PROPERTY(onChange, RCTBubblingEventBlock)
RCT_REMAP_VIEW_PROPERTY(mode, datePickerMode, UIDatePickerMode)
RCT_REMAP_VIEW_PROPERTY(timeZoneOffsetInMinutes, timeZone, NSTimeZone)
RCT_CUSTOM_VIEW_PROPERTY(textColor, UIColor, CustomDatePicker)
{
  UIColor *textColor = json ? [[UIColor alloc] initWithCGColor:[RCTConvert CGColor:json]] : [UIColor blackColor];
  [view setValue:textColor forKeyPath:@"textColor"];
}

@end
