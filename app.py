from flask import Flask
import os
app = Flask(__name__)

@app.route('/')
def hello_world():
    return "<p>Hello, world</p>"

if __name__ == '__main__':
    app.run(port=os.environ.get('PORT', 5000), host='0.0.0.0', debug=True) 
    #turning host to 0.0.0.0 makes it public so it can be hosted