//
//  UIView+Image.m
//
//  Created by Nigel Barber on 21/07/2011.
//  Copyright 2011 Mindbrix Limited. All rights reserved.
//

#import "UIView+Image.h"


@implementation UIView( Image )

-(UIImage *)convertToImage
{
	if( [ self.layer respondsToSelector:@selector(setShouldRasterize:)])
	{
		UIGraphicsBeginImageContextWithOptions( self.bounds.size, NO, self.contentScaleFactor );
	}
	else
	{
		UIGraphicsBeginImageContext( self.bounds.size );
	}
	
	[ self.layer renderInContext:UIGraphicsGetCurrentContext() ];
	UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	return image;
}



-(void) savePNG:(NSString *)filePath
{
	[ UIImagePNGRepresentation(self.convertToImage) writeToFile:filePath atomically:NO ];
}


-(void) saveJPEG:(NSString *)filePath :(float)quality
{
	[ UIImageJPEGRepresentation(self.convertToImage, quality) writeToFile:filePath atomically:NO ];
}

@end
