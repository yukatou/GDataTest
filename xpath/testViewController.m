//
//  testViewController.m
//  xpath
//
//  Created by Kato Yu on 2013/01/22.
//  Copyright (c) 2013年 Kato Yu. All rights reserved.
//

#import "testViewController.h"
#import "GDataXMLNode.h"


@interface testViewController ()

@end

@implementation testViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSString* xml = @"<product xmlns:sample='http://www.infoteria.com/jp/sample'><sample:name>pencilia</sample:name><sample:price>2500</sample:price><comment/></product>";
    
    //xmlをパース
    NSError* error;
    GDataXMLDocument* document = [[GDataXMLDocument alloc] initWithXMLString: xml options:0 error:&error];
    GDataXMLElement *node = [document rootElement];
    
    //nameのみのデータが入っている配列
    NSDictionary *myNS = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"http://www.infoteria.com/jp/sample", @"sample",
                          @"http://hogehoge.api/test2", @"ns2", nil];
    NSArray* nameArray = [node nodesForXPath:@"//sample:name" namespaces:myNS error:&error];
    NSLog(@"%d", nameArray.count);
    NSLog(@"%@", nameArray);
    //GDataXMLElement *data = [nameArray objectAtIndex:0];
    //NSLog(@"data = %@", [data stringValue]);
    
   
    
    [document release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
