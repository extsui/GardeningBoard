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
            Garden garden = new Garden();

            var registerCommands = garden.MakeRegisterCommand();
            var operationCommands = garden.MakeOperationCommand(Position.Hexagon_Up, OperationTarget.InsertedOnly, 0, 0, false);
            var operationBothCommands = garden.MakeOperationCommand(Position.Hexagon_Up, OperationTarget.Both, 0, 0, false);

            registerCommands.ForEach(command => Console.Write(command));
            operationCommands.ForEach(command => Console.Write(command));
            operationBothCommands.ForEach(command => Console.Write(command));

            Console.ReadLine();
        }
    }
}
