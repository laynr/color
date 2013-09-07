#import "wax.h"
#import "wax_http.h"
#import "wax_json.h"
#import "wax_filesystem.h"

int main(int argc, char *argv[]) {
    
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *newFile = [documentsDirectory stringByAppendingPathComponent:@"AppDelegate.lua"];
    const char *cString = [newFile UTF8String];
    
    if ([NSString stringWithContentsOfFile:newFile usedEncoding:NULL error:NULL] > 0) {
        NSLog(@"file found");
        wax_start(cString, luaopen_wax_http, luaopen_wax_json, luaopen_wax_filesystem, nil);
    }
    else {
        NSLog(@"file not found");
        wax_start("AppDelegate.lua", luaopen_wax_http, luaopen_wax_json, luaopen_wax_filesystem, nil);
    }
    
    int retVal = UIApplicationMain(argc, argv, nil, @"AppDelegate");
    [pool release];
    return retVal;
}