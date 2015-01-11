# Output: Get some text following the substring "About" in a company's homepage
# Input: Provide the list of companies to scrape in the line below

companies <- c('hp','ebay','microsoft','cisco','google','facebook')


# How does the program work?
# 1. Get the html for a list of companies (the program prefixes http://www., and suffixes .com)
# 2. Print the lengths of the html
# 3. Find the text "About" in the html, and print the 100 characters following

require(rvest)
urls <- paste("http://www.", companies, ".com",sep="")
homePages <- lapply(urls,html)
homePagesHtml <- lapply(homePages,html_text)
lengths <- lapply(homePagesHtml, nchar)
str(lengths)

for (text1 in homePagesHtml) {
  startPos <- regexpr("About",text1)
  print(substr(text1,start=startPos,stop=startPos+100))
}

