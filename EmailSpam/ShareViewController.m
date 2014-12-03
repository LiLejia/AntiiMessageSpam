//
//  ShareViewController.m
//  EmailSpam
//
//  Created by Henry Lee on 12/1/14.
//  Copyright (c) 2014 Henry Lee. All rights reserved.
//

#import "ShareViewController.h"

@interface ShareViewController ()

@end

@implementation ShareViewController

- (BOOL)isContentValid {
    // Do validation of contentText and/or NSExtensionContext attachments here
    return YES;
}

- (void)didSelectPost {
    // This is called after the user selects Post. Do the upload of contentText and/or NSExtensionContext attachments.
    
    for(NSExtensionItem *item in self.extensionContext.inputItems){
        NSLog(@"fetched extention item:%@",item);
        
        NSArray *itemProviders = [item.userInfo objectForKey:NSExtensionItemAttachmentsKey];
        for(NSItemProvider *provider in itemProviders){
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                [provider loadItemForTypeIdentifier:@"" options:nil completionHandler:^(id<NSSecureCoding> provider,NSError *error){
                    
                }];
                
            });
        }
    }
    
    // Inform the host that we're done, so it un-blocks its UI. Note: Alternatively you could call super's -didSelectPost, which will similarly complete the extension context.
    [self.extensionContext completeRequestReturningItems:@[] completionHandler:nil];
}

- (NSArray *)configurationItems {
    // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
    return @[];
}

- (void)presentationAnimationDidFinish{
    
}

- (void)didSelectCancel{
    
}


@end
