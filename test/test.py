# import requests
#
# resp = requests.post("https://get-prediction-ixifovjelq-wl.a.run.app", files={'file': open('eight.png', 'rb')})
#
# print(resp.json())

import keras
from keras.preprocessing import image
import numpy as np

# Step 1: Load the model from the .h5 file
model = keras.models.load_model('nn.h5')

# Step 2: Prepare input data (example with a single image)
image_path = 'three.png'
img = image.load_img(image_path, color_mode='grayscale', target_size=(28, 28))  # Resize to the model's expected input size
x = image.img_to_array(img)
x = np.expand_dims(x, axis=0)
x = x / 255.0  # Normalize the image data

# Step 3: Make predictions
predictions = model.predict(x)

# Step 4: Interpret the predictions (specific to your model and task)
predicted_class = np.argmax(predictions)
print("Predicted class:", predicted_class)
