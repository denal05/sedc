//
//  main.m
//  Books
//
//  Created by Denis Aleksandrov on 6/16/16.
//  Copyright © 2016 INform. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Ebook.h"
#import "PaperBook.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...

        Book * b_ebook = [[Ebook alloc] initWithTitle:@"War and Peace" andAuthor:@"Tolstoy" andPrice:13.00 andDownloadURL:@"http://inform.mk/tolstoy001.pdf" andSizeMB:50];
        NSLog( @"Add:\t%@\t\t\t\t%@\t\t\t%f\t\t%@\t\t%iMB", [b_ebook title], [b_ebook author], [b_ebook price], [(Ebook *)b_ebook downloadURL], [(Ebook *)b_ebook sizeMB]);
        
        [(Ebook *)b_ebook setSizeMB:40];
        NSLog( @"Mod:\t%@\t\t\t\t%@\t\t\t%f\t\t%@\t\t%iMB", [b_ebook title], [b_ebook author], [b_ebook price], [(Ebook *)b_ebook downloadURL], [(Ebook *)b_ebook sizeMB]);
        
        Book * b_paperbook = [[PaperBook alloc] initWithTitle:@"The Brothers Karamazov" andAuthor:@"Dostoyevsky" andPrice:25.00 andShippingWeight:0.5 andInStock:YES andNumberOfCopies:2];
        NSLog( @"Add:\t%@\t\t%@\t\t%f\t\t%f\t\t%skg\t\t\t\t\t%ipcs", [b_paperbook title], [b_paperbook author], [b_paperbook price], [(PaperBook *)b_paperbook shippingWeight], [(PaperBook *)b_paperbook InStock], [(PaperBook *)b_paperbook numberOfCopies]);
        
        [(PaperBook *)b_paperbook decrementNumberOfCopies];
        NSLog( @"Add:\t%@\t\t%@\t\t%f\t\t%f\t\t%skg\t\t\t\t\t%ipcs", [b_paperbook title], [b_paperbook author], [b_paperbook price], [(PaperBook *)b_paperbook shippingWeight], [(PaperBook *)b_paperbook InStock], [(PaperBook *)b_paperbook numberOfCopies]);
        
        [(PaperBook *)b_paperbook decrementNumberOfCopies];
        NSLog( @"Add:\t%@\t\t%@\t\t%f\t\t%f\t\t%skg\t\t\t\t\t%ipcs", [b_paperbook title], [b_paperbook author], [b_paperbook price], [(PaperBook *)b_paperbook shippingWeight], [(PaperBook *)b_paperbook InStock], [(PaperBook *)b_paperbook numberOfCopies]);

        [(PaperBook *)b_paperbook decrementNumberOfCopies];
        NSLog( @"Add:\t%@\t\t%@\t\t%f\t\t%f\t\t%skg\t\t\t\t\t%ipcs", [b_paperbook title], [b_paperbook author], [b_paperbook price], [(PaperBook *)b_paperbook shippingWeight], [(PaperBook *)b_paperbook InStock], [(PaperBook *)b_paperbook numberOfCopies]);
    
    }
    return 0;
}
