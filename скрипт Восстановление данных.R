# подключение библиотеки чтения Екселя
library(readxl)
# подключение библиотеки восстановения данных
library(imputeTS)
rwater <- read_excel("F:/My computer/Мои документы/ХНУ Каразина/Туманов А/rwater.xls")
View(rwater)
plot(rwater)
tsen <- ts(rwater[,3], start=2010, frequency = 12)
plot(tsen)
tsimportmid <- na_mean (tsen, option = "mean", maxgap = Inf)
plot(tsimportmid)
tsimportsplit <- na_seasplit( tsen, algorithm = "interpolation", find_frequency = FALSE, maxgap = Inf )
plot(tsimportsplit)
tsimportrand <- na_random(tsen, lower_bound = NULL, upper_bound = NULL, maxgap = Inf)
plot(tsimportrand)
taimportremov <- na_remove(tsen)
plot(taimportremov)
tsimportrepl <- na_replace(tsen, fill = 0, maxgap = Inf)
plot(tsimportrepl)


