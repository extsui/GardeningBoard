using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.IO.Ports;
using System.Windows.Forms;
using System.Xml.Linq;

namespace PruningTool
{
    public partial class Form : System.Windows.Forms.Form
    {
        public const int BrickCountMax = 8;

        /// <summary>
        /// 設定の保存/読み込み時に使用する。
        /// </summary>
        private List<Brick> m_brickList;

        /// <summary>
        /// 輝度一括制御コマンドや読み込み時の輝度変更時に
        /// シリアル送信されないようにするためのガード。
        /// </summary>
        private bool m_isEnabledBrightnessEvent = false;

        public Form()
        {
            InitializeComponent();

            m_brickList = new List<Brick>();
            for (int i = 0; i < BrickCountMax; i++)
            {
                m_brickList.Add(new Brick((byte)i, 0, 100, false, 1));
            }
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
            m_isEnabledBrightnessEvent = true;
        }

        ////////////////////////////////////////////////////////////
        //  シリアルポートコントロール
        ////////////////////////////////////////////////////////////

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

        ////////////////////////////////////////////////////////////
        //  ボタンコントロール
        ////////////////////////////////////////////////////////////

        /// <summary>
        /// 全部品を消灯するコマンドを送信する。
        /// 各種コントロールの値は変更しない。
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void buttonReset_Click(object sender, EventArgs e)
        {
            for (byte i = 0; i < BrickCountMax; i++)
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

            WriteSerialLog(MakeBrightnessCommand(0, numericUpDownBrightness0.Value));
            WriteSerialLog(MakeBrightnessCommand(1, numericUpDownBrightness1.Value));
            WriteSerialLog(MakeBrightnessCommand(2, numericUpDownBrightness2.Value));
            WriteSerialLog(MakeBrightnessCommand(3, numericUpDownBrightness3.Value));
            WriteSerialLog(MakeBrightnessCommand(4, numericUpDownBrightness4.Value));
            WriteSerialLog(MakeBrightnessCommand(5, numericUpDownBrightness5.Value));
            WriteSerialLog(MakeBrightnessCommand(6, numericUpDownBrightness6.Value));
            WriteSerialLog(MakeBrightnessCommand(7, numericUpDownBrightness7.Value));
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

        ////////////////////////////////////////////////////////////
        //  輝度コントロール
        ////////////////////////////////////////////////////////////

        private void numericUpDownBrightnessAll_ValueChanged(object sender, EventArgs e)
        {
            var command = MakeBrightnessCommand(numericUpDownBrightnessAll.Value);
            WriteSerialLog(command);

            // 個別輝度の ValueChanged イベントが呼び出されるのを一時的に回避
            m_isEnabledBrightnessEvent = false;

            // 個別輝度の値も変更
            decimal brightnessAll = numericUpDownBrightnessAll.Value;
            numericUpDownBrightness0.Value = brightnessAll;
            numericUpDownBrightness1.Value = brightnessAll;
            numericUpDownBrightness2.Value = brightnessAll;
            numericUpDownBrightness3.Value = brightnessAll;
            numericUpDownBrightness4.Value = brightnessAll;
            numericUpDownBrightness5.Value = brightnessAll;
            numericUpDownBrightness6.Value = brightnessAll;
            numericUpDownBrightness7.Value = brightnessAll;

            m_isEnabledBrightnessEvent = true;
        }

        private void numericUpDownBrightness0_ValueChanged(object sender, EventArgs e)
        {
            if (m_isEnabledBrightnessEvent)
            {
                var command = MakeBrightnessCommand(0, numericUpDownBrightness0.Value);
                WriteSerialLog(command);
            }
        }

        private void numericUpDownBrightness1_ValueChanged(object sender, EventArgs e)
        {
            if (m_isEnabledBrightnessEvent)
            {
                var command = MakeBrightnessCommand(1, numericUpDownBrightness1.Value);
                WriteSerialLog(command);
            }
        }

        private void numericUpDownBrightness2_ValueChanged(object sender, EventArgs e)
        {
            if (m_isEnabledBrightnessEvent)
            {
                var command = MakeBrightnessCommand(2, numericUpDownBrightness2.Value);
                WriteSerialLog(command);
            }
        }

        private void numericUpDownBrightness3_ValueChanged(object sender, EventArgs e)
        {
            if (m_isEnabledBrightnessEvent)
            {
                var command = MakeBrightnessCommand(3, numericUpDownBrightness3.Value);
                WriteSerialLog(command);
            }
        }

        private void numericUpDownBrightness4_ValueChanged(object sender, EventArgs e)
        {
            if (m_isEnabledBrightnessEvent)
            {
                var command = MakeBrightnessCommand(4, numericUpDownBrightness4.Value);
                WriteSerialLog(command);
            }
        }

        private void numericUpDownBrightness5_ValueChanged(object sender, EventArgs e)
        {
            if (m_isEnabledBrightnessEvent)
            {
                var command = MakeBrightnessCommand(5, numericUpDownBrightness5.Value);
                WriteSerialLog(command);
            }
        }

        private void numericUpDownBrightness6_ValueChanged(object sender, EventArgs e)
        {
            if (m_isEnabledBrightnessEvent)
            {
                var command = MakeBrightnessCommand(6, numericUpDownBrightness6.Value);
                WriteSerialLog(command);
            }
        }

        private void numericUpDownBrightness7_ValueChanged(object sender, EventArgs e)
        {
            if (m_isEnabledBrightnessEvent)
            {
                var command = MakeBrightnessCommand(7, numericUpDownBrightness7.Value);
                WriteSerialLog(command);
            }
        }

        ////////////////////////////////////////////////////////////
        //  メニュー
        ////////////////////////////////////////////////////////////

        private void ToolStripMenuItemFileSave_Click(object sender, EventArgs e)
        {
            m_saveFileDialog.Filter = "xml files (*.xml)|*.xml|All files (*.*)|*.*";
            m_saveFileDialog.FilterIndex = 0;
            m_saveFileDialog.InitialDirectory = Directory.GetCurrentDirectory();
            m_saveFileDialog.RestoreDirectory = true;

            if (m_saveFileDialog.ShowDialog() != DialogResult.OK)
            {
                return;
            }

            m_brickList[0].Update((int)numericUpDownPattern0.Value, (byte)numericUpDownTiming0.Value, checkBoxRepeat0.Checked, (byte)numericUpDownBrightness0.Value);
            m_brickList[1].Update((int)numericUpDownPattern1.Value, (byte)numericUpDownTiming1.Value, checkBoxRepeat1.Checked, (byte)numericUpDownBrightness1.Value);
            m_brickList[2].Update((int)numericUpDownPattern2.Value, (byte)numericUpDownTiming2.Value, checkBoxRepeat2.Checked, (byte)numericUpDownBrightness2.Value);
            m_brickList[3].Update((int)numericUpDownPattern3.Value, (byte)numericUpDownTiming3.Value, checkBoxRepeat3.Checked, (byte)numericUpDownBrightness3.Value);
            m_brickList[4].Update((int)numericUpDownPattern4.Value, (byte)numericUpDownTiming4.Value, checkBoxRepeat4.Checked, (byte)numericUpDownBrightness4.Value);
            m_brickList[5].Update((int)numericUpDownPattern5.Value, (byte)numericUpDownTiming5.Value, checkBoxRepeat5.Checked, (byte)numericUpDownBrightness5.Value);
            m_brickList[6].Update((int)numericUpDownPattern6.Value, (byte)numericUpDownTiming6.Value, checkBoxRepeat6.Checked, (byte)numericUpDownBrightness6.Value);
            m_brickList[7].Update((int)numericUpDownPattern7.Value, (byte)numericUpDownTiming7.Value, checkBoxRepeat7.Checked, (byte)numericUpDownBrightness7.Value);

            using (FileStream fileStream = new FileStream(m_saveFileDialog.FileName, FileMode.Create))
            {
                XElement root = new XElement("PruningTool");

                foreach (var brick in m_brickList)
                {
                    root.Add(
                        new XElement("Brick",
                            new XElement("BrickId", brick.BrickId),
                            new XElement("PatternId", brick.PatternId),
                            new XElement("Timing", brick.Timing),
                            new XElement("IsRepeat", brick.IsRepeat),
                            new XElement("Brightness", brick.Brightness)
                        )
                    );
                }
                root.Save(fileStream);
                fileStream.Close();
            }
        }

        private void ToolStripMenuItemFileLoad_Click(object sender, EventArgs e)
        {
            using (OpenFileDialog openFileDialog = new OpenFileDialog())
            {
                openFileDialog.Filter = "xml files (*.xml)|*.xml|All files (*.*)|*.*";
                openFileDialog.FilterIndex = 1;
                openFileDialog.InitialDirectory = Directory.GetCurrentDirectory();
                openFileDialog.RestoreDirectory = true;

                if (openFileDialog.ShowDialog() != DialogResult.OK)
                {
                    return;
                }

                string filePath = openFileDialog.FileName;
                XDocument xml = XDocument.Load(filePath);
                var root = xml.Element("PruningTool");

                int index = 0;
                foreach (var item in root.Elements("Brick"))
                {
                    m_brickList[index].BrickId = byte.Parse(item.Element("BrickId").Value);
                    m_brickList[index].PatternId = int.Parse(item.Element("PatternId").Value);
                    m_brickList[index].Timing = byte.Parse(item.Element("Timing").Value);
                    m_brickList[index].IsRepeat = bool.Parse(item.Element("IsRepeat").Value);
                    m_brickList[index].Brightness = byte.Parse(item.Element("Brightness").Value);

                    Trace.Assert(index < BrickCountMax);
                    index++;
                }

                numericUpDownPattern0.Value = m_brickList[0].PatternId;
                numericUpDownPattern1.Value = m_brickList[1].PatternId;
                numericUpDownPattern2.Value = m_brickList[2].PatternId;
                numericUpDownPattern3.Value = m_brickList[3].PatternId;
                numericUpDownPattern4.Value = m_brickList[4].PatternId;
                numericUpDownPattern5.Value = m_brickList[5].PatternId;
                numericUpDownPattern6.Value = m_brickList[6].PatternId;
                numericUpDownPattern7.Value = m_brickList[7].PatternId;

                numericUpDownTiming0.Value = m_brickList[0].Timing;
                numericUpDownTiming1.Value = m_brickList[1].Timing;
                numericUpDownTiming2.Value = m_brickList[2].Timing;
                numericUpDownTiming3.Value = m_brickList[3].Timing;
                numericUpDownTiming4.Value = m_brickList[4].Timing;
                numericUpDownTiming5.Value = m_brickList[5].Timing;
                numericUpDownTiming6.Value = m_brickList[6].Timing;
                numericUpDownTiming7.Value = m_brickList[7].Timing;

                checkBoxRepeat0.Checked = m_brickList[0].IsRepeat;
                checkBoxRepeat1.Checked = m_brickList[1].IsRepeat;
                checkBoxRepeat2.Checked = m_brickList[2].IsRepeat;
                checkBoxRepeat3.Checked = m_brickList[3].IsRepeat;
                checkBoxRepeat4.Checked = m_brickList[4].IsRepeat;
                checkBoxRepeat5.Checked = m_brickList[5].IsRepeat;
                checkBoxRepeat6.Checked = m_brickList[6].IsRepeat;
                checkBoxRepeat7.Checked = m_brickList[7].IsRepeat;

                // シリアル接続前の可能性があるため輝度変更の通信をさせない
                m_isEnabledBrightnessEvent = false;
                numericUpDownBrightness0.Value = m_brickList[0].Brightness;
                numericUpDownBrightness1.Value = m_brickList[1].Brightness;
                numericUpDownBrightness2.Value = m_brickList[2].Brightness;
                numericUpDownBrightness3.Value = m_brickList[3].Brightness;
                numericUpDownBrightness4.Value = m_brickList[4].Brightness;
                numericUpDownBrightness5.Value = m_brickList[5].Brightness;
                numericUpDownBrightness6.Value = m_brickList[6].Brightness;
                numericUpDownBrightness7.Value = m_brickList[7].Brightness;
                m_isEnabledBrightnessEvent = true;
            }
        }

        private void ToolStripMenuItemFinish_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }

    public class Brick
    {
        public byte BrickId;
        public int PatternId;
        public byte Timing;
        public bool IsRepeat;
        public byte Brightness;

        public Brick(byte brickId, int patternId, byte timing, bool isRepeat, byte brightness)
        {
            BrickId = brickId;
            PatternId = patternId;
            Timing = timing;
            IsRepeat = isRepeat;
            Brightness = brightness;
        }

        public void Update(int patternId, byte timing, bool isRepeat, byte brightness)
        {
            PatternId = patternId;
            Timing = timing;
            IsRepeat = isRepeat;
            Brightness = brightness;
        }
    };
}
