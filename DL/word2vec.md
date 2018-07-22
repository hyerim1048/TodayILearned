
https://app.additor.io/p/OcGbY8yL

Model Architectures
distributed representations of words learned by neural networks
Training Complexity
O = E * T * Q
E : number of training epochs
commonly use 3 ~ 50
T : number of the words in the training set
up to 1 billion
Q : different from each model architecture
All are trained using SGD and BP


New Log Linear Models
computational complexity by non linear hidden layer


Continuous Bag of Words Model

Similar to feedforward NNLM but non linear hidden layer is removed and the projection layer is shared for all words -> all words get projected into the same position 
same position -> averaged vectors like bag of words model -> order of words is not important
building a log-linear classifier to classify the middle word
using four history words and four future words as input
Q = N * D + D * log2(V)


Continuous Skip-gram Model

using each current word as an input to a log-linear classfier with projection layer
predict words within a certain range
increasing range -> improving quality of the result, but increase computational complexity
less weight to the distant words by sampling less from training example(?)
Q = C * (D + D * log2(V))
C : maximum distance of the words
if C = 5, training words are selected randomly a number R in range <1; C> -> using R from history words and R words from the future  as correct labels



### More About Skip Gram Model

more detailed explanation
In the skip-gram model,
if vocab size = 10000.
input vector = place 1 in the position corresponding to the middle word and 0s in all of the other positions (10000 dim )
output is also a single vector but has a probability distribution (with 10,000 components)
Hidden Layer is ,in fact, the word vector lookup table!
Source : http://mccormickml.com/2017/01/11/word2vec-tutorial-part-2-negative-sampling/

