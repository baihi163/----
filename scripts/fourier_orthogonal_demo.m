% 傅里叶级数「正交性」可视化体验脚本
% 对应 notes/02-傅里叶级数.md §1.1
% 场景一：sin(2x)*cos(3x) → 积分 ≈ 0（正交）
% 场景二：sin(2x)*sin(2x) → 积分 ≈ π（自己乘自己）

clear; clc; close all;

% 1. 定义横坐标：一个周期 [-pi, pi]
x = linspace(-pi, pi, 1000);

% 2. 定义两个不同的基函数
f1 = sin(2*x);  % 频率为 2 的正弦波
f2 = cos(3*x);  % 频率为 3 的余弦波

% ==========================================
% 场景一：不同波相乘 (展示正交性，积分等于 0)
% ==========================================
figure('Name', '正交性：不同频率的波互相抵消', 'Position', [100, 100, 800, 600]);

subplot(2,1,1);
plot(x, f1, 'b', 'LineWidth', 2); hold on;
plot(x, f2, 'r', 'LineWidth', 2);
title('原始波形: sin(2x) 与 cos(3x)', 'FontSize', 14);
legend('sin(2x)', 'cos(3x)', 'Location', 'best');
grid on;

subplot(2,1,2);
product_diff = f1 .* f2;
plot(x, product_diff, 'k', 'LineWidth', 1.5); hold on;
area(x, max(product_diff, 0), 'FaceColor', 'g', 'FaceAlpha', 0.5);
area(x, min(product_diff, 0), 'FaceColor', 'r', 'FaceAlpha', 0.5);
integral_val_1 = trapz(x, product_diff);
title(sprintf('相乘后的波形 (正负面积完美抵消) | 积分总和 = %.4f', integral_val_1), 'FontSize', 14);
grid on;

% ==========================================
% 场景二：相同波相乘 (展示提取系数，积分不为 0)
% ==========================================
figure('Name', '提取系数：相同的波产生共振', 'Position', [150, 150, 800, 600]);

product_same = f1 .* f1;
plot(x, product_same, 'k', 'LineWidth', 1.5); hold on;
area(x, product_same, 'FaceColor', 'b', 'FaceAlpha', 0.5);
integral_val_2 = trapz(x, product_same);
title(sprintf('自己乘自己: sin^2(2x) | 积分总和 = %.4f (理论值 \\pi)', integral_val_2), 'FontSize', 14);
grid on;

fprintf('场景一 ∫ sin(2x)cos(3x) dx ≈ %.6f  (理论 0)\n', integral_val_1);
fprintf('场景二 ∫ sin²(2x) dx     ≈ %.6f  (理论 π=%.6f)\n', integral_val_2, pi);
