#include <stdio.h>
#include <stdlib.h>


int main()
{
	int n,m,g;
	scanf("%d",&n);
	if(n<=50 && n>=1)
    {

    for(int i=0;i<n;i++)
    {

        scanf("%d",&g);
        for(m=2;m<g;m++)
            {
                if((g%m)==0)
                    {
                        printf("No ");
                        break;
                    }

            }
            if(g==m)
                    {
                        printf("Yes ");
                    }
    }




    }

    else
    {
        printf("No");
    }

}

