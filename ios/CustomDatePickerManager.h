//
//  CustomDatePickerManager.h
//  datepicker
//
//  Created by Alexander Avakov on 04/02/2018.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import <React/RCTConvert.h>
#import <React/RCTViewManager.h>

@interface RCTConvert(UIDatePicker)

+ (UIDatePickerMode)UIDatePickerMode:(id)json;

@end

@interface CustomDatePickerManager : RCTViewManager

@end
