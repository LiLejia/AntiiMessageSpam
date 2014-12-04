//
//  ShareViewController.m
//  EmailSpam
//
//  Created by Henry Lee on 12/1/14.
//  Copyright (c) 2014 Henry Lee. All rights reserved.
//

#import "ShareViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface ShareViewController ()
@property (nonatomic,strong) NSMutableArray *uploadImageArray;
@end

@implementation ShareViewController

- (BOOL)isContentValid {
    // Do validation of contentText and/or NSExtensionContext attachments here
    return YES;
}

- (void)didSelectPost {
    // This is called after the user selects Post. Do the upload of contentText and/or NSExtensionContext attachments.
    
    [self sendImage];
    
    // Inform the host that we're done, so it un-blocks its UI. Note: Alternatively you could call super's -didSelectPost, which will similarly complete the extension context.
    [self.extensionContext completeRequestReturningItems:@[] completionHandler:nil];
}

- (void)sendImage{
    
}

- (NSArray *)configurationItems {
    // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
    return @[];
}

- (void)presentationAnimationDidFinish{
    for(NSExtensionItem *item in self.extensionContext.inputItems){
        NSArray *itemProviders = [item.userInfo objectForKey:NSExtensionItemAttachmentsKey];
        for(NSItemProvider *provider in itemProviders){
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                [provider loadItemForTypeIdentifier:(NSString *)kUTTypeImage options:nil completionHandler:^(id<NSSecureCoding> provider,NSError *error){
                    if(error){
                        NSLog(@"fetch image :%@",error);
                    }
                    NSURL *imageURL = (NSURL *)provider;
                    NSLog(@"image URL:%@",imageURL);
                    dispatch_async(dispatch_get_main_queue(), ^{
                        if(!self.uploadImageArray){
                            self.uploadImageArray = [NSMutableArray array];
                        }
                        [self.uploadImageArray addObject:imageURL];
                    });
                }];
                
            });
        }
    }
}

- (void)didSelectCancel{
    
}


@end
