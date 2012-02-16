#import <Foundation\Foundation.h>


int main(int argc, char *argV[])
{
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	
	char str[50] = {0};
	printf("Enter file name: ");
	scanf("%s", str);
	NSString *fileName = [NSString stringWithFormat:@"%s", str];
	
	NSFileManager *f = [[NSFileManager alloc]init];
	while([f fileExistsAtPath:fileName] != YES) 
	 {
	  NSLog (@"File not exist! ");
	  printf("Enter file name: ");
	  scanf("%s", str);
	  fileName = [NSString stringWithFormat:@"%s", str];
	 }
	
	 NSURL *file = [NSURL fileURLWithPath: fileName];
	 NSString *text = [NSString stringWithContentsOfURL:file];
	
	
	
	 
	
	
	//poluchenie rozmera texta
	int textSize = [text length];
	
	int slovTexta = 0;
	int strokTexta = 0;
	
	NSString *temp1 ;
	NSString *temp2 ;
	
	int i;
	for (i = 0 ; i<textSize-1 ; i++)
	{
 	 //diapazon tekushego simvola
	 NSRange range = NSMakeRange(i, 1);
	 //diapazon sleduishego simvola
	 NSRange range1 = NSMakeRange(i+1, 1);
	
	 //tekushiy simvol
	 temp1 = [text substringWithRange: range];
	 //sleduishiy simvol
	 temp2 = [text substringWithRange: range1];
	
	 BOOL proverkaPerenosa = [temp1 isEqualToString: @"\n"];
	 if (proverkaPerenosa == YES)
	 strokTexta ++;
	
	 BOOL proverkaProbela = [temp1 isEqualToString: @" "];
	 BOOL proverkaSlBukvi = [temp2 isEqualToString: @" "];
	
	 if ((proverkaProbela == YES && proverkaSlBukvi==NO ) || (proverkaPerenosa == YES && proverkaSlBukvi==NO ) )
	 slovTexta ++;	
	}
	
	NSLog (@"Lines : %i", strokTexta);
	NSLog (@"Words : %i", slovTexta);
	NSLog (@"Chars : %i", textSize - strokTexta*2 +1);
	
	
int pause;
scanf("%i",&pause);
[pool drain];
return 0;
}