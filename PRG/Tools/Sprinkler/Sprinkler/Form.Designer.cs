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
            this.SuspendLayout();
            // 
            // textBoxSerialLog
            // 
            this.textBoxSerialLog.Location = new System.Drawing.Point(12, 51);
            this.textBoxSerialLog.Multiline = true;
            this.textBoxSerialLog.Name = "textBoxSerialLog";
            this.textBoxSerialLog.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.textBoxSerialLog.Size = new System.Drawing.Size(776, 387);
            this.textBoxSerialLog.TabIndex = 0;
            // 
            // buttonConnect
            // 
            this.buttonConnect.Location = new System.Drawing.Point(12, 12);
            this.buttonConnect.Name = "buttonConnect";
            this.buttonConnect.Size = new System.Drawing.Size(94, 29);
            this.buttonConnect.TabIndex = 1;
            this.buttonConnect.Text = "接続";
            this.buttonConnect.UseVisualStyleBackColor = true;
            this.buttonConnect.Click += new System.EventHandler(this.buttonConnect_Click);
            // 
            // buttonTest
            // 
            this.buttonTest.Location = new System.Drawing.Point(112, 12);
            this.buttonTest.Name = "buttonTest";
            this.buttonTest.Size = new System.Drawing.Size(94, 29);
            this.buttonTest.TabIndex = 2;
            this.buttonTest.Text = "テスト";
            this.buttonTest.UseVisualStyleBackColor = true;
            this.buttonTest.Click += new System.EventHandler(this.buttonTest_Click);
            // 
            // Sprinkler
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.buttonTest);
            this.Controls.Add(this.buttonConnect);
            this.Controls.Add(this.textBoxSerialLog);
            this.Name = "Sprinkler";
            this.Text = "Sprinkler";
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.Sprinkler_FormClosed);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox textBoxSerialLog;
        private System.Windows.Forms.Button buttonConnect;
        private System.Windows.Forms.Button buttonTest;
    }
}

