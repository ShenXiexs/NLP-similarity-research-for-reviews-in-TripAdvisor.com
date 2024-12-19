
library(tidyverse)
library(lubridate)
library(data.table)
library(tibble)
library(stm)
library(dplyr)
library(lubridate)  #date
library(tm)
library(data.table)
library(readr)
library(lubridate)
library(stopwords)
library(Cairo)

load('test_Numhelpful_factor.RData')
# 将ReviewText列转换为UTF-8格式
set.seed(202404)

english <- stopwords(language = "en", source = "stopwords-iso")


# 函数定义
process_data <- function(stopwords, thresh, seed_value=202404) {
  set.seed(seed_value)
  
  # 文本处理
  processed <- textProcessor(test$ReviewText, metadata = test,
                             onlycharacter = TRUE,
                             customstopwords = stopwords)
  
  # 准备文档
  out <- prepDocuments(
    processed$documents,
    processed$vocab,
    processed$meta,
    lower.thresh = thresh
  )
  
  # STM 计算
  poliblogPrevFit <- stm(
    out$documents,
    out$vocab,
    K = 25,
    prevalence = ~HotelID + year_month + AvgRatingStarsThisUser + log(length),
    max.em.its = 100,
    data = out$meta,
    init.type = "Spectral",
    seed=seed_value
  )
  
  print("STM successfully!")
  
  print("Start Saving!")
  
  # 动态生成文件名
  fileName_Model <- paste0("stm_model_25_co_", thresh, ".RData")
  # 保存 STM 模型的参数
  save(poliblogPrevFit, file=fileName_Model)
  
  print("Saved successfully!")

  # 提取 Top Words
  topwords <- as.data.frame(labelTopics(poliblogPrevFit, 1:25)$frex)
  topwords <- cbind(topwords, as.data.frame(
    colSums(poliblogPrevFit$theta) / nrow(poliblogPrevFit$theta)
  ))
  names(topwords)[8] <- "Prop"
  topic <- topwords[, 1]
  
  # 保存 Top Words 数据框
  write.csv(topwords, paste0("topwords_stopwords_", length(stopwords), "lower_", thresh, ".csv"))
  
  
}

# 获取命令行参数
args <- commandArgs(trailingOnly=TRUE)
stopwords <- eval(parse(text=args[1]))
thresh <- as.integer(args[2])

# 运行函数
process_data(stopwords, thresh, 202404)









