library(rvest)

# single_page_crawler
single_page_crawler <- function(page_url) {
  n_recs <- ".hl"
  article_title <- ".title a"
  article_date <- ".date"
  author <- ".author"

  html_doc <- read_html(page_url)
  page_content <- list()
  cols <- c(n_recs, article_title, article_date, author)
  for (i in 1:length(cols)) {
    page_content[[i]] <- html_doc %>%
      html_nodes(css = cols[i]) %>%
      html_text
  }
  return(page_content)
}

multi_page_crawler <- function(page_url, n_pages) {
  # get last_page_number
  last_page <- ".wide:nth-child(2)"
  last_page_url <- read_html(url) %>%
    html_nodes(css = last_page) %>%
    html_attr("href")
  
  number_pattern <- "[0-9]+"
  regexpr_m <- gregexpr(pattern = number_pattern, last_page_url)
  last_page_number <- last_page_url %>%
    regmatches(m = regexpr_m) %>%
    as.numeric
  
  n_pages <- 10
  page_numbers <- c((last_page_number - n_pages - 1):last_page_number, "")
  page_urls <- paste0("https://www.ptt.cc/bbs/NBA/index", page_numbers, ".html")
  
  pages_list <- list()
  for (i in 1:length(page_urls)) {
    pages_list[[i]] <- single_page_crawler(page_urls[i])
  }
  return(pages_list)
}

# call function
url <- "https://www.ptt.cc/bbs/NBA/index.html"
nba_10_pages <- multi_page_crawler(url, n_pages = 10)