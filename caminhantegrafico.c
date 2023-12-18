#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include <time.h>
#define L 1000//quantidade de passos

// primeiro preciso de um gerador de números aleatórios. 

int main(void)
{
	int i, num[L], x, l, xf;
	double tempo;

	x=1;
	l=1;
	xf = 10;
	tempo = 0;
	
	srand(time(NULL));
	printf("set xrange [0:11]\n");
	printf("set yrange [0:1]\n");
	printf("set key off\n");
	printf("set style line 1 lc rgb 'blue' pt 7\n");
	printf("set style line 2 lc rgb 'red' pt 2\n");

	for (i = 0; i < L; i++) 
		
	{
		//printf("%d: ", i);
		num[i] = (rand() % 21) + (-10); 
		printf("%d\n", num[i]);
		
		if (num[i]<0 || num[i] == 0)
		{
			x = x-l;
					 
		}
		
		else
		{
			x = x+l;
			
			if(x==xf)
			{
				i = L-1;	
			}
		
		}
		//printf("x=%d\n", x);
	
		tempo = tempo + 1;
		
		printf("set title 'Tempo = %f'\n", tempo);
		printf("plot \'-\' w p ls 1, \'-\' w p ls 2\n" );
		printf("%d %f\n", x, 0.5);
		

		printf("e\n");
		printf("%d %f\n", 10, 0.5);
		printf("e\n");
		printf("pause 0.2\n");
		
		if(x==0)
		{
			x = x+l;
		
		printf("plot \'-\' w p ls 1, \'-\' w p ls 2\n" );
		printf("%d %f\n", x, 0.5);
		

		printf("e\n");
		printf("%d %f\n", 10, 0.5);
		printf("e\n");
		printf("pause 0.5\n");
		
		}
	}




}
