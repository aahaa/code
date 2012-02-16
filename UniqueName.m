#import <Foundation\Foundation.h>


int main(int argc, char *argV[])
{
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	
  char str[50] = {0};

  NSMutableArray *strArray = [[NSMutableArray alloc] initWithCapacity:100];
  
  NSLog(@"exit from loop - end");
  
  BOOL check1;  
  int x =0;
  //vvod znacheniy s klavi
   while (check1 != YES)
  {
		printf("Enter name: ");
		scanf("%s", str); 
		
		//dobavle v masiv
		[strArray insertObject: [NSString stringWithFormat:@"%s", str] atIndex:x];
		
		check1 = [ [strArray objectAtIndex:x] isEqualToString: @"end"];
			
		x++;
  }
  
	int unik = 0; //kolichestvo tekushevo znacheniya v masive
	int a;
	int b =0;
	
	NSLog(@"Unique name list :");
	
	for(b=0;b<x-1;b++)
	{
	 unik = 0;
	
		for(a=0;a<x-1;a++)
		{
		 BOOL check = [[strArray objectAtIndex:b] isEqualToString: [strArray objectAtIndex:a]];
		 if(check == YES)
		 {unik++;}
		}
		
	 if (unik == 1)
	 NSLog(@"%@",[strArray objectAtIndex:b]);
	}
   
	
int pause;
scanf("%i",&pause);
[pool drain];
return 0;
}


