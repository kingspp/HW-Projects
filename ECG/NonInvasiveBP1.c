//This is based on the equation
//F.d = 0.5mv + mgh

#include <stdio.h>
int main()
{
      float force, dist, mass, pWV, g=9.81,hS;
      printf("\tCalculation of Force:\n\n");
      printf("Enter the distance from heart to finger tip: \n\n");
      scanf("%f",&dist);
      printf("Enter the mass of the blood: \n\n");
      scanf("%f",&mass);
      printf("Enter the pulse wave velocity: ");
      scanf("%f", &pWV);
      printf("Enter the height difference between two sites: ");
      scanf("%f", &hS);
      force = 0.5*(mass*pWV) + (mass*g*hS);
      printf("Force: %f\n\n",force);
      return 0;
}
