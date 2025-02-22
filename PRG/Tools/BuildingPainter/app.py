from flask import Flask, render_template
from flask_socketio import SocketIO
import serial
import sys
import threading

app = Flask(__name__, template_folder="templates", static_folder="static")
socketio = SocketIO(app, cors_allowed_origins='*')  # IP アドレスを絞りたい場合はここで指定

ser = serial.Serial('COM3', 115200)

def serial_listener():
    while True:
        try:
            # シリアルポートからデータを受信
            data = ser.readline().decode('utf-8').strip()
            # 受信したデータを Flask サーバーのログに出力
            print(f'{data}')
        except Exception as e:
            print(f'[serial] Serial Error: {e}')
            ser.close()
            sys.exit()

# シリアルリスナーをスレッドで実行
serial_thread = threading.Thread(target=serial_listener)
serial_thread.daemon = True
serial_thread.start()

@app.route('/')
def index():
    return render_template('index.html')

@socketio.on('7segUpdated')
def handle_message(message):
    # クライアントからのメッセージ受信
    print('Received message:', message)
    ser.write(('@' + message + '\n').encode())

if __name__ == '__main__':
    # シリアルポートへのアクセスを可能にするために use_reloader=False を指定
    socketio.run(app, host="0.0.0.0", port=5000, debug=True, use_reloader=False)
