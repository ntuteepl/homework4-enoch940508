#include <stdio.h>
#include <stdlib.h>




int main()
{
    int n,b,p,i,j;
    int a[3][6]={{123,456,789,336,775,566},{456,789,888,558,666,221},{9000,5000,6000,10000,12000,7000}};
	scanf("%d",&n);
	for( i=0;i<n;i++)
    {
        scanf("%d%d",&b,&p);
        for( j=0;j<6;j++)
        {
            if(a[0][j]==b)
            {
               if(a[1][j]==p)
               {
                   printf("%d\n",a[2][j]);
                   break;
               }
               else
                    printf("error\n");
            }


        }
        if(j==7)
        {
            printf("error\n");
        }
    }





}
