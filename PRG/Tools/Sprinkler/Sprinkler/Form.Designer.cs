namespace Sprinkler
{
    partial class Sprinkler
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.textBoxSerialLog = new System.Windows.Forms.TextBox();
            this.buttonConnect = new System.Windows.Forms.Button();
            this.buttonTest = new System.Windows.Forms.Button();
            this.statusStrip = new System.Windows.Forms.StatusStrip();
            this.textBoxKeyInput = new System.Windows.Forms.TextBox();
            this.textBoxScript = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.buttonDumpScript = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // textBoxSerialLog
            // 
            this.textBoxSerialLog.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.textBoxSerialLog.Location = new System.Drawing.Point(12, 81);
            this.textBoxSerialLog.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.textBoxSerialLog.Multiline = true;
            this.textBoxSerialLog.Name = "textBoxSerialLog";
            this.textBoxSerialLog.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.textBoxSerialLog.Size = new System.Drawing.Size(377, 355);
            this.textBoxSerialLog.TabIndex = 0;
            // 
            // buttonConnect
            // 
            this.buttonConnect.Location = new System.Drawing.Point(12, 9);
            this.buttonConnect.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.buttonConnect.Name = "buttonConnect";
            this.buttonConnect.Size = new System.Drawing.Size(90, 30);
            this.buttonConnect.TabIndex = 1;
            this.buttonConnect.Text = "接続";
            this.buttonConnect.UseVisualStyleBackColor = true;
            this.buttonConnect.Click += new System.EventHandler(this.buttonConnect_Click);
            // 
            // buttonTest
            // 
            this.buttonTest.Location = new System.Drawing.Point(114, 9);
            this.buttonTest.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.buttonTest.Name = "buttonTest";
            this.buttonTest.Size = new System.Drawing.Size(90, 30);
            this.buttonTest.TabIndex = 2;
            this.buttonTest.Text = "テスト";
            this.buttonTest.UseVisualStyleBackColor = true;
            this.buttonTest.Click += new System.EventHandler(this.buttonTest_Click);
            // 
            // statusStrip
            // 
            this.statusStrip.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.statusStrip.Location = new System.Drawing.Point(0, 450);
            this.statusStrip.Name = "statusStrip";
            this.statusStrip.Size = new System.Drawing.Size(802, 22);
            this.statusStrip.TabIndex = 3;
            // 
            // textBoxKeyInput
            // 
            this.textBoxKeyInput.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.textBoxKeyInput.Location = new System.Drawing.Point(663, 13);
            this.textBoxKeyInput.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.textBoxKeyInput.Name = "textBoxKeyInput";
            this.textBoxKeyInput.Size = new System.Drawing.Size(125, 22);
            this.textBoxKeyInput.TabIndex = 4;
            this.textBoxKeyInput.KeyDown += new System.Windows.Forms.KeyEventHandler(this.textBoxKeyInput_KeyDown);
            // 
            // textBoxScript
            // 
            this.textBoxScript.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.textBoxScript.Location = new System.Drawing.Point(412, 81);
            this.textBoxScript.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.textBoxScript.Multiline = true;
            this.textBoxScript.Name = "textBoxScript";
            this.textBoxScript.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.textBoxScript.Size = new System.Drawing.Size(377, 355);
            this.textBoxScript.TabIndex = 5;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(13, 55);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(60, 15);
            this.label1.TabIndex = 6;
            this.label1.Text = "送信ログ";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(413, 55);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(89, 15);
            this.label2.TabIndex = 7;
            this.label2.Text = "スクリプト形式";
            // 
            // buttonDumpScript
            // 
            this.buttonDumpScript.Location = new System.Drawing.Point(218, 9);
            this.buttonDumpScript.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.buttonDumpScript.Name = "buttonDumpScript";
            this.buttonDumpScript.Size = new System.Drawing.Size(122, 30);
            this.buttonDumpScript.TabIndex = 8;
            this.buttonDumpScript.Text = "スクリプト出力";
            this.buttonDumpScript.UseVisualStyleBackColor = true;
            this.buttonDumpScript.Click += new System.EventHandler(this.buttonDumpScript_Click);
            // 
            // Sprinkler
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(802, 472);
            this.Controls.Add(this.buttonDumpScript);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.textBoxScript);
            this.Controls.Add(this.textBoxKeyInput);
            this.Controls.Add(this.statusStrip);
            this.Controls.Add(this.buttonTest);
            this.Controls.Add(this.buttonConnect);
            this.Controls.Add(this.textBoxSerialLog);
            this.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.MinimumSize = new System.Drawing.Size(400, 300);
            this.Name = "Sprinkler";
            this.Text = "Sprinkler";
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.Sprinkler_FormClosed);
            this.Load += new System.EventHandler(this.Sprinkler_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox textBoxSerialLog;
        private System.Windows.Forms.Button buttonConnect;
        private System.Windows.Forms.Button buttonTest;
        private System.Windows.Forms.StatusStrip statusStrip;
        private System.Windows.Forms.TextBox textBoxKeyInput;
        private System.Windows.Forms.TextBox textBoxScript;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button buttonDumpScript;
    }
}

