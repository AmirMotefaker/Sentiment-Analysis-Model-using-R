{"metadata":{"kernelspec":{"name":"ir","display_name":"R","language":"R"},"language_info":{"name":"R","codemirror_mode":"r","pygments_lexer":"r","mimetype":"text/x-r-source","file_extension":".r","version":"4.0.5"}},"nbformat_minor":4,"nbformat":4,"cells":[{"source":"<a href=\"https://www.kaggle.com/code/amirmotefaker/sentiment-analysis-model-using-r?scriptVersionId=144953218\" target=\"_blank\"><img align=\"left\" alt=\"Kaggle\" title=\"Open in Kaggle\" src=\"https://kaggle.com/static/images/open-in-kaggle.svg\"></a>","metadata":{},"cell_type":"markdown"},{"cell_type":"markdown","source":"# What is Sentiment Analysis?\n- Sentiment analysis is the process of analyzing digital text to determine if the emotional tone of the message is positive, negative, or neutral. Today, companies have large volumes of text data like emails, customer support chat transcripts, social media comments, and reviews. Sentiment analysis tools can scan this text to automatically determine the author’s attitude towards a topic. Companies use the insights from sentiment analysis to improve customer service and increase brand reputation. \n# Why is sentiment analysis important?\n - Provide objective insights\n - Build better products and services\n - Analyze at scale\n - Real-time results\n \n# What are sentiment analysis use cases?\n  - Improve customer service\n  - Brand monitoring\n  - Market research\n  - Track campaign performance\n  \n# What are the different types of sentiment analysis?\n - Fine-grained scoring\n - Aspect-based\n - Intent-based\n - Emotional detection\n \n\n##### Reference : [Amazon](https://aws.amazon.com/what-is/sentiment-analysis/)\n\n\n# Sentiment Analysis Model:\n- We will carry out sentiment analysis with R in this project. The dataset that we will use will be provided by the R package ‘janeaustenR’.\n\n## janeaustenr: Jane Austen's Complete Novels:\n- Full texts for Jane Austen's 6 completed novels, ready for text analysis. These novels are \"Sense and Sensibility\", \"Pride and Prejudice\", \"Mansfield Park\", \"Emma\", \"Northanger Abbey\", and \"Persuasion\". [janeaustenr](https://cran.r-project.org/web/packages/janeaustenr/index.html)\n\n\n- In order to build our project on sentiment analysis, we will make use of the tidytext package that comprises sentiment lexicons that are present in the dataset of ‘sentiments’.","metadata":{"_uuid":"051d70d956493feee0c6d64651c6a088724dca2a","_execution_state":"idle"}},{"cell_type":"markdown","source":"# Install Libraries","metadata":{}},{"cell_type":"code","source":"install.packages(\"janeaustenr\")\ninstall.packages(\"tidytext\")","metadata":{"execution":{"iopub.status.busy":"2023-10-02T09:39:16.414073Z","iopub.execute_input":"2023-10-02T09:39:16.415635Z","iopub.status.idle":"2023-10-02T09:39:41.480087Z"},"trusted":true},"execution_count":null,"outputs":[]},{"cell_type":"markdown","source":"# Import Libraries","metadata":{}},{"cell_type":"code","source":"library(tidytext)","metadata":{"execution":{"iopub.status.busy":"2023-10-02T09:39:41.484003Z","iopub.execute_input":"2023-10-02T09:39:41.485868Z","iopub.status.idle":"2023-10-02T09:39:41.499462Z"},"trusted":true},"execution_count":null,"outputs":[]},{"cell_type":"code","source":"sentiments","metadata":{"execution":{"iopub.status.busy":"2023-10-02T09:39:41.503216Z","iopub.execute_input":"2023-10-02T09:39:41.504885Z","iopub.status.idle":"2023-10-02T09:39:41.585405Z"},"trusted":true},"execution_count":null,"outputs":[]},{"cell_type":"markdown","source":"# Unigrams\n- We will make use of three general-purpose lexicons:\n\n    - AFINN\n    - bing\n    - loughran\n\n- These three lexicons make use of the unigrams. Unigrams are a type of n-gram model that consists of a sequence of 1 item, that is, a word collected from a given textual data.\n\n- In the AFINN lexicon model scores the words in a range from -5 to 5. The increase in negativity corresponds the negative sentiment whereas an increase in positivity corresponds the positive one. \n- The bing lexicon model on the other hand, classifies the sentiment into a binary category of negative or positive. \n- The loughran model that performs analysis of the shareholder’s reports. In this project, we will make use of the bing lexicons to extract the sentiments out of our data. \n\n#### Reference: [ScienceDirect](https://www.sciencedirect.com/science/article/abs/pii/S095741741830143X)","metadata":{}},{"cell_type":"markdown","source":"# Sentiments","metadata":{}},{"cell_type":"markdown","source":"## We can retrieve these lexicons using the get_sentiments() function. We can implement this as follows:","metadata":{}},{"cell_type":"code","source":"get_sentiments(\"bing\")","metadata":{"execution":{"iopub.status.busy":"2023-10-02T09:39:41.588994Z","iopub.execute_input":"2023-10-02T09:39:41.590644Z","iopub.status.idle":"2023-10-02T09:39:41.637764Z"},"trusted":true},"execution_count":null,"outputs":[]},{"cell_type":"markdown","source":"# Performing Sentiment Analysis with the Inner Join\n- In this step, we will import our libraries ‘janeaustenr’, ‘stringr’ as well as ‘tidytext’. The janeaustenr package will provide us with the textual data in the form of books authored by the novelist Jane Austen. Tidytext will allow us to perform efficient text analysis on our data. We will convert the text of our books into a tidy format using unnest_tokens() function.","metadata":{}},{"cell_type":"code","source":"library(janeaustenr)\nlibrary(stringr)\nlibrary(tidytext)\nlibrary(dplyr)","metadata":{"execution":{"iopub.status.busy":"2023-10-02T09:39:41.639944Z","iopub.execute_input":"2023-10-02T09:39:41.641286Z","iopub.status.idle":"2023-10-02T09:39:41.65802Z"},"trusted":true},"execution_count":null,"outputs":[]},{"cell_type":"code","source":"\ntidy_data <- austen_books() %>%\n group_by(book) %>%\n mutate(linenumber = row_number(),\n   chapter = cumsum(str_detect(text, regex(\"^chapter [\\\\divxlc]\", \n                          ignore_case = TRUE)))) %>%\nungroup() %>%\nunnest_tokens(word, text)","metadata":{"execution":{"iopub.status.busy":"2023-10-02T09:39:41.660212Z","iopub.execute_input":"2023-10-02T09:39:41.661456Z","iopub.status.idle":"2023-10-02T09:39:42.562032Z"},"trusted":true},"execution_count":null,"outputs":[]},{"cell_type":"markdown","source":"# Each row contains a single word","metadata":{}},{"cell_type":"markdown","source":"### We have performed the tidy operation on our text such that each row contains a single word. We will now make use of the “bing” lexicon to implement a filter() over the words that correspond to joy. We will use the book Sense and Sensibility and derive its words from implementing our sentiment analysis model:","metadata":{}},{"cell_type":"code","source":"positive_senti <- get_sentiments(\"bing\") %>%\n filter(sentiment == \"positive\")\ntidy_data %>%\n filter(book == \"Emma\") %>%\n semi_join(positive_senti) %>%\n count(word, sort = TRUE)","metadata":{"execution":{"iopub.status.busy":"2023-10-02T09:39:42.565191Z","iopub.execute_input":"2023-10-02T09:39:42.566493Z","iopub.status.idle":"2023-10-02T09:39:42.679189Z"},"trusted":true},"execution_count":null,"outputs":[]},{"cell_type":"markdown","source":"# Separate columns of positive and negative","metadata":{}},{"cell_type":"markdown","source":"- From our above result, we observe many positive words like “good”, “happy”, “love” etc. In the next step, we will use the spread() function to segregate our data into separate columns of positive and negative sentiments. We will then use the mutate() function to calculate the total sentiment, that is, the difference between positive and negative sentiment.","metadata":{}},{"cell_type":"code","source":"library(tidyr)\nbing <- get_sentiments(\"bing\")\nEmma_sentiment <- tidy_data %>%\n inner_join(bing) %>%\n count(book = \"Emma\" , index = linenumber %/% 80, sentiment) %>%\n spread(sentiment, n, fill = 0) %>%\n mutate(sentiment = positive - negative)","metadata":{"execution":{"iopub.status.busy":"2023-10-02T09:39:42.681405Z","iopub.execute_input":"2023-10-02T09:39:42.682673Z","iopub.status.idle":"2023-10-02T09:39:42.832218Z"},"trusted":true},"execution_count":null,"outputs":[]},{"cell_type":"markdown","source":"# Visualize the words present in the book","metadata":{}},{"cell_type":"markdown","source":"### we will visualize the words present in the book “Emma” based on their corresponding positive and negative scores:","metadata":{}},{"cell_type":"code","source":"library(ggplot2)\nggplot(Emma_sentiment, aes(index, sentiment, fill = book)) +\n geom_bar(stat = \"identity\", show.legend = TRUE) +\n facet_wrap(~book, ncol = 2, scales = \"free_x\")","metadata":{"execution":{"iopub.status.busy":"2023-10-02T09:39:42.834441Z","iopub.execute_input":"2023-10-02T09:39:42.835709Z","iopub.status.idle":"2023-10-02T09:39:43.152874Z"},"trusted":true},"execution_count":null,"outputs":[]},{"cell_type":"markdown","source":"# Counting the most common words","metadata":{}},{"cell_type":"markdown","source":"###  Now proceed toward counting the most common positive and negative words that are present in the novel:","metadata":{}},{"cell_type":"code","source":"counting_words <- tidy_data %>%\n inner_join(bing) %>%\n count(word, sentiment, sort = TRUE)\nhead(counting_words)","metadata":{"execution":{"iopub.status.busy":"2023-10-02T09:39:43.155068Z","iopub.execute_input":"2023-10-02T09:39:43.156326Z","iopub.status.idle":"2023-10-02T09:39:43.321867Z"},"trusted":true},"execution_count":null,"outputs":[]},{"cell_type":"markdown","source":"# Visualization","metadata":{}},{"cell_type":"markdown","source":"### In the next step, we will perform a visualization of our sentiment score. We will plot the scores along the axis that is labeled with both positive as well as negative words. We will use ggplot() function to visualize our data based on their scores:","metadata":{}},{"cell_type":"code","source":"counting_words %>%\n filter(n > 150) %>%\n mutate(n = ifelse(sentiment == \"negative\", -n, n)) %>%\n mutate(word = reorder(word, n)) %>%\n ggplot(aes(word, n, fill = sentiment))+\n geom_col() +\n coord_flip() +\n labs(y = \"Sentiment Score\")","metadata":{"execution":{"iopub.status.busy":"2023-10-02T09:39:43.324447Z","iopub.execute_input":"2023-10-02T09:39:43.325743Z","iopub.status.idle":"2023-10-02T09:39:43.679474Z"},"trusted":true},"execution_count":null,"outputs":[]},{"cell_type":"markdown","source":"### Create a wordcloud that will delineate the most recurring positive and negative words. In particular, we will use the comparision.cloud() function to plot both negative and positive words in a single wordcloud as follows:","metadata":{}},{"cell_type":"code","source":"library(reshape2)\nlibrary(wordcloud)\ntidy_data %>%\n    inner_join(bing) %>%\n    count(word, sentiment, sort = TRUE) %>%\n    acast(word ~ sentiment, value.var = \"n\", fill = 0) %>%\n    comparison.cloud(colors = c(\"red\", \"dark green\"),\n                     max.words = 100)","metadata":{"execution":{"iopub.status.busy":"2023-10-02T09:39:43.681895Z","iopub.execute_input":"2023-10-02T09:39:43.683307Z","iopub.status.idle":"2023-10-02T09:39:44.319356Z"},"trusted":true},"execution_count":null,"outputs":[]},{"cell_type":"markdown","source":"- This word cloud will enable us to efficiently visualize the negative as well as positive groups of data. Therefore, we are now able to see the different groups of data based on their corresponding sentiments.","metadata":{}},{"cell_type":"markdown","source":"# Summary\n- We went through our project of sentiment analysis in R. We learned about the concept of sentiment analysis and implemented it over the dataset of Jane Austen’s books. We were able to delineate it through various visualizations after we performed data wrangling on our data. We used a lexical analyzer – ‘bing’ in this instance of our project. Furthermore, we also represented the sentiment score through a plot and also made a visual report of wordcloud.","metadata":{}}]}