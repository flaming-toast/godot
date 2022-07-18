#include "godotShare.h"


#import "app_delegate.h"
#import "view_controller.h"


GodotShare::GodotShare() {
    ERR_FAIL_COND(instance != NULL);
    instance = this;
}

GodotShare::~GodotShare() {
    instance = NULL;
}



void GodotShare::sharePic(const String &path, bool center) {
    ViewController *root_controller = (ViewController *)((AppDelegate *)[[UIApplication sharedApplication] delegate]).window.rootViewController;
    
    NSString * imagePath = [NSString stringWithCString:path.utf8().get_data() encoding:NSUTF8StringEncoding];
    
    UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
    
    NSArray * shareItems = @[image];
    
    UIActivityViewController * avc = [[UIActivityViewController alloc] initWithActivityItems:shareItems applicationActivities:nil];
    avc.modalPresentationStyle = UIModalPresentationPopover;
  //if iPhone
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        [root_controller presentViewController:avc animated:YES completion:nil];
    }
    //if iPad
    else {
        UIPopoverPresentationController* popOver = avc.popoverPresentationController;
        if (popOver){
            popOver.sourceView = root_controller.view;
            if (center) {
              popOver.sourceRect = CGRectMake(root_controller.view.frame.size.width/2,root_controller.view.frame.size.height/2,0,0);
              popOver.permittedArrowDirections = 0;
            } else {
              UIEdgeInsets insets = UIEdgeInsetsMake(0.0, 0.0, 100.0, 0.0);
              popOver.popoverLayoutMargins = insets;
              CGRect rect = CGRectMake(root_controller.view.frame.size.width/2,root_controller.view.frame.size.height,0,0);
              CGRect adjustedRect = UIEdgeInsetsInsetRect(rect, insets);
              popOver.sourceRect = adjustedRect;
              popOver.permittedArrowDirections = UIPopoverArrowDirectionDown;
            }
//            popOver.sourceRect = CGRectMake(root_controller.view.frame.size.width/2, root_controller.view.frame.size.height/4, 0, 0);
//            popOver.sourceRect = CGRectMake(root_controller.view.frame.size.width/2,root_controller.view.frame.size.height/2,0,0);
            [root_controller presentViewController:avc animated:YES completion:nil];
        }
    }

}

void GodotShare::_bind_methods() {
#if VERSION_MAJOR == 3
    ClassDB::bind_method(D_METHOD("sharePic"), &GodotShare::sharePic);
#else
    ObjectTypeDB::bind_method("sharePic", &GodotShare::sharePic);
#endif
    
}
