pick :: Interaction
pick =
    Question "Do you like functional Programming?"
    (Question "do you like static types?"
    (Result "Try haskell!!!")
    (Result "Try Clojure"))
    (Question "Do you like functional Programming?"
    (Result "Try haskell!!!")
    (Result "Try Clojure"))

