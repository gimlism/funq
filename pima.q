pima.f:"pima-indians-diabetes.data"
pima.b:"http://archive.ics.uci.edu/ml/machine-learning-databases/pima-indians-diabetes/"
-1"downloading handwritten pima indians diabetes data set";
.util.download[pima.b;;"";::] pima.f
pima.XY:("EEEEEEEEB";",")0:`$pima.f
pima.X:-1_pima.XY
pima.y:first pima.Y:-1#pima.XY
pima.t:`class xcols flip `preg`plas`pres`skin`test`mass`pedi`age`class!pima.XY