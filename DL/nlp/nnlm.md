
### What is NNLM
https://app.additor.io/p/OcGbY8yL

* predict n-th word from n-1 history words



### Input Vector X
* x = dot(C,w)
* w : (|V|, 1) - One hot Vector (Each Vocab lookup vector)
* C : (m, V) size - Embedding Vector for each Vocab
* x(t) : (m, 1) : embedding vector on t -th vocabulary


### Model Structure
 Xs -> hidden layer -> tanh nonlinear function -> output layer 
* bind x(t) vectors from 1 to n-1 th words to one matrix (size : n-1, m) 
* Hidden Layer : hidden size * (n-1)m
* bias of H : h * 1
* Output Layer : Vocaburary size (Output) *  hidden size
* bias of Output Layer : Vocabulary size * 1
