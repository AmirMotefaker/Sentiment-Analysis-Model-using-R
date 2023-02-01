{"cells":[{"source":"<a href=\"https://www.kaggle.com/code/amirmotefaker/sentiment-analysis-model-using-r?scriptVersionId=117896456\" target=\"_blank\"><img align=\"left\" alt=\"Kaggle\" title=\"Open in Kaggle\" src=\"https://kaggle.com/static/images/open-in-kaggle.svg\"></a>","metadata":{},"cell_type":"markdown","outputs":[],"execution_count":0},{"cell_type":"markdown","id":"d5678889","metadata":{"_execution_state":"idle","_uuid":"051d70d956493feee0c6d64651c6a088724dca2a","papermill":{"duration":0.00165,"end_time":"2023-02-01T06:06:10.77894","exception":false,"start_time":"2023-02-01T06:06:10.77729","status":"completed"},"tags":[]},"source":["# What is Sentiment Analysis?\n","- Sentiment analysis is the process of analyzing digital text to determine if the emotional tone of the message is positive, negative, or neutral. Today, companies have large volumes of text data like emails, customer support chat transcripts, social media comments, and reviews. Sentiment analysis tools can scan this text to automatically determine the author’s attitude towards a topic. Companies use the insights from sentiment analysis to improve customer service and increase brand reputation. \n","# Why is sentiment analysis important?\n"," - Provide objective insights\n"," - Build better products and services\n"," - Analyze at scale\n"," - Real-time results\n"," \n","# What are sentiment analysis use cases?\n","  - Improve customer service\n","  - Brand monitoring\n","  - Market research\n","  - Track campaign performance\n","  \n","# What are the different types of sentiment analysis?\n"," - Fine-grained scoring\n"," - Aspect-based\n"," - Intent-based\n"," - Emotional detection\n"," \n","\n","##### Reference : [Amazon](https://aws.amazon.com/what-is/sentiment-analysis/)\n","\n","\n","# Sentiment Analysis Model:\n","- We will carry out sentiment analysis with R in this project. The dataset that we will use will be provided by the R package ‘janeaustenR’.\n","\n","## janeaustenr: Jane Austen's Complete Novels:\n","- Full texts for Jane Austen's 6 completed novels, ready for text analysis. These novels are \"Sense and Sensibility\", \"Pride and Prejudice\", \"Mansfield Park\", \"Emma\", \"Northanger Abbey\", and \"Persuasion\". [janeaustenr](https://cran.r-project.org/web/packages/janeaustenr/index.html)\n","\n","\n","- In order to build our project on sentiment analysis, we will make use of the tidytext package that comprises sentiment lexicons that are present in the dataset of ‘sentiments’."]}],"metadata":{"kernelspec":{"display_name":"R","language":"R","name":"ir"},"language_info":{"codemirror_mode":"r","file_extension":".r","mimetype":"text/x-r-source","name":"R","pygments_lexer":"r","version":"4.0.5"},"papermill":{"default_parameters":{},"duration":3.518633,"end_time":"2023-02-01T06:06:10.899349","environment_variables":{},"exception":null,"input_path":"__notebook__.ipynb","output_path":"__notebook__.ipynb","parameters":{},"start_time":"2023-02-01T06:06:07.380716","version":"2.4.0"}},"nbformat":4,"nbformat_minor":5}