class Solution:

    def coinChange(self, coins: List[int], total_amount: int) -> int:
        # 1원 ~ total_amount원 사이의 모든 금액을 최대 동전 갯수로 초기화
        dp = [0] + [total_amount + 1 for _ in range(total_amount)]
        # 최소 동전 갯수를 1원부터 모두 계산
        for amount in range(1, total_amount + 1):
            for coin in coins:
                if amount - coin >= 0:
                    dp[amount] = min(dp[amount], dp[amount - coin] + 1)
        fewest_number_of_coins = dp[total_amount]
        if fewest_number_of_coins <= total_amount:
            return fewest_number_of_coins
        return -1
