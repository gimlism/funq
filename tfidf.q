\l funq.q
\l stopwords.q
\l pandp.q
\l bible.q
\l moby.q

-1 "cleaning and stemming text";
s:(.porter.stem each " " vs .util.stripstr lower .util.cleanstr@) peach moby.s
-1 "computing vocabulary (droping stop words)";
v:asc distinct[raze s] except stopwords.xpo6
-1 "building a matrix of word count per document (chapter)";
m:((count each group@) each s)@\:v
-1 "building a vector space model (with different examples of tf-idf)";
-1 "vanilla tf-idf";
vsm:0f^.ml.tfidf[::;.ml.idf] m
-1 "log normalized term frequency, inverse document frequency max";
vsm:0f^.ml.tfidf[.ml.lntf;.ml.idfm] m
-1 "double normalized term frequency, probabilistic inverse document frequency";
vsm:0f^.ml.tfidf[.ml.dntf[.5];.ml.pidf] m
-1 "display values of top words based on tf-idf";
show vsm@'idesc each vsm
-1 "display top words based on tf-idf";
show w 5#/:idesc each vsm

vsm:0f^.ml.tfidf[::;.ml.idf] m
X:.ml.normalize vsm
C:.ml.skmeans[X] -30?/:X
g:.ml.cgroup[.ml.cosdist;X;C] / classify
