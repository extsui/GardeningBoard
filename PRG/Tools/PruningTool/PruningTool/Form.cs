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

                buttonReset.Enabled = true;
                buttonUpdateAll.Enabled = true;

                buttonUpdate0.Enabled = true;
                buttonUpdate1.Enabled = true;
                buttonUpdate2.Enabled = true;
                buttonUpdate3.Enabled = true;
                buttonUpdate4.Enabled = true;
                buttonUpdate5.Enabled = true;
                buttonUpdate6.Enabled = true;
                buttonUpdate7.Enabled = true;

                numericUpDownBrightnessAll.Enabled = true;
                numericUpDownBrightness0.Enabled = true;
                numericUpDownBrightness1.Enabled = true;
                numericUpDownBrightness2.Enabled = true;
                numericUpDownBrightness3.Enabled = true;
                numericUpDownBrightness4.Enabled = true;
                numericUpDownBrightness5.Enabled = true;
                numericUpDownBrightness6.Enabled = true;
                numericUpDownBrightness7.Enabled = true;

                // TODO: 受信ハンドラの追加
                //m_serialPort.DataReceived += new SerialDataReceivedEventHandler();
            }
            else
            {
                // 接続 --> 切断
                m_serialPort.Close();
                buttonConnect.Text = "接続";
                comboBoxPortSelect.Enabled = true;

                buttonReset.Enabled = false;
                buttonUpdateAll.Enabled = false;

                buttonUpdate0.Enabled = false;
                buttonUpdate1.Enabled = false;
                buttonUpdate2.Enabled = false;
                buttonUpdate3.Enabled = false;
                buttonUpdate4.Enabled = false;
                buttonUpdate5.Enabled = false;
                buttonUpdate6.Enabled = false;
                buttonUpdate7.Enabled = false;

                numericUpDownBrightnessAll.Enabled = false;
                numericUpDownBrightness0.Enabled = false;
                numericUpDownBrightness1.Enabled = false;
                numericUpDownBrightness2.Enabled = false;
                numericUpDownBrightness3.Enabled = false;
                numericUpDownBrightness4.Enabled = false;
                numericUpDownBrightness5.Enabled = false;
                numericUpDownBrightness6.Enabled = false;
                numericUpDownBrightness7.Enabled = false;
            }
        }

        private void WriteSerialLog(string value)
        {
            DateTime now = DateTime.Now;
            textBoxLog.AppendText(string.Format("[{0:yyyy/MM/dd HH:mm:ss.fff}] {1}\r\n", now, value));
            m_serialPort.Write(value);
        }

        private string MakePatternCommand(byte brickId, decimal patternId, decimal timing, bool isRepeat)
        {
            string brickIdStr = brickId.ToString();
            string patternIdStr = patternId.ToString();
            string timingStr = timing.ToString();
            string isRepeatStr = isRepeat ? "1" : "0";
            return $"pattern {brickIdStr} {patternIdStr} {timingStr} {isRepeatStr}\n";
        }

        private string MakeBrightnessCommand(decimal brightness)
        {
            string brightnessStr = brightness.ToString();
            return $"bright {brightnessStr}\n";
        }

        private string MakeBrightnessCommand(byte brickId, decimal brightness)
        {
            string brickIdStr = brickId.ToString();
            string brightnessStr = brightness.ToString();
            return $"bright {brickIdStr} {brightnessStr}\n";
        }

        /// <summary>
        /// 全部品を消灯するコマンドを送信する。
        /// 各種コントロールの値は変更しない。
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void buttonReset_Click(object sender, EventArgs e)
        {
            for (byte i = 0; i < 8; i++)
            {
                // PatternId = 1 は消灯
                WriteSerialLog(MakePatternCommand(i, 1, 100, false));
            }
        }

        /// <summary>
        /// 現在のコントロール値を一括送信する。
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void buttonUpdateAll_Click(object sender, EventArgs e)
        {
            WriteSerialLog(MakePatternCommand(0, numericUpDownPattern0.Value, numericUpDownTiming0.Value, checkBoxRepeat0.Checked));
            WriteSerialLog(MakePatternCommand(1, numericUpDownPattern1.Value, numericUpDownTiming1.Value, checkBoxRepeat1.Checked));
            WriteSerialLog(MakePatternCommand(2, numericUpDownPattern2.Value, numericUpDownTiming2.Value, checkBoxRepeat2.Checked));
            WriteSerialLog(MakePatternCommand(3, numericUpDownPattern3.Value, numericUpDownTiming3.Value, checkBoxRepeat3.Checked));
            WriteSerialLog(MakePatternCommand(4, numericUpDownPattern4.Value, numericUpDownTiming4.Value, checkBoxRepeat4.Checked));
            WriteSerialLog(MakePatternCommand(5, numericUpDownPattern5.Value, numericUpDownTiming5.Value, checkBoxRepeat5.Checked));
            WriteSerialLog(MakePatternCommand(6, numericUpDownPattern6.Value, numericUpDownTiming6.Value, checkBoxRepeat6.Checked));
            WriteSerialLog(MakePatternCommand(7, numericUpDownPattern7.Value, numericUpDownTiming7.Value, checkBoxRepeat7.Checked));
        }

        private void buttonUpdate0_Click(object sender, EventArgs e)
        {
            WriteSerialLog(MakePatternCommand(0, numericUpDownPattern0.Value, numericUpDownTiming0.Value, checkBoxRepeat0.Checked));
        }

        private void buttonUpdate1_Click(object sender, EventArgs e)
        {
            WriteSerialLog(MakePatternCommand(1, numericUpDownPattern1.Value, numericUpDownTiming1.Value, checkBoxRepeat1.Checked));
        }

        private void buttonUpdate2_Click(object sender, EventArgs e)
        {
            WriteSerialLog(MakePatternCommand(2, numericUpDownPattern2.Value, numericUpDownTiming2.Value, checkBoxRepeat2.Checked));
        }

        private void buttonUpdate3_Click(object sender, EventArgs e)
        {
            WriteSerialLog(MakePatternCommand(3, numericUpDownPattern3.Value, numericUpDownTiming3.Value, checkBoxRepeat3.Checked));
        }

        private void buttonUpdate4_Click(object sender, EventArgs e)
        {
            WriteSerialLog(MakePatternCommand(4, numericUpDownPattern4.Value, numericUpDownTiming4.Value, checkBoxRepeat4.Checked));
        }

        private void buttonUpdate5_Click(object sender, EventArgs e)
        {
            WriteSerialLog(MakePatternCommand(5, numericUpDownPattern5.Value, numericUpDownTiming5.Value, checkBoxRepeat5.Checked));
        }

        private void buttonUpdate6_Click(object sender, EventArgs e)
        {
            WriteSerialLog(MakePatternCommand(6, numericUpDownPattern6.Value, numericUpDownTiming6.Value, checkBoxRepeat6.Checked));
        }

        private void buttonUpdate7_Click(object sender, EventArgs e)
        {
            WriteSerialLog(MakePatternCommand(7, numericUpDownPattern7.Value, numericUpDownTiming7.Value, checkBoxRepeat7.Checked));
        }

        private void buttonLogClear_Click(object sender, EventArgs e)
        {
            textBoxLog.Text = "";
        }

        private void numericUpDownBrightnessAll_ValueChanged(object sender, EventArgs e)
        {
            var command = MakeBrightnessCommand(numericUpDownBrightnessAll.Value);
            WriteSerialLog(command);

            // TODO: 個別輝度の ValueChanged イベントが呼び出されるのを回避したい

            // 個別輝度の値も変更
            //decimal brightnessAll = numericUpDownBrightnessAll.Value;
            //numericUpDownBrightness0.Value = brightnessAll;
            //numericUpDownBrightness1.Value = brightnessAll;
            //numericUpDownBrightness2.Value = brightnessAll;
            //numericUpDownBrightness3.Value = brightnessAll;
            //numericUpDownBrightness4.Value = brightnessAll;
            //numericUpDownBrightness5.Value = brightnessAll;
            //numericUpDownBrightness6.Value = brightnessAll;
            //numericUpDownBrightness7.Value = brightnessAll;
        }

        private void numericUpDownBrightness0_ValueChanged(object sender, EventArgs e)
        {
            var command = MakeBrightnessCommand(0, numericUpDownBrightness0.Value);
            WriteSerialLog(command);
        }

        private void numericUpDownBrightness1_ValueChanged(object sender, EventArgs e)
        {
            var command = MakeBrightnessCommand(1, numericUpDownBrightness1.Value);
            WriteSerialLog(command);
        }

        private void numericUpDownBrightness2_ValueChanged(object sender, EventArgs e)
        {
            var command = MakeBrightnessCommand(2, numericUpDownBrightness2.Value);
            WriteSerialLog(command);
        }

        private void numericUpDownBrightness3_ValueChanged(object sender, EventArgs e)
        {
            var command = MakeBrightnessCommand(3, numericUpDownBrightness3.Value);
            WriteSerialLog(command);
        }

        private void numericUpDownBrightness4_ValueChanged(object sender, EventArgs e)
        {
            var command = MakeBrightnessCommand(4, numericUpDownBrightness4.Value);
            WriteSerialLog(command);
        }

        private void numericUpDownBrightness5_ValueChanged(object sender, EventArgs e)
        {
            var command = MakeBrightnessCommand(5, numericUpDownBrightness5.Value);
            WriteSerialLog(command);
        }

        private void numericUpDownBrightness6_ValueChanged(object sender, EventArgs e)
        {
            var command = MakeBrightnessCommand(6, numericUpDownBrightness6.Value);
            WriteSerialLog(command);
        }

        private void numericUpDownBrightness7_ValueChanged(object sender, EventArgs e)
        {
            var command = MakeBrightnessCommand(7, numericUpDownBrightness7.Value);
            WriteSerialLog(command);
        }
    }
}
