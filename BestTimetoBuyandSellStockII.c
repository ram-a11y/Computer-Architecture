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
