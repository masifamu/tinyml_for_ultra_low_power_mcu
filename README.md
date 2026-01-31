build: sudo docker build -t tflite-micro-env .
run: sudo docker run -it --rm -p 8888:8888 -v "$(pwd)":/work tflite-micro-env

After executing the run command you will be seeing link to open the jupyter notebook in your browser, where you can visualize the model performance and make edits as per your needs

This work is inspired by the book:- TinyML:Machine Learning with TensorFlow Lite on Arduino and Ultra-low-power Microcontrollers by Daniel and Pete

