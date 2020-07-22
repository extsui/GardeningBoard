using System;
using System.IO.Ports;

namespace PruningTool
{
    public partial class Form : System.Windows.Forms.Form
    {
        public Form()
        {
            InitializeComponent();
        }

        /*
         * TODO: 
         * - 輝度の送信タイミングの実装
         *   - 前回から変更してある場合のみ送信 ?
         */ 

        private void Form_Load(object sender, EventArgs e)
        {
            string[] ports = SerialPort.GetPortNames();
            foreach (var port in ports)
            {
                comboBoxPortSelect.Items.Add(port);
            }
            if (comboBoxPortSelect.Items.Count > 0)
            {
                comboBoxPortSelect.SelectedIndex = 0;
            }
        }

        private void buttonConnect_Click(object sender, EventArgs e)
        {
            if (!m_serialPort.IsOpen)
            {
                // 切断 --> 接続
                m_serialPort.PortName = comboBoxPortSelect.Text;
                m_serialPort.Open();
                buttonConnect.Text = "切断";
                comboBoxPortSelect.Enabled = false;

                buttonBrightness0.Enabled = true;
                buttonBrightness1.Enabled = true;
                buttonBrightness2.Enabled = true;
                buttonBrightness3.Enabled = true;
                buttonBrightness4.Enabled = true;
                buttonBrightness5.Enabled = true;
                buttonBrightness6.Enabled = true;
                buttonBrightness7.Enabled = true;
                buttonBrightnessAll.Enabled = true;

                // TODO: 受信ハンドラの追加
                //m_serialPort.DataReceived += new SerialDataReceivedEventHandler();
            }
            else
            {
                // 接続 --> 切断
                m_serialPort.Close();
                buttonConnect.Text = "接続";
                comboBoxPortSelect.Enabled = true;

                buttonBrightness0.Enabled = false;
                buttonBrightness1.Enabled = false;
                buttonBrightness2.Enabled = false;
                buttonBrightness3.Enabled = false;
                buttonBrightness4.Enabled = false;
                buttonBrightness5.Enabled = false;
                buttonBrightness6.Enabled = false;
                buttonBrightness7.Enabled = false;
                buttonBrightnessAll.Enabled = false;
            }
        }

        private void WriteSerialLog(string value)
        {
            DateTime now = DateTime.Now;
            textBoxLog.AppendText(string.Format("[ {0:yyyy/MM/dd HH:mm:ss.fff} TX ] {1}\r\n", now, value));
            m_serialPort.Write(value);
        }

        private void buttonBrightness0_Click(object sender, EventArgs e)
        {
            string brickId = "0";   // 固定
            string patternId = "2"; // 自由
            string timing = numericUpDownTiming0.Value.ToString();
            string isRepeat = checkBoxRepeat0.Checked ? "1" : "0";
            WriteSerialLog($"pattern {brickId} {patternId} {timing} {isRepeat}\n");

            string brightness = numericUpDownBrightness0.Value.ToString();
            WriteSerialLog($"bright {brickId} {brightness}\n");
        }

        private void buttonBrightness1_Click(object sender, EventArgs e)
        {
            WriteSerialLog("1");
        }

        private void buttonBrightness2_Click(object sender, EventArgs e)
        {
            WriteSerialLog("2");
        }

        private void buttonBrightness3_Click(object sender, EventArgs e)
        {
            WriteSerialLog("3");
        }

        private void buttonBrightness4_Click(object sender, EventArgs e)
        {
            WriteSerialLog("4");
        }

        private void buttonBrightness5_Click(object sender, EventArgs e)
        {
            WriteSerialLog("5");
        }

        private void buttonBrightness6_Click(object sender, EventArgs e)
        {
            WriteSerialLog("6");
        }

        private void buttonBrightness7_Click(object sender, EventArgs e)
        {
            WriteSerialLog("7");
        }

        private void buttonBrightnessAll_Click(object sender, EventArgs e)
        {
            WriteSerialLog("All");
        }

        private void buttonLogClear_Click(object sender, EventArgs e)
        {
            textBoxLog.Text = "";
        }
    }
}
