from flask import Flask, render_template
from flask_socketio import SocketIO

app = Flask(__name__, template_folder="templates", static_folder="static")
socketio = SocketIO(app)

@app.route('/')
def index():
    return render_template('index.html')

@socketio.on('7segUpdated')
def handle_message(message):
    # クライアントからのメッセージ受信
    print('Received message:', message)

if __name__ == '__main__':
    socketio.run(app, debug=True)
