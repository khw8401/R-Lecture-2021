# 현실 세계의 모델링
x = c(3,6,9,12.)
y = c(3,4,5.5,6.5)
plot(x,y)

#model 1: y=o.5x+1.0
y1= 0.5*x + 1
y1 
# 평균 제곱 오차: mean squared error
(y-y1)**2
sum((y-y1)**2)
mse <- sum((y-y1)**2)/length(y)
mse

#model 2: y=5/12x +7/4
y2 = 5* x/12 +7/4
mse2 = sum((y-y2)**2)/length(y)
mse2

# R 단순 선형 회귀 모델 lm
model <- lm(y ~ x)
model

plot(x, y)
abline(model, col='red')
fitted(model)
mse_model <- sum((y - fitted(model))**2)/length(y)
mse_model

# 잔차 - Residuals
residuals(model)

#잔차 제곱합
deviance(model)
# 평균 제곱 오차(MSE0)
deviance(model)/length(y)

summary(model)

# 예측
newx <-  data.frame(x=c(1.2,2.0,20.65))
newy <-  predict(model, newdata = newx)                    
newy


x <- c(10.0, 12.0, 9.5, 22.2,8.0)
y <- c(360.2,420.0,359.5,679.0,315.3)
model <- lm(y~x)
model
deviance(model)
deviance(model)/length(y)
summary(model)
newx <- data.frame(c(10.5,25.0,15.0))
newy <- predict(model, newdata = newx)
newy
