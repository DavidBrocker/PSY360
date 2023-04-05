## Let's Take a Sentence

```{r}
library(stringr)
library(dplyr)
library(janeaustenr)
library(ggplot2)
library(wesanderson)

sent <- sample(sentences,1)

sent
```

### How many characters?

```{r}
str_length(sent)
```

### How many words?

```{r}
length(unlist(str_match_all(sent, "\\b\\w+\\b")))
```

### How many words start with a vowel?

```{r}
sent_split <- unlist(str_split(sent, boundary(type = "word")))

str_extract(sent_split, "^[aeiou]\\w+" )

```

### How many words start with a consonant?

```{r}
sent_split <- unlist(str_split(sent, boundary(type = "word")))
# We only need to change one character!
str_extract(sent_split, "[^aeiou]\\w+" )
```

```{r}
# Messing around
book_name <- 
  austen_books() |> 
  select(book) |> 
  unique() |> 
  pull()

# Assign page length
bk <- 
  tibble(
    book = book_name,
    page = runif(length(book),250,400) |> round(0),
    title = page/2
    ) 
bk |> 
  ggplot(aes(book,page, fill = book, label = book)) + 
  geom_bar(stat = "identity",
           show.legend = FALSE) +
  theme_void() +
  geom_text(angle = 90,
            aes(y = title,
                fontface = "bold")) +
  scale_fill_manual(values = wes_palette(8, 
                                         name = "Zissou1", 
                                         type = "continuous"))
  
```
