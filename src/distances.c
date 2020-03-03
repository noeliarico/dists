#define R_NO_REMAP
#include <R.h>
#include <Rinternals.h>

typedef double (*DistanceFunction)(double*, int, int, int, int);

double man(double* data, int x, int y, int nrow, int ncol) {

  int c;
  double total = 0.0, xi, yi;

  for(c = 0; c < ncol; c++) {
    xi = data[x + nrow * c];
    yi = data[y + nrow * c];
    total += fabs(xi - yi);
  }

  return(total);
}

double euc(double* data, int x, int y, int nrow, int ncol) {

  int c;
  double total = 0.0, xi, yi;

  for(c = 0; c < ncol; c++) {
    xi = data[x + nrow * c];
    yi = data[y + nrow * c];
    total += pow((xi - yi), 2);
  }

  return(sqrt(total));
}

double che(double* data, int x, int y, int nrow, int ncol) {

  int c;
  double total = 0.0, xi, yi, max, sum1;

  for(c = 0; c < ncol; c++) {
    xi = data[x + nrow * c];
    yi = data[y + nrow * c];
    sum1 = fabs(xi - yi);
    if(max < sum1) {
      max = sum1;
    }
  }

  return(total);
}

double can(double* data, int x, int y, int nrow, int ncol) {

  int c;
  double total = 0.0, xi, yi, numerator, denominator;

  for(c = 0; c < ncol; c++) {
    xi = data[x + nrow * c];
    yi = data[y + nrow * c];
    numerator = fabs(xi - yi);
    denominator = fabs(xi) + fabs(yi);
    if(denominator > 0) {
      total += numerator / denominator;
    }
  }

  return(total);
}

double gow(double* data, int x, int y, int nrow, int ncol) {

  int c;
  double total = 0.0, xi, yi, numerator, denominator;

  for(c = 0; c < ncol; c++) {
    xi = data[x + nrow * c];
    yi = data[y + nrow * c];
    numerator = fabs(xi - yi);
    denominator = fabs(xi) + fabs(yi);
    if(denominator > 0) {
      total += numerator / denominator;
    }
  }

  return(total);
}

double jac(double* data, int x, int y, int nrow, int ncol) {

  int c;
  double total = 0.0, xi, yi, sum1, sum2, sum3, sum4;

  for(c = 0; c < ncol; c++) {
    xi = data[x + nrow * c];
    yi = data[y + nrow * c];
    sum1 += (xi - yi) * (xi - yi);
    sum2 += xi * xi;
    sum3 += yi * yi;
    sum4 += xi * yi;
  }
  if((sum2 + sum3 - sum4) == 0) {
    total = 0;
  }
  else{
    total = (sum1 / (sum2 + sum3 - sum4));
  }

  return(total);
}

/*
double cos(double* data, int x, int y, int nrow, int ncol) {

  int c;
  double total = 0.0, xi, yi, denominator, sum1, sum2, sum3;

  for(c = 0; c < ncol; c++) {
    xi = data[x + nrow * c];
    yi = data[y + nrow * c];
    sum1 += xi * yi;
    sum2 += xi * xi;
    sum3 += yi * yi;
  }
  denominator = sqrt(sum2) * sqrt(sum3);
  if(denominator == 0) {
    total = 0;
  }
  else {
    total = (1 - (sum1 / denominator));
  }

  return(total);
}*/

double scd(double* data, int x, int y, int nrow, int ncol) {

  int c;
  double total = 0.0, xi, yi, denominator, sum1;

  for(c = 0; c < ncol; c++) {
    xi = data[x + nrow * c];
    yi = data[y + nrow * c];
    sum1 = sqrt(xi) - sqrt(yi); // difference
    sum1 = sum1 * sum1; // square of the differences
    total += sum1;
  }

  return(total);
}

double cla(double* data, int x, int y, int nrow, int ncol) {

  int c;
  double total = 0.0, xi, yi, denominator, sum1, sum2;

  for(c = 0; c < ncol; c++) {
    xi = data[x + nrow * c];
    yi = data[y + nrow * c];
    sum1 = xi - yi;
    sum2 = fabs(xi) + fabs(yi);
    if(sum2 > 0.0) {
      total += pow((sum1 / sum2), 2);
    }
  }

  return sqrt(total);
}


double ney(double* data, int x, int y, int nrow, int ncol) {

  int c;
  double total = 0.0, xi, yi, denominator, sum1;

  for(c = 0; c < ncol; c++) {
    xi = data[x + nrow * c];
    yi = data[y + nrow * c];
    sum1 = (xi - yi) * (xi - yi);
    if(xi > 0) {
      total += sum1 / xi;
    }
  }

  return sqrt(total);
}

double pea(double* data, int x, int y, int nrow, int ncol) {

  int c;
  double total = 0.0, xi, yi, denominator, sum1;

  for(c = 0; c < ncol; c++) {
    xi = data[x + nrow * c];
    yi = data[y + nrow * c];
    sum1 = (xi - yi) * (xi - yi);
    if(yi > 0) {
      total += sum1 / yi;
    }
  }

  return sqrt(total);
}

void distance(int *distance, // numeric code of the distance function
              double *data,      // data
              int *ncol,     // total number of variables of the dataset
              int *nrow,     // total number of objects of the dataset
              // calculating the distance from x to y
              int *x,        // index of the first object
              int *y,       // index of the second object
              double *result) {// array of centers

  // Original variables
  int lncol = *ncol, lnrow = *nrow, lx = *x - 1, ly = *y - 1, ldistance = *distance;

  //printf("x = %d , y = %d\n", lx, ly);

  //printf("Value of man = %f\n", compute(data, x, y, nrow, ncol, man));
  //*result =  man(data, x, y, nrow, ncol);

  DistanceFunction df;

  switch (ldistance) {

  case 1: // Manhattan distance
    df = man;
    break;
  default:
    df = euc;
    break;

  }

  printf("Value of distance = %f\n", df(data, lx, ly, lnrow, lncol));

  *result = df(data, lx, ly, lnrow, lncol);

}


