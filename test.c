#include "types.h"
#include "stat.h"
#include "user.h"
#define DEBUG 1
int main(int argc, char *argv[])
{ 
    #if DEBUG
        int test = 0 ;
        for(test = 0; test < 10 ;test ++)
               hello();
    #endif
        int choice = atoi(argv[1]);
        if(choice ==1) info(1);
        else if(choice ==2)
        {
            info(2);
            hello();
            info(2);
        } 
        else if (choice ==3)
        {
            info(3);
        }
        else
        {
            info(4);
        }
	exit();


}
