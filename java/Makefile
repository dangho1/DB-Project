
.PHONY: run
run: class/DBApp.class
	java -cp "class:jar/mysql-connector-java-5.1.49.jar" DBApp

class/DBApp.class: src/DBApp.java class/
	javac -sourcepath "src" -d "class" -cp "jar/mysql-connector-java-5.1.49.jar" src/DBApp.java

class/:
	mkdir class

.PHONY: clean
clean:
	-rm -rf class
