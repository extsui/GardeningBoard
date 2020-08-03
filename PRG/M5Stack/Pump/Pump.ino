#include <M5Stack.h>

void setup()
{
  M5.Lcd.begin();
  M5.Lcd.fillScreen( BLACK );
  M5.Lcd.setCursor(0, 0);
  M5.Lcd.setTextColor(YELLOW);  
  M5.Lcd.setTextSize(2);

  M5.Lcd.fillScreen( BLACK );
  M5.Lcd.setCursor(0, 0);
  M5.Lcd.println("Pump Start!");

  // UART
  Serial.begin(115200);

  // I2C
  Wire.begin();

  delay(3000);
  M5.Lcd.fillScreen( BLACK );
}

constexpr int ReceiveBufferSize = 256;

static byte g_receiveBuffer[ReceiveBufferSize];
static int g_receiveBufferIndex = 0;

void loop()
{
  if (Serial.available()) {
    byte data = Serial.read();
		g_receiveBuffer[g_receiveBufferIndex] = data;
		g_receiveBufferIndex++;

		if (data == '\n') {
			// コマンド確定
			g_receiveBuffer[g_receiveBufferIndex - 1] = '\0';
		  ExecuteCommand(g_receiveBuffer);
      memset(g_receiveBuffer, 0, sizeof(g_receiveBuffer));
		  g_receiveBufferIndex = 0;
		}
	}

  // TODO: 受信回数、エラー回数の結果更新
  // ...
}

void ExecuteCommand(const byte *command)
{
  // TODO: コマンド解析

  Serial.printf("[%s]\n", command);
}