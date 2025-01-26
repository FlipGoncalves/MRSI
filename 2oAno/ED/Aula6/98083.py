from collections import Counter
import pandas as pd                                                             # type: ignore
import nltk                                                                     # type: ignore
from nltk.tokenize import word_tokenize, sent_tokenize                          # type: ignore
from nltk.corpus import stopwords                                               # type: ignore
from nltk.stem import PorterStemmer, WordNetLemmatizer                          # type: ignore
from nltk.util import ngrams                                                    # type: ignore
from sklearn.feature_extraction.text import CountVectorizer, TfidfVectorizer    # type: ignore
import matplotlib.pyplot as plt                                                 # type: ignore
import seaborn                                                                  # type: ignore

# Download necessary NLTK resources
nltk.download('punkt_tab')
nltk.download('stopwords')
nltk.download('wordnet')

# get data
df = pd.read_csv("tripadvisor_hotel_reviews.csv").dropna()

# apply tokenizers
sentences = df["Review"].apply(sent_tokenize)
words = df['Review'].apply(word_tokenize)

# filter by stop words
stop_words = set(stopwords.words('english'))
filtered = [[word for word in word_list if word.lower() not in stop_words and word.isalnum()] for word_list in words]

# apply lemmetizer
lemmatizer = WordNetLemmatizer()
lemmetized = [[lemmatizer.lemmatize(word) for word in word_list] for word_list in filtered]

# create series with the sentences and the lemmetized words
df['Sentences'] = sentences 
df['Words'] = lemmetized

# graph the review length
plt.subplot(1, 3, 1)
seaborn.histplot(df['Review'].apply(len), kde=True)
plt.title('Comprimento das Avaliações')

# graph the word count
plt.subplot(1, 3, 2)
seaborn.histplot(df['Words'].apply(len), kde=True)
plt.title('Número de Palavras')

# graph the sentence size
plt.subplot(1, 3, 3)
seaborn.histplot(df['Sentences'].apply(len))
plt.title('Comprimento das Frases')
plt.show()

# get all words
total_words = [word for all_words in df['Words'] for word in all_words]

# apply ngrams for bigrams and tigrams identification
bigrams = [bigram for all_words in df['Words'] for bigram in ngrams(all_words, 2)]
trigrams = [trigram for all_words in df['Words'] for trigram in ngrams(all_words, 3)]

# get most common words, bigrams and trigrams
most_common_words = Counter(total_words).most_common(10)
bigram_counts = Counter(bigrams).most_common(10)
trigram_counts = Counter(trigrams).most_common(10)

# graph the most common words
seaborn.barplot(x=[word[0] for word in most_common_words], y=[word[1] for word in most_common_words])
plt.title('Top 10 Palavras Mais Frequentes')
plt.show()

# graph the most common bigrams
seaborn.barplot(x=[' '.join(bigram[0]) for bigram in bigram_counts], y=[bigram[1] for bigram in bigram_counts])
plt.title('Top 10 Bi-gramas')
plt.show()

# graph the most common trigrams
seaborn.barplot(x=[' '.join(trigram[0]) for trigram in trigram_counts], y=[trigram[1] for trigram in trigram_counts])
plt.title('Top 10 Tri-gramas')
plt.show()