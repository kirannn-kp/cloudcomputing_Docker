from flask import Flask, jsonify
from flask_cors import CORS

app = Flask(__name__)
CORS(app, resources={r"/*": {"origins": "*"}})

@app.route('/')
def hello():
    response = {
        "message": "Hello from the API",
        "status": "success",
        "data": {
            "description": "This is a sample API response",
            "version": "1.0.0",
            "author": "Kiran, christian, sahil, deep"
        }
    }
    return jsonify(response)

@app.route('/health')
def health():
    return jsonify({"status": "healthy"})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)