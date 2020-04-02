#define R_NO_REMAP
#include <R.h>
#include <Rinternals.h>

typedef double (*DistanceFunction)(double*, int, int, int, int);

//---------------------------------------------------------------------
//-- Canberra distance ------------------------------------------------
//---------------------------------------------------------------------
double can(double* data, int x, int y, int nrow, int ncol) {

  int c;
  double total = 0.0, xi, yi, numerator, denominator;

  for(c = 0; c < ncol; c++) {
    xi = data[x + nrow * c];
    yi = data[y + nrow * c];
    numerator = fabs(xi - yi);
    denominator = fabs(xi) + fabs(yi);
    if(denominator > 0) {
      total += (numerator / denominator);
    }
  }

  return(total);
}

//---------------------------------------------------------------------
//-- Chebyshev distance -----------------------------------------------
//---------------------------------------------------------------------
double che(double* data, int x, int y, int nrow, int ncol) {

  int c;
  double max = 0.0, xi, yi, sum1;

  for(c = 0; c < ncol; c++) {
    xi = data[x + nrow * c];
    yi = data[y + nrow * c];
    sum1 = fabs(xi - yi);
    if(max < sum1) {
      max = sum1;
    }
  }

  return(max);
}

//---------------------------------------------------------------------
//-- Cosine distance --------------------------------------------------
//---------------------------------------------------------------------
double cosine(double* data, int x, int y, int nrow, int ncol) {

  int c;
  double total = 0.0, xi, yi,
    numerator = 0.0, denominator = 0.0, sumxi = 0.0, sumyi = 0.0;

  for(c = 0; c < ncol; c++) {
    xi = data[x + nrow * c];
    yi = data[y + nrow * c];
    //printf("x = %d , y = %d, data[x] = %f, data[y] = %f\n", (x + nrow * c), (y + nrow * c), xi, yi);
    numerator += (xi * yi);
    sumxi += (xi * xi);
    sumyi += (yi * yi);
  }
  denominator = sqrt(sumxi) * sqrt(sumyi);
  if(denominator == 0.0) {
    total = 0.0;
  }
  else {
    total = 1.0 - (numerator/denominator);
  }
  return total;
}

//---------------------------------------------------------------------
//-- Euclidean distance -----------------------------------------------
//---------------------------------------------------------------------
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

//---------------------------------------------------------------------
//-- Jaccard distance -------------------------------------------------
//---------------------------------------------------------------------
double jac(double* data, int x, int y, int nrow, int ncol) {

  int c;
  double total = 0.0, xi, yi,
    sum1 = 0.0, sum2 = 0.0, sum3 = 0.0, sum4 = 0.0;

  for(c = 0; c < ncol; c++) {
    xi = data[x + nrow * c];
    yi = data[y + nrow * c];
    sum1 += (xi - yi) * (xi - yi);
    sum2 += xi * xi;
    sum3 += yi * yi;
    sum4 += xi * yi;
  }

  if((sum2 + sum3 - sum4) == 0.0) {
    total = 0;
  }
  else{
    total = (sum1 / (sum2 + sum3 - sum4));
  }

  return(total);
}

//---------------------------------------------------------------------
//-- Manhattan distance -----------------------------------------------
//---------------------------------------------------------------------
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

//---------------------------------------------------------------------
//-- Matusita distance ------------------------------------------------
//---------------------------------------------------------------------
double mat(double* data, int x, int y, int nrow, int ncol) {

  int c;
  double sum = 0.0, total = 0.0, xi, yi;
  for(c = 0; c < ncol; c++) {
    xi = data[x + nrow * c];
    yi = data[y + nrow * c];
    sum = sqrt(xi) - sqrt(yi); // difference
    sum = sum * sum; // square of the differences
    total += sum;
  }
  return sqrt(total);

}


//---------------------------------------------------------------------
//-- Squared Chord distance -------------------------------------------
//---------------------------------------------------------------------
double trd(double* data, int x, int y, int nrow, int ncol) {

  int c;
  double total = 0.0, xi, yi, sum = 0.0;

  for(c = 0; c < ncol; c++) {
    xi = data[x + nrow * c];
    yi = data[y + nrow * c];
    sum = sqrt(xi) - sqrt(yi); // difference
    sum = sum * sum; // square of the differences
    total += sum;
  }

  return(total);
}






//---------------------------------------------------------------------
//-- Gower distance ---------------------------------------------------
//---------------------------------------------------------------------
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







//---------------------------------------------------------------------
//-- Clark distance ---------------------------------------------------
//---------------------------------------------------------------------
double cla(double* data, int x, int y, int nrow, int ncol) {

  int c;
  double total = 0.0, xi, yi, sum1, sum2;

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

//---------------------------------------------------------------------
//-- Neyman distance --------------------------------------------------
//---------------------------------------------------------------------
double ney(double* data, int x, int y, int nrow, int ncol) {

  int c;
  double total = 0.0, numerator = 0.0, xi, yi;

  for(c = 0; c < ncol; c++) {
    xi = data[x + nrow * c];
    yi = data[y + nrow * c];
    numerator = (xi - yi) * (xi - yi);
    if(xi > 0) {
      total += (numerator / xi);
    }
  }

  return total;
}

//---------------------------------------------------------------------
//-- Pearson distance -------------------------------------------------
//---------------------------------------------------------------------
double pea(double* data, int x, int y, int nrow, int ncol) {

  int c;
  double total = 0.0, xi, yi, numerator;

  for(c = 0; c < ncol; c++) {
    xi = data[x + nrow * c];
    yi = data[y + nrow * c];
    numerator = pow((xi - yi), 2);
    if(yi > 0) {
      total += numerator / yi;
    }
  }

  return total;
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
  int lncol = *ncol, lnrow = *nrow, lx = *x - 1, ly = *y - 1;
  float lresult = 0.0;

  unsigned int ldistance = *distance;
  //printf("lncol = %d , lnrow = %d, ldistance = %d\n", lncol, lnrow, ldistance);

  DistanceFunction df;

  switch (ldistance) {

  case 2013: // Canberra distance
    df = can;
    break;
  case 274: // Chebyshev distance
    df = che;
    break;
  case 21418: // Cosine distance
    df = cosine;
    break;
  case 4202: // Euclidean distance
    df = euc;
    break;
  case 902: // Jaccard distance
    df = jac;
    break;
  case 12013: // Manhattan distance
    df = man;
    break;
  case 12019: // Matusita distance
    df = mat;
    break;
  case 13424: // Neyman distance
    df = ney;
    break;
  case 1540: // Pearson distance
    df = pea;
    break;
  case 19173: // Triangular discrimination distance (Squared Chord distance)
    df = trd;
    break;

  default:
    df = euc;
    break;

  }

  //printf("x = %d , y = %d\n", lx, ly);

  lresult = df(data, lx, ly, lnrow, lncol);
  *result = lresult;
  //printf("distance = %f\n", lresult);

}


