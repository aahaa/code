#import <Foundation\Foundation.h>

@interface Converter :NSObject
{}
-(NSString*) intToStars:(int)a;
@end

@implementation Converter
-(NSString*) intToStars:(int)a
{
NSString *stars = @"";
int i;
for (i =0;i<a;i++)
stars = [stars stringByAppendingString: @"*"];

return stars;
}
@end


int main(int argc, char *argV[])
{
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	
	NSString *fileName = @"MidtermScores.txt";
	NSURL *file = [NSURL fileURLWithPath: fileName];
	NSString *text = [NSString stringWithContentsOfURL:file];
	
	int masiv[10];
	
	int i;
	for (i=0;i<11;i++)
	masiv[i] = 0;
	
	NSString *temp1;
	
	int t;
	while ([text length] !=0)
	{
		//poisk pozitsii perenosa stroki
		NSRange rangePerenosa = [text rangeOfString: @"\n"];
		
		if (rangePerenosa.location<=[text length])
		{
			//diapazon
			NSRange range = NSMakeRange(0, rangePerenosa.location);
				
			temp1 = [text substringWithRange: range];
			t =  [temp1 integerValue];

			//udalenie prochitanogo
			text = [text substringFromIndex: rangePerenosa.location+1];
				
			t = (int) t/10;
			masiv[t]++;		
		}
		else //dlya poslednego znacheniya
		{ 
			NSRange range = NSMakeRange(0, [text length]);
			temp1 = [text substringWithRange: range];
				
			t = [temp1 integerValue];
			t = (int) t/10;
			masiv[t]++;
			break;
		}
    }	
	Converter *c = [[Converter alloc]init];
	
	NSLog (@"00-09 : %@", [c intToStars :masiv[0]]);
	NSLog (@"10-19 : %@", [c intToStars :masiv[1]]);
	NSLog (@"20-29 : %@", [c intToStars :masiv[2]]);
	NSLog (@"30-39 : %@", [c intToStars :masiv[3]]);
	NSLog (@"40-49 : %@", [c intToStars :masiv[4]]);
	NSLog (@"60-69 : %@", [c intToStars :masiv[6]]);
	NSLog (@"70-79 : %@", [c intToStars :masiv[7]]);
	NSLog (@"80-89 : %@", [c intToStars :masiv[8]]);
	NSLog (@"80-89 : %@", [c intToStars :masiv[9]]);
	NSLog (@"80-89 : %@", [c intToStars :masiv[10]]);
	
int pause;
scanf("%i",&pause);
[pool drain];
return 0;
}


