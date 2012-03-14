set -eux
TARGET=question-generation.jar
rm -rf bin
mkdir -p bin

javac -cp "lib/arkref.jar;lib/commons-lang-2.4.jar;lib/junit-3.8.2.jar;lib/jwnl.jar;lib/stanford-parser-2008-10-26.jar;lib/weka-3-6.jar;lib/supersense-tagger.jar;lib/commons-logging.jar;" -d bin src/edu/cmu/ark/*.java src/edu/cmu/ark/ranking/*.java src/edu/cmu/ark/tests/*.java

cd bin
jar xf ../lib/commons-logging.jar
jar xf ../lib/jwnl.jar
jar xf ../lib/junit-3.8.2.jar
jar xf ../lib/stanford-parser-2008-10-26.jar
jar xf ../lib/supersense-tagger.jar
jar xf ../lib/weka-3-6.jar
#jar xf C:/gq/lib/commons-math-2.1.jar
jar xf ../lib/commons-lang-2.4.jar
jar xf ../lib/arkref.jar

jar cf $TARGET *
cd ..

mv bin/$TARGET .

  

