
.data
prices:    .word 7,1,5,3,6,4
pricesSize:    .word 5

.text
##include<stdio.h>
#
#int maxProfit(const int *, int);
#
#int main(){
#    const int prices[] = {7,1,5,3,6,4};
#    const int pricesSize = 6;
#    printf("%d\n", maxProfit(prices, pricesSize));
#    return 0;
#}
#
#int maxProfit(int* prices, int pricesSize) {
#  int sum = 0;
#  for (int i = 1; i < pricesSize; i++) {
#    if (prices[i - 1] < prices[i]) {
#      // check if growing then add it
#      sum = sum + (prices[i] - prices[i - 1]);
#    }
#  }
#  return sum;
#}

main:
    la     a1, prices         # s1 = nums[];  // array
    lw     a2, pricesSize     # s2 = numsSize;     // length of the array
    jal    ra, maxProfit   # Function call

    # a0 is the return value and also the value we want to print
    li     a7, 1            # print a0
    ecall
    li     a7, 10           # Exit code
    ecall                   
    
maxProfit:
    addi   a0, x0, 0        # s0 = sum
    addi   s2, x0, 1        # s2 = i = 1
    loop:
        lw     s3, 0(a1)    # s5 = prices[i-1]
        lw     s4, 4(a1)    # s6 = prices[i]
        blt    s4, s3, skip # skip if (prices[i - 1] > prices[i])
        sub    s5, s4, s3   # s7 = (prices[i](s6) - prices[i - 1](s5))
        add    a0, s5, a0   # sum(s0) = sum(s0) + s7
        skip:
        addi   a1, a1, 4    # pricesSize[i] to pricesSize[i+1]
        addi   s2, s2, 1    # i=i+1
        bgeu   a2, s2, loop # pricesSize <= i
exit:
    ret
Footer
© 2022 GitHub, Inc.
