## **Project 1: Automated Uncompressing** 
The main goal of this assignment is to classify compressed files with different file extensions into corresponding folders <br>
and extract them into the directories, record the students who didn't submit the assignment, and record the students who <br>
submitted compressed files with incorrect file extensions.

### **Method1: Shell Script Execution**
1. Use `unzip Linux_Week5_Lab.zip` to extract the archive.
2. move the `auto-uncompressing.sh` into `Linux_Week5_Lab` directory.
3. Modify the parameter named `targetFile` in the `auto-uncompressing.sh` to your path of Linux_Week5_Lab directory before execute the shell script.
4. Enter `sh auto-uncompressing.sh` in the terminal to execute the shell script.

### **Method2: Build Docker image**
1. Use `docker build -t <image-name> .` to build the image.
2. Use `docker run -it <image-name> bash` to enter the container.
3. Enter `cd Linux_Week5_Lab` 
4. Modify the parameter named `targetFile` in the `auto-uncompressing.sh` to your path of Linux_Week5_Lab directory before execute the shell script.
5. Enter `sh auto-uncompressing.sh` to execute the shell script.
