//
//  QBImagePickerController.m
//  QBImagePicker
//
//  Created by Katsuma Tanaka on 2015/04/03.
//  Copyright (c) 2015 Katsuma Tanaka. All rights reserved.
//

#import "QBImagePickerController.h"
#import <Photos/Photos.h>

// ViewControllers
#import "QBAlbumsViewController.h"
#import "QBAssetsViewController.h"

@interface QBImagePickerController ()

@property (nonatomic, strong) UINavigationController *albumsNavigationController;

@end

@implementation QBImagePickerController

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        // Set default values
        self.assetCollectionSubtypes = @[
                                         @(PHAssetCollectionSubtypeSmartAlbumUserLibrary),
                                         @(PHAssetCollectionSubtypeAlbumMyPhotoStream),
                                         @(PHAssetCollectionSubtypeSmartAlbumPanoramas),
                                         @(PHAssetCollectionSubtypeSmartAlbumVideos),
                                         @(PHAssetCollectionSubtypeSmartAlbumBursts)
                                         ];
        self.minimumNumberOfSelection = 1;
        self.numberOfColumnsInPortrait = 4;
        self.numberOfColumnsInLandscape = 7;
        self.excludeEmptyAlbums = YES;
        
        _selectedItems = [NSMutableOrderedSet orderedSet];
    }
    
    return self;
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	// default navigation route: Nav VC --> Root VC (Albums) --> Assets
	UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"QBImagePicker" bundle:self.assetBundle];
	self.albumsNavigationController = [storyboard instantiateViewControllerWithIdentifier:@"QBAlbumsNavigationController"];;
	
	[self addChildViewController:self.albumsNavigationController];
	self.albumsNavigationController.view.frame = self.view.bounds;
	[self.view addSubview:self.albumsNavigationController.view];
	[self.albumsNavigationController didMoveToParentViewController:self];
	
	// Set instance
	QBAlbumsViewController *albumsViewController = (QBAlbumsViewController *)self.albumsNavigationController.topViewController;
	albumsViewController.imagePickerController = self;
}

- (NSBundle *)assetBundle
{
	if (_assetBundle == nil)
		_assetBundle = [[self class] QBImagePickerBundle];
	return _assetBundle;
}

+ (NSBundle *)QBImagePickerBundle
{
	// Get asset bundle
	NSBundle *assetBundle = [NSBundle bundleForClass:[QBImagePickerController class]];
	NSString *bundlePath = [assetBundle pathForResource:@"OHQBImagePicker" ofType:@"bundle"];
	if (bundlePath) {
		assetBundle = [NSBundle bundleWithPath:bundlePath];
	}
	return assetBundle;
}

@end
