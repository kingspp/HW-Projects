//This is based on the equation
//dBP = (0.5 row v^2) + row gh
//BP = dBP/0.7;

#include <stdio.h>
int main()
{
      float force, dist, mass, pWV, g=9.81,hS , a,dBP , row, BP;
      printf("\tCalculation of Blood Pressure:\n\n");
      printf("Enter the cross-section area of Artery: \n\n");
      scanf("%f", &a);
      printf("Enter the distance from heart to finger tip: \n\n");
      scanf("%f",&dist);
      printf("Enter the mass of the blood: \n\n");
      scanf("%f",&mass);
      printf("Enter the pulse wave velocity: ");
      scanf("%f", &pWV);
      printf("Enter the height difference between two sites: ");
      scanf("%f", &hS);
      row = mass / (a * dist) ;
      dBP = ( 0.5* row * pWV * pWV ) + ( row * g * hS );
      BP = dBP / 0.7;
      printf("Blood Pressure: %f\n\n", BP);
      return 0;
}
