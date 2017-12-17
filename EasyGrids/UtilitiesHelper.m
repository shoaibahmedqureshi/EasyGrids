
//  UtilitiesHelper.m
//
// 
//
//

#import "UtilitiesHelper.h"
//#import "BlockAlertView.h"
#import<CoreGraphics/CoreGraphics.h>

@implementation UtilitiesHelper
{
    
    
}


+ (id)shareUtitlities
{
    static dispatch_once_t once;
    static UtilitiesHelper *shareUtilities;
    dispatch_once(&once, ^ { shareUtilities = [[self alloc] init];  });
    return shareUtilities;
}

+ (id)getUserDefaultForKey:(NSString*)key
{
    
    return [[NSUserDefaults standardUserDefaults] valueForKey:key];
    
}


+ (void)setUserDefaultForKey:(NSString*)key  value:(NSString*)value
{
   NSUserDefaults *usrDef =    [NSUserDefaults standardUserDefaults];
   [usrDef setObject:value forKey:key];
   [usrDef synchronize];
}


+ (id)returnUserDefaultForKey:(NSString*)key
{
    
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
    
}




+(NSString *) addSuffixToNumber:(NSInteger) number
{
    NSString *suffix;
    int ones = number % 10;
    int temp = floor(number/10.0);
    int tens = temp%10;
    
    if (tens ==1) {
        suffix = @"th";
    } else if (ones ==1){
        suffix = @"st";
    } else if (ones ==2){
        suffix = @"nd";
    } else if (ones ==3){
        suffix = @"rd";
    } else {
        suffix = @"th";
    }
    
    NSString *completeAsString = [NSString stringWithFormat:@"%ld%@",(long)number,suffix];
    return completeAsString;
}




//^\+?\d+(-\d+)*$

+(BOOL) checkForEmptySpaces : (UITextField *)textField  {
 

    
    NSString *rawString = textField.text;
    NSCharacterSet *whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmed = [rawString stringByTrimmingCharactersInSet:whitespace];
    if ([trimmed length] == 0) {
//        textField.text = textField.placeholder;
//        textField.textColor = [UIColor redColor];
        // Text was empty or only whitespace.
    
        textField.text = @"";
        return NO;
    }
    
    return YES;
    
}

+(BOOL) checkForEmptySpacesInString : (NSString *)rawString  {
    
    
       NSCharacterSet *whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmed = [rawString stringByTrimmingCharactersInSet:whitespace];
    if ([trimmed length] == 0) {
        return NO;
    }
    return YES;
    
}
+(BOOL) checkForEmptySpacesInTextView : (UITextView *)textView  {
    
    
    NSString *rawString = textView.text;
    NSCharacterSet *whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmed = [rawString stringByTrimmingCharactersInSet:whitespace];
    if ([trimmed length] == 0) {
        // Text was empty or only whitespace.
        
        textView.text = @"";
        return NO;
    }
    
    return YES;
    
}




+(void)showPromptAlertforTitle:(NSString *)title withMessage:(NSString *)message forDelegate:(id)deleg
{
    

//    BlockAlertView  *alertBlock = [[BlockAlertView alloc]initWithTitle:title message:message];
//    [alertBlock setCancelButtonWithTitle:@"Ok" block:^{
//        
//    }];
//    [alertBlock show];
    
    
}

+(BOOL) validateUsername:(NSString*)checkUsername {
    
    NSString *regex = @"^[a-z0-9_-]{5,15}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [predicate evaluateWithObject:checkUsername];
    
}


+(BOOL)validateURL:(NSString *)checkURL
{
    NSString *urlRegEx =
    @"(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+";
    NSPredicate *urlPredic = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", urlRegEx];
    return [urlPredic evaluateWithObject:checkURL];
}

+(BOOL) validateEmail:(NSString *)checkEmail
{
    BOOL stricterFilter = YES;
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkEmail];
}

+(BOOL) validateFullName:(NSString *)checkFullName
{
    NSString *regex = @"[a-zA-Z]{2,}+(\\s{1}[a-zA-Z]{2,}+)+";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:checkFullName];
}
+(BOOL) checkAlphabets:(NSString *)text
{
    NSString *regex = @"[a-zA-Z][a-zA-Z ]+";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:text];
}
+(BOOL) checkFaxNumber:(NSString *)text
{
    NSString *regex = @"^[0-9\\-\\+]{6,12}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:text];
}

///[\+? *[1-9]+]?[0-9 ]+/

+(BOOL) checkPhoneNumber:(NSString *)text
{
    NSString *regex = @"^[0-9\\-\\+]{9,15}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:text];
}
+(BOOL) checkPassword:(NSString *)text
{
    NSString *regex = @"^\\w*(?=\\w*\\d)(?=\\w*[a-z])(?=\\w*[A-Z])\\w*$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:text];
}



+(void)showLMAlertforTitle:(NSString *)title withMessage:(NSString *)message forDelegate:(id)deleg {
    
//    LMAlertView *alertView = [[LMAlertView alloc] initWithTitle:title
//                                                        message:message
//                                                       delegate:deleg
//                                              cancelButtonTitle:@"Ok"
//                                              otherButtonTitles:nil];
//    [alertView show];
    
}




+ (id)loadNibNamed:(NSString *)nibName ofClass:(Class)objClass {
    if (nibName && objClass) {
        NSArray *objects = [[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil];
        
        for (id currentObject in objects ){
            if ([currentObject isKindOfClass:objClass])
                return currentObject;
        }
    }
    
    return nil;
}

+(void)writeJsonToFile:(id)responseString withFileName:(NSString*)fileName
{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [NSString stringWithFormat:@"%@/%@", documentsDirectory, fileName];
    NSLog(@"filePath %@", filePath);

    if (![[NSFileManager defaultManager] fileExistsAtPath:filePath]) { // if file is not exist, create it.
         NSError *error;
        [responseString writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:&error];
        
    }
    else
    {
        NSError *error;
        [[NSFileManager defaultManager] removeItemAtPath: filePath error: &error];

        [responseString writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:&error];
    }
    
}
+(id)readJsonFromFile:(NSString*)fileName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *myPathDocs =  [documentsDirectory stringByAppendingPathComponent:fileName];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:myPathDocs])
    {
//        NSString *myPathInfo = [[NSBundle mainBundle] pathForResource:@"myfile" ofType:@"txt"];
//        NSFileManager *fileManager = [NSFileManager defaultManager];
//        [fileManager copyItemAtPath:myPathInfo toPath:myPathDocs error:NULL];
        return NULL;
    }
    
    //Load from File
    NSString *myString = [[NSString alloc] initWithContentsOfFile:myPathDocs encoding:NSUTF8StringEncoding error:NULL];
    NSLog(@"string ===> %@",myString);
    return myString;
}

+(void)createLayerWithRoundRect:(UIView*)view{
    CALayer * l = [view layer];
    [l setMasksToBounds:YES];
    [l setCornerRadius:view.frame.size.width/2.0];
    [l setBorderWidth:3.0];
    [l setBorderColor:[[UIColor clearColor] CGColor]];
}


+(NSString *) getStringFromObject:(NSObject *) object
{
    if ([object isKindOfClass:[NSNull class]] || object==nil) {
        return @"NA";
    }
    return (NSString *)object;
}

+(NSString *) getEmptyStringFromObjectIfNull:(NSObject *) object
{
    if ([object isKindOfClass:[NSNull class]] || object==nil) {
        return @"";
    }
    return (NSString *)object;
}

+(void)createLayerWithRoundRect:(UIView*)view radius:(float)radius{
    CALayer * l = [view layer];
    [l setMasksToBounds:YES];
    [l setCornerRadius:radius];
    [l setBorderWidth:3.0];
    [l setBorderColor:[[UIColor clearColor] CGColor]];
}

+ (NSDate *) getUTCDateFromString:(NSString *)dateString {
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [dateFormat setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    
    NSDate *date = [dateFormat dateFromString:dateString];
    dateFormat = nil;
    
    return date;
}


//+ (NSDate *) getDateFromString:(NSString *)dateString {
//
//    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
//    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//
//    NSDate *date = [dateFormat dateFromString:dateString];
//    dateFormat = nil;
//
//    return date;
//}

//
//+ (NSString *) getTimeFromSQLDate:(NSString *)datePlusTime{
//
//    NSDateFormatter *formatter;
//    NSString        *dateString;
//
//    formatter = [[NSDateFormatter alloc] init];
//    [formatter setDateFormat:@"h:mm a"];
//
//    dateString = [formatter stringFromDate:[self getDateFromString:datePlusTime]];
//
//    formatter = nil;
//
//    return dateString;
//}





+(NSString *) jsonFragmentOfArray:(NSArray *)array
{
    //    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:array options:NSJSONWritingPrettyPrinted error:nil];
    //    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    //   //NSLog(@"jsonData as string:\n%@", jsonString);
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:array options:NSJSONWritingPrettyPrinted error:nil];
    
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    //NSLog(@"jsonData as string:\n%@", jsonString);
    
    return jsonString;
}

+(NSString *) stringByStrippingHTML:(NSString*) htmlString {
    NSRange r;
    while ((r = [htmlString rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
        htmlString = [htmlString stringByReplacingCharactersInRange:r withString:@""];
    return htmlString;
}

-(void)showAlertWithMessage:(NSString*)message title:(NSString*)title delegate:(id)delegate{
  
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:title
                                          message:message
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {
                                   [alertController dismissViewControllerAnimated:alertController completion:nil];
                               }];
    
    [alertController addAction:okAction];
        
    [delegate presentViewController:alertController animated:YES completion:nil];

}

-(void)showToastWithMessage:(NSString*)message title:(NSString*)title delegate:(id)delegate{
    
    UIAlertController* alert=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [delegate presentViewController:alert animated:YES completion:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW,(int64_t)(3*NSEC_PER_SEC) ), dispatch_get_main_queue(), ^{
        [alert dismissViewControllerAnimated:alert completion:^{
        }];
    });
}

-(void)showToastWithMessage:(NSString*)message title:(NSString*)title delegate:(id)delegate completion:(void (^)(bool completed))block{
    
    UIAlertController* alert=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [delegate presentViewController:alert animated:YES completion:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW,(int64_t)(3*NSEC_PER_SEC) ), dispatch_get_main_queue(), ^{
        [alert dismissViewControllerAnimated:alert completion:^{
            block(YES);
        }];
    });
}

//+(void)addActivityIndicatorToView:(UIView*)view{
//    UIActivityIndicatorView* indicator=[[UIActivityIndicatorView alloc]init];
//    [indicator setTag:1000];
//    [indicator setCenter:CGPointMake(view.frame.size.width/2, view.frame.size.height/2)];
//    [indicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
//    [indicator startAnimating];
//    [view addSubview:indicator];
//
//}
//+(void)removeActivityIndicatorToView:(UIView*)view{
//    @try {
//        for(UIView* view in view.subviews){
//            if([view isKindOfClass:[UIActivityIndicatorView class]]){
//                if(view.tag==1000){
//                    UIActivityIndicatorView* indicator=(UIActivityIndicatorView*)view;
//                    [indicator stopAnimating];
//                    [indicator removeFromSuperview];
//                }
//            }
//        }
//    }
//    @catch (NSException *exception) {
//        NSLog(@"EXCEPTION: %@",exception.description);
//    }
//    @finally {
//        NSLog(@"finally block called");
//
//    }
// 
//
//}


+(void)addActivityIndicatorToView:(UIView*)view{
    __weak __typeof(UIView*)weakView=view;
    BOOL isHavingIndicatorView=NO;
    
        for(UIView* tmpView in [weakView subviews]){
            if([tmpView isKindOfClass:[UIActivityIndicatorView class]]){
                isHavingIndicatorView=YES;
                UIActivityIndicatorView* indicator=(UIActivityIndicatorView*)tmpView;
                [indicator startAnimating];
                [weakView bringSubviewToFront:indicator];
            }
        }
        if(!isHavingIndicatorView){
            UIActivityIndicatorView* indicator=[[UIActivityIndicatorView alloc]init];
            [indicator setCenter:CGPointMake(weakView.frame.size.width/2, weakView.frame.size.height/2)];
            [indicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
            [indicator startAnimating];
            [weakView addSubview:indicator];
            [weakView bringSubviewToFront:indicator];
        }
    

    
}
+(void)removeActivityIndicatorToView:(UIView*)view{
   __block UIActivityIndicatorView* indicator;
    __weak __typeof(UIView*)weakView=view;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        @try {
            if([weakView subviews].count>0){
                for(UIView* tmpView in [weakView subviews]){
                    if([tmpView isKindOfClass:[UIActivityIndicatorView class]])
                        indicator=(UIActivityIndicatorView*)tmpView;
                }
            }
            
            
        }
        @catch (NSException *exception) {
            NSLog(@"EXCEPTION: %@",exception.description);
        }
        @finally {
            if (indicator) {
                dispatch_async(dispatch_get_main_queue(), ^{ // 2
                    [indicator stopAnimating];
                    [indicator removeFromSuperview];
                });
                
            }
        }

    });
    
    
}

@end

