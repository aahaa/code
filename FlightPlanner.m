#import <Foundation\Foundation.h>


int main(int argc, char *argV[])
{
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	
	NSString *fileName = @"flights.txt";
	NSURL *file = [NSURL fileURLWithPath: fileName];
	NSString *text = [NSString stringWithContentsOfURL:file];
	
	NSString * tempText = text;
	
	NSRange rangeStrelki = [tempText rangeOfString: @" -> "];
	NSRange rangePerenosa = [tempText rangeOfString: @"/n"];
	NSRange rangeDestination;
	
	NSString *iskaemoyGorod;
	NSString *destination;
	BOOL check;
	BOOL check11;
	
	char str[50] = {0};
	
	NSString *vesMarshrut = @"";
	NSString *gorod = @"111";
	NSString *startGorod = @"";
	
	int i=1;
	
	
	NSLog (@"Welcome to Flight Planner \n Here`s a list of all the cities in our database:");
	
	//Spisok gorodov
	NSString *predidushchiy= @" ";
	NSString *iGorod;
	while([tempText length] >0)
		{    
			rangePerenosa = [tempText rangeOfString: @"\n"];
			rangeStrelki = [tempText rangeOfString: @" -> "];
			
			 if (rangePerenosa.location == 1)
			 tempText = [tempText substringFromIndex: 2];
			 
			 iGorod = [tempText substringToIndex: rangeStrelki.location];
			 if ([iGorod isEqualToString: predidushchiy] !=YES)
				NSLog (@"%@",iGorod);
		
			 rangePerenosa = [tempText rangeOfString: @"\n"];
			 rangeStrelki = [tempText rangeOfString: @" -> "];
			  
			 @try {tempText = [tempText substringFromIndex: rangePerenosa.location +1];}
			 @catch (NSException * e) {break;}
			 
			 predidushchiy = iGorod;
	   }
	   
	
	//-----------
	

	while (check11 != YES)
	{	
		tempText = text;
		
		printf("Enter city: ");
		scanf("%s", str);
		gorod =  [NSString stringWithFormat:@"%s", str];
		
		
		vesMarshrut = [vesMarshrut stringByAppendingString:gorod];	
		vesMarshrut = [vesMarshrut stringByAppendingString:@" -> "];
		
		
		//dlya poslednego shagatsikla	
		check11 = [gorod isEqualToString: startGorod];
		if (check11 == YES)
		break;
				
		NSLog (@"From %@ you can fly directly to :",gorod);
		while([tempText length] >0)
		{    
			rangePerenosa = [tempText rangeOfString: @"\n"];
			rangeStrelki = [tempText rangeOfString: @" -> "];
			 
			 if (rangePerenosa.location == 1)
			 tempText = [tempText substringFromIndex: 2];
			 
			 iskaemoyGorod = [tempText substringToIndex: rangeStrelki.location];

			 check = [gorod isEqualToString: iskaemoyGorod];
			  if (check == YES)
			  {
				rangePerenosa = [tempText rangeOfString: @"\n"];
				rangeStrelki = [tempText rangeOfString: @" -> "];
				
				//range dlya rezki
				rangeDestination = NSMakeRange(rangeStrelki.location+4,(rangePerenosa.location) - (rangeStrelki.location+4));
				destination = [tempText substringWithRange: rangeDestination];
				//vivod punkta naznacheniya
			   NSLog (@"%@", destination);
			  }
			  
			 rangePerenosa = [tempText rangeOfString: @"\n"];
			 rangeStrelki = [tempText rangeOfString: @" -> "];
			  
			 @try {tempText = [tempText substringFromIndex: rangePerenosa.location +1];}
			 @catch (NSException * e) {break;}
			 
			
	   }
	   
	   check11 = [gorod isEqualToString: startGorod];
	   
	   //dlya naznacheniye startovogo goroda
	   if (i ==1)
		{startGorod = gorod;
		i++;}
    }	
		
		NSLog (@"The route you`ve chosen is:");
		NSLog (@"%@",vesMarshrut);
	
	
int pause;
scanf("%i",&pause);
[pool drain];
return 0;
}

