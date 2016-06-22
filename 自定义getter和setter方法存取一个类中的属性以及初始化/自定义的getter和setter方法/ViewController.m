//
//  ViewController.m
//  自定义的getter和setter方法
//
//  Created by 李献红 on 16/6/15.
//  Copyright © 2016年 李献红. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Person *person = [[Person sharedPerson] init];
    person.name  = @"李献红";
    NSLog(@"%@  %@  %@  %@",person.name,person.age,person.school,person.bookName);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
