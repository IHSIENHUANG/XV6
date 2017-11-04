#include "types.h"
#include "stat.h"
#include "user.h"
#define DEBUG 1
int main(int argc, char *argv[])
{ 
    #if DEBUG
        int test = 0 ;
        int another = 1;
        if(another==1);
        for(test = 0; test < 10 ;test ++)
               hello();
    #endif
        int choice = atoi(argv[1]);
        if(choice ==1) info(1);
        else if(choice ==2)
        {    
            info(2);
            int times=3; 
            int i = 0 ;
            for( i =0;i<times ;i++)
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
