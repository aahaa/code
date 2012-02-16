#import <Foundation\Foundation.h>


int main(int argc, char *argV[])
{
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	
  char str[50] = {0};

  NSMutableArray *strArray = [[NSMutableArray alloc] initWithCapacity:100];
  
  NSLog(@"exit from loop - end");
  
  BOOL check1; //dlya vihoda s tsikla
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
	x=x-1;
	int unik = 0; //kolichestvo tekushevo znacheniya v masive
	int a;
	
	//udalenie end
	[strArray removeObjectAtIndex: x];
	//dobvlenie pervogo elementa v poslednuu yacheiku...
	[strArray insertObject: [strArray objectAtIndex:0] atIndex:x];
	
	
	NSString *t;
	while(x!=0)
	{
	 unik = 0;
	 t = [strArray objectAtIndex:0];
	
		for(a=0;a<x;a++)
		{
		BOOL check = [t isEqualToString: [strArray objectAtIndex:a]];
			
			if(check == YES)
			{
			unik++;					
			[strArray removeObjectAtIndex: a] ;
			x= x-1;
			a= a-1;
			}
		}
		
	 NSLog(@"Entry %@ has count %i",t,unik);
	}
	
	
int pause;
scanf("%i",&pause);
[pool drain];
return 0;
}


