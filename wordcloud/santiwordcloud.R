# use jiebaR package
# https://www.cnblogs.com/wjunge/p/10141723.html


setwd("D:\\Rplot/")
library(jiebaR)
library(wordcloud2)

# user表示需要组合到一起的单词，也就是词库，自己造了一个，用到的材料有：
# https://blog.csdn.net/dilifish/article/details/117885706
# https://blog.csdn.net/stay_foolish12/article/details/111575884
# 常用汉字3500字

#stop_word删除不需要出现的词，也就是停止词
engine_s <- worker(user = "D:/Rplot/ciku/THUOCL_chengyu.txt", 
                   stop_word = "D:/Rplot/tingyongci/tingzhicisum.txt")

# 导入待处理文本
position <- readLines("santi.txt")
# head(position)

# 分词处理
seg <- segment(position, engine_s)

# length(seg)
# head(seg)

#统计词频
f <- freq(seg)
# dim(f)
# head(f)

#根据词频降序排列(FALSE升序排列)
f <- f[order(f[,2], decreasing = TRUE),]
# head(f, 10)

# 预览
fcloud <- f[0:50, ]

# 绘制词云
wordcloud2(fcloud, size = 2, 
           fontFamily = "微软雅黑",
           color = "random-light", 
           backgroundColor = "grey")
