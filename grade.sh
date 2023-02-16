rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

cd student-submission

if [[ -f ListExamples.java ]] 
then 
    echo "ListExamples found"
else 
    echo "need file ListExamples.java"
    exit 1
fi

cp ListExamples.java ..
cd ..
javac -cp ".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" *.java 2>compile-error.txt

if [[ $? -ne 0 ]]
then 
    echo "COMPILATION ERROR:"
    cat compile-error.txt
fi

java -cp ".;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore TestListExamples >runtime-output.txt
cat runtime-output.txt