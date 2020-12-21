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
            this.SuspendLayout();
            // 
            // textBoxSerialLog
            // 
            this.textBoxSerialLog.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.textBoxSerialLog.Location = new System.Drawing.Point(12, 47);
            this.textBoxSerialLog.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.textBoxSerialLog.Multiline = true;
            this.textBoxSerialLog.Name = "textBoxSerialLog";
            this.textBoxSerialLog.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.textBoxSerialLog.Size = new System.Drawing.Size(776, 389);
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
            // Sprinkler
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(802, 472);
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
    }
}

