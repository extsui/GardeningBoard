using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO.Ports;

namespace Sprinkler
{
    public partial class Sprinkler : Form
    {
        public Sprinkler()
        {
            InitializeComponent();

            var ports = SerialPort.GetPortNames();
        }
    }
}
