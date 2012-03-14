cd C:/qg

set -eux
TARGET=question-generation.jar
rm -rf bin
mkdir -p bin

javac -cp "C:/qg/lib/arkref.jar;C:/qg/lib/commons-lang-2.4.jar;C:/qg/lib/commons-logging.jar;C:/qg/lib/junit-3.8.2.jar;C:/qg/lib/jwnl.jar;C:/qg/lib/stanford-parser-2008-10-26.jar;C:/qg/lib/weka-3-6.jar;C:/qg/lib/supersense-tagger.jar" -d bin C:/qg/src/edu/cmu/ark/*.java C:/qg/src/edu/cmu/ark/ranking/*.java C:/qg/src/edu/cmu/ark/tests/*.java

cd bin
jar xf C:/qg/lib/commons-logging.jar
jar xf C:/qg/lib/jwnl.jar
jar xf C:/qg/lib/junit-3.8.2.jar
jar xf C:/qg/lib/stanford-parser-2008-10-26.jar
jar xf C:/qg/lib/supersense-tagger.jar
jar xf C:/qg/lib/weka-3-6.jar
#jar xf C:/gq/lib/commons-math-2.1.jar
jar xf C:/qg/lib/commons-lang-2.4.jar
jar xf C:/qg/lib/arkref.jar

jar cf $TARGET *
cd ..

mv bin/$TARGET .

  

