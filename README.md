# Headless Zeppelin + Spark + Breeze

**IMPORTANT** remove the cell from your notebook `export DISPLAY=:0.0` !

```bash
git clone <this-repo>
cd <this-repo>
./build.sh
./run-zeppelin-docker.sh

# in another terminal, do
cd <this-repo>
cd data
git clone https://github.com/sryza/aas.git
cd aas
mvn package # you must have maven installed on your local machine
cd ch09-risk
mvn package # I think you don't have to do this, but you know...
cd data
unzip factors.zip
unzip stocks.zip
```

Now, open your browser to http://localhost:8080 and import your notebook `xxx.json`.

Execute this cell: `z.load("/data/aas/ch09-risk/target/ch09-risk-2.0.0-jar-with-dependencies.jar")`

Then try to plot a basic plot like:

```scala
%spark

import breeze.linalg._
import breeze.plot._

val f = Figure()
val p = f.subplot(0)
val x = linspace(0.0,1.0)
p += plot(x, x :^ 2.0)
p += plot(x, x :^ 3.0, '.')
p.xlabel = "x axis"
p.ylabel = "y axis"
f.saveas("/data/lines.png") // note: the image cannot be shown in zeppelin, so you have to save it somewehre (e.g. in the volume /data mounted inside your Docker container). Then open it on your local machine. Maybe you can try to show it using a markdown cell in zeppelin.
```


Also in the cell where `plotDistribution()` is called change this:

```scala
plotDistribution(factorsReturns(0))
```

to:

```scala
plotDistribution(factorsReturns(0)).saveas("/data/toto.png")
```
