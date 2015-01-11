# hp <- html('http://www.hp.com')
# ht <- html_text(hp)
# startPos <- regexpr("About",ht)
# substr(ht,start=startPos,stop=startPos+100)

require(rvest)
companies <- c('hp','ebay','microsoft','cisco','google','facebook')
urls <- paste("http://www.", companies, ".com",sep="")
homePages <- lapply(urls,html)
homePagesHtml <- lapply(homePages,html_text)
lengths <- lapply(homePagesHtml, nchar)
str(lengths)

for (text1 in homePagesHtml) {
  startPos <- regexpr("About",text1)
  print(substr(text1,start=startPos,stop=startPos+100))
}

