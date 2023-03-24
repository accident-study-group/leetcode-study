class Solution:
    def trap(self, heights: List[int]) -> int:
        stack = []
        trapped = 0
        for current in range(len(heights)):
            if current == 0:
                continue
            previous = current - 1
            # 현재 고도가 높아졌으면
            if heights[current] >= heights[previous]:
                filled_height = heights[previous]
                while stack and heights[current] > filled_height:
                    trap_start = stack.pop()
                    water_width = current - trap_start - 1
                    water_heigth = min(heights[current], heights[trap_start]) - filled_height
                    trapped += water_width * water_heigth
                    filled_height += water_heigth
                    if heights[current] < heights[trap_start]:
                        stack.append(trap_start)
            # 현재 고도가 낮아졌고, 이전 고도가 0이 아니면 stack에 추가
            elif heights[previous]:
                stack.append(previous)
        return trapped
