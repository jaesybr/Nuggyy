#import <UIKit/UIKit.h>
#import <objc/runtime.h>

// Hook the game's main view controller
%hook MainGameViewController

- (void)viewDidLoad {
    %orig; // Call the original method
    
    // Add your mod menu button
    UIButton *modMenuButton = [UIButton buttonWithType:UIButtonTypeSystem];
    modMenuButton.frame = CGRectMake(20, 50, 100, 40);
    [modMenuButton setTitle:@"Mod Menu" forState:UIControlStateNormal];
    [modMenuButton addTarget:self action:@selector(showModMenu) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:modMenuButton];
}

// Method to display mod menu
- (void)showModMenu {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Mod Menu" message:nil preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"Hack 1" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self hack1];
    }];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"Hack 2" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self hack2];
    }];
    
    [alert addAction:action1];
    [alert addAction:action2];
    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
    
    [self presentViewController:alert animated:YES completion:nil];
}

// Example hacks
- (void)hack1 {
    NSLog(@"Hack 1 activated!");
    // Implement your hack logic here
}

- (void)hack2 {
    NSLog(@"Hack 2 activated!");
    // Implement your hack logic here
}

%end