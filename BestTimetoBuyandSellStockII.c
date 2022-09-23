#include<stdio.h>

int maxProfit(const int *, int);

int main(){
    const int prices[] = {7,1,5,3,6,4};
    const int pricesSize = 6;
    printf("%d\n", maxProfit(prices, pricesSize));
    return 0;
}

int maxProfit(int* prices, int pricesSize) {
  int sum = 0;
  for (int i = 1; i < pricesSize; i++) {
    if (prices[i - 1] < prices[i]) {
      // check if growing then add it
      sum = sum + (prices[i] - prices[i - 1]);
    }
  }
  return sum;
}
