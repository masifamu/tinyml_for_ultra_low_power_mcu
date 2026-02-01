# Intro
This repo is created in effort to collect all the usefull resources for making the ML/AI model for ultra low power MCUs.    

*I see there tensorflow repo has gone through some changes and that breaks things with older version*

# Training the model
## Getting the Docker image ready (equipped with everything) for training and getting the final Model in .h file format.
>build: sudo docker build -t tflite-micro-env .
>run: sudo docker run -it --rm -p 8888:8888 -v "$(pwd)":/work tflite-micro-env

After executing the run command you will be seeing link to open the jupyter notebook in your browser, where you can visualize the model performance and make edits as per your needs
*Remember to copy the generated model.h file to the hello_world:~/Arduino/libraries/Arduino_TensorFlowLite/examples/hello_world*

# Visulalizing the model uisng Netron tool
You can use Netron to analyze you model: It's free to download: https://github.com/lutzroeder/netron/releases/tag/v8.8.8

# Testing the model
Using tflite-micro
>make -f tensorflow/lite/experimental/micro/tools/make/Makefile hello_world_test
>./gen/linux_x86_64_default_gcc/bin/hello_world_test
This will test the model generated during the training: assuming you have updated the model in the hello_world model dir

# Running Model locally on host machine
TBD

# Writing application to run the model on Target **(Arduino Nano 33 BLE)**
1. Clone this repo   
**tflite-micro-arduino-examples**
>cd ~/Arduino/libraries
>git clone https://github.com/tensorflow/tflite-micro-arduino-examples Arduino_TensorFlowLite
2. Put this into
2. Change the dir
>cd ~/Arduino/libraries/Arduino_TensorFlowLite/examples/hello_world
3. Now compile, upload, and monitor
>arduino-cli compile --fqbn arduino:mbed_nano:nano33ble
>arduino-cli upload -p /dev/ttyACM0 --fqbn arduino:mbed_nano:nano33ble
>arduino-cli monitor -p /dev/ttyACM0 -c baudrate=115200
4. Let's monitor the output in VScode extention: serial-plotter
you will be seeing a sinewave (predicted version)

# Inference time and power measurements
TBD

## Inspiration
This work is inspired by the book:- TinyML:Machine Learning with TensorFlow Lite on Arduino and Ultra-low-power Microcontrollers by Daniel and Pete

