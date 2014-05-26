//
//  FFYearCollectionView.m
//  FFCalendar
//
//  Created by Fernanda G. Geraissate on 3/6/14.
//  Copyright (c) 2014 Fernanda G. Geraissate. All rights reserved.
//
//  http://fernandasportfolio.tumblr.com
//

#import "FFYearCollectionView.h"

#import "FFYearCollectionViewFlowLayout.h"
#import "FFYearCell.h"

@interface FFYearCollectionView () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (nonatomic) CGFloat lastContentOffset;
@property (nonatomic) CGSize sizeOfCell;
@end

@implementation FFYearCollectionView

#pragma mark - Synthesize

@synthesize protocol;
@synthesize lastContentOffset;
@synthesize sizeOfCell;

#pragma mark - Lyfecycle

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    
    self = [super initWithFrame:frame collectionViewLayout:[FFYearCollectionViewFlowLayout new]];
    
    if (self) {
        // Initialization code
        
        [self setBackgroundColor:[UIColor whiteColor]];
        
        [self setDataSource:self];
        [self setDelegate:self];
        
        [self registerClass:[FFYearCell class] forCellWithReuseIdentifier:REUSE_IDENTIFIER_MONTH_CELL];
        //        [self registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:REUSE_IDENTIFIER_MONTH_HEADER];
        
        [self setScrollEnabled:YES];
        [self setPagingEnabled:YES];
        
        [self setShowsVerticalScrollIndicator:NO];
    }
    return self;
}

#pragma mark - UICollectionView DataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 12;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    FFYearCell *cell = (FFYearCell *)[collectionView dequeueReusableCellWithReuseIdentifier:REUSE_IDENTIFIER_MONTH_CELL forIndexPath:indexPath];
    [cell initLayout];
    [cell setDate:[NSDate dateWithYear:([[FFDateManager sharedManager] currentDate].componentsOfDate.year+(indexPath.section-1)) month:(indexPath.row+1) day:1]];

    return cell;
}

//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
//    
//    UICollectionReusableView *reusableview = nil;
//    
//    if (kind == UICollectionElementKindSectionHeader) {
//        UICollectionReusableView *headerView = (UICollectionReusableView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:REUSE_IDENTIFIER_MONTH_HEADER forIndexPath:indexPath];
//        reusableview = headerView;
//    }
//    
//    return  reusableview;
//}

#pragma mark - UICollectionView Delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (protocol != nil && [protocol respondsToSelector:@selector(showMonthCalendar)]) {
        [[FFDateManager sharedManager] setCurrentDate:[NSDate dateWithYear:[[FFDateManager sharedManager] currentDate].componentsOfDate.year month:(indexPath.row+1) day:1]];
        [protocol showMonthCalendar];
    }
}

#pragma mark - UICollectionView Delegate FlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        //Cells are 3x4 (3 lines 4 columns)
        sizeOfCell = CGSizeMake((self.frame.size.width-3.*SPACE_COLLECTIONVIEW_CELL_YEAR)/4., (self.frame.size.height-2.*SPACE_COLLECTIONVIEW_CELL_YEAR)/3.);
    }
    else{
        //Cells are 4x3 (4 lines 3 columns)
        sizeOfCell = CGSizeMake((self.frame.size.width-2.*SPACE_COLLECTIONVIEW_CELL_YEAR)/3., (self.frame.size.height-3.*SPACE_COLLECTIONVIEW_CELL_YEAR)/4.);
    }
    NSLog(@"%@ sizeOfCell: %@",NSStringFromClass([self class]), NSStringFromCGSize(sizeOfCell));
    return sizeOfCell;
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
//    
//    CGSize headerViewSize = CGSizeMake(self.frame.size.width, HEADER_HEIGHT_MONTH);
//    
//    return headerViewSize;
//}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {

    return SPACE_COLLECTIONVIEW_CELL_YEAR;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0.;
}

#pragma mark - UIScrollView Delegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    lastContentOffset = scrollView.contentOffset.y;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    ScrollDirection scrollDirection;
    if (lastContentOffset > scrollView.contentOffset.y) {
        [self changeYear:NO];
    } else if (lastContentOffset < scrollView.contentOffset.y) {
        [self changeYear:YES];
    } else {
        scrollDirection = ScrollDirectionNone;
    }
}

#pragma mark - Other Methods

- (void)changeYear:(BOOL)isUp {
    
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setYear:isUp?1:-1];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDate *newDate = [calendar dateByAddingComponents:dateComponents toDate:[[FFDateManager sharedManager] currentDate] options:0];
    
    [[FFDateManager sharedManager] setCurrentDate:newDate];
}

@end
