#include "types.h"
#include "stat.h"
#include "user.h"
int main(int argc, char *argv[])
{
	//FUNCTION_SETS_NUMBER_OF_TICKETS(30); // write your own function here
	//sleep(5);
        int num = atoi(argv[1]) *10;
        setlottery(num);
        sleep(5);
	int i,k;
	const int loop=430000;
	for(i=0;i<loop;i++)
	{
		asm("nop"); //in order to prevent the compiler from optimizing the for loop
		for(k=0;k<loop;k++)
		{
			asm("nop");
		}
	}
        //cprintf("it's over\n");    
	exit();
}
