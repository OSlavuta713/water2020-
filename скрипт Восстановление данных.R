# подключение библиотеки чтения Екселя
library(readxl)
# подключение библиотеки восстановения данных
library(imputeTS)
rwater <- read_excel("F:/My computer/Мои документы/ХНУ Каразина/Туманов А/rwater.xls")
View(rwater)
plot(rwater)
 <- ts(rwater[,3], start=2010, frequency = 12)
plot(tsen)
tsimportmid <- na_mean (tsen, option = "mean", maxgap = Inf)
plot(tsimportmid)
 <- na_seasplit( tsen, algorithm = "interpolation", find_frequency = FALSE, maxgap = Inf )
plot(tsimportsplit)
tsimportrand <- na_random(tsen, lower_bound = NULL, upper_bound = NULL, maxgap = Inf)
plot(tsimportrand)
taimportremov <- na_remove(tsen)
plot(taimportremov)
tsimportrepl <- na_replace(tsen, fill = 0, maxgap = Inf)
plot(tsimportrepl)
st1 <- stl(tsimportsplit, t.window=13, s.window = 12)
plot(st1)
# прогнозирование методом ETS
ETS <- forecast(ets(tsimportsplit), h=12)
plot(ETS)
STL <-stlf(tsimportsplit, lambda=0, h=12, biasadj=TRUE)
plot(STL)
ARIMA <- forecast(auto.arima(tsimportsplit, lambda=0, biasadj=TRUE),h=12)
plot(ARIMA)
NNAR <- forecast(nnetar(tsimportsplit), h=12)
plot(NNAR)
TBATS <- forecast(tbats(tsimportsplit, biasadj=TRUE), h=12)
plot(TBATS)
Combination <-(ETS[["mean"]] + ARIMA[["mean"]] + STL[["mean"]] +
+                    NNAR[["mean"]] + TBATS[["mean"]])/5
autoplot(tsimportsplit, linetype = "dashed") +
+     autolayer(ETS, series="ETS", PI=FALSE) +
+     autolayer(ARIMA, series="ARIMA", PI=FALSE) +
+     autolayer(STL, series="STL", PI=FALSE) +
+     autolayer(NNAR, series="NNAR", PI=FALSE) +
+     autolayer(TBATS, series="TBATS", PI=FALSE) +
+     autolayer(Combination, series="Combination") +
+     xlab("Рік") 
+     ylab("Імпорт води Україною")
guides(colour=guide_legend(title=""))
scale_x_continuous(expand = c(0, 0))
scale_y_continuous(expand = c(0, 0))
scale_x_continuous(breaks= seq(2010, 2024, 2))



