#!flask/bin/python
from flask import Flask, request, jsonify
print ("pass 2")

app = Flask(__name__)
print ("pass 3")
import joblib
# from sklearn.externals import joblib
print ("pass 4")
pipeline = joblib.load('models/pipeline.pkl')
targets = joblib.load('models/targets.pkl')
print ("pass 5")
def predict(text):
    idx = pipeline.predict([text])[0]
    return targets[idx]
print ("pass 6")
@app.route('/')
def index():
    text = request.args.get('text')
    result = {'prediction' : predict(text)}
    return jsonify(result)
print ("pass 7")
if __name__ == '__main__':
    print ("pass 1")
    app.run(debug=True)
    print ("pass 9")
    #app.run(debug=True, host='0.0.0.0', port=8080) # Launch built-in we server and run this Flask webapp