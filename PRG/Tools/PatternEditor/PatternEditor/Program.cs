using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

using YamlDotNet.RepresentationModel;
using YamlDotNet.Serialization;
using YamlDotNet.Serialization.NamingConventions;

namespace PatternEditor
{
    class Program
    {
        static void Main(string[] args)
        {
            BrickPattern grass = BrickPatternReader.LoadYamlFile(@"../../../Resources/Grass.yml");

            BrickPatternWriter.SaveByDebugFormat(grass);
            //BrickPatternWriter.SaveByCppFormat(grass);
        }
    }

    public class BrickPatternReader
    {
        // Yaml ファイルを指定する場合
        public static BrickPattern LoadYamlFile(string path)
        {
            StreamReader reader = new StreamReader(path, Encoding.UTF8);
            var yaml = new YamlStream();
            yaml.Load(reader);
            return LoadYamlCore(yaml);
        }

        // Yaml 文字列そのものを指定する場合
        public static BrickPattern LoadYamlString(string body)
        {
            MemoryStream stream = new MemoryStream(Encoding.UTF8.GetBytes(body));
            TextReader reader = new StreamReader(stream);
            var yaml = new YamlStream();
            yaml.Load(reader);
            return LoadYamlCore(yaml);
        }

        private static BrickPattern LoadYamlCore(YamlStream yaml)
        {
            var patterns = new List<BrickPattern.Pattern>();
            var root = (YamlSequenceNode)yaml.Documents[0].RootNode;
            foreach (YamlMappingNode pattern in root.Children)
            {
                var Name = (string)pattern.Children[new YamlScalarNode("Name")];
                var Data = (YamlSequenceNode)pattern.Children[new YamlScalarNode("Data")];

                var steps = new List<string>();
                foreach (YamlScalarNode step in Data.Children)
                {
                    steps.Add(step.Value);
                }
                patterns.Add(new BrickPattern.Pattern(Name, steps));
            }
            return new BrickPattern(patterns);
        }
    }

    public class BrickPatternWriter
    {
        public static void SaveByDebugFormat(BrickPattern brickPattern)
        {
            foreach (var pattern in brickPattern.Patterns)
            {
                Console.WriteLine($"Name: {pattern.Name}");
                Console.WriteLine($"Data:");
                foreach (var step in pattern.Data)
                {
                    Console.WriteLine($"  {step}");
                }
                Console.WriteLine("");
            }
        }

        public static void SaveByCppFormat(BrickPattern brickPattern)
        {
            int LedCount = brickPattern.Patterns[0].Data[0].Length;

            foreach (var pattern in brickPattern.Patterns)
            {
                Console.WriteLine($"const uint8_t {pattern.Name}[][{LedCount}] = {{");
                foreach (var step in pattern.Data)
                {
                    Console.Write("    { ");
                    foreach (char bit in step)
                    {
                        Console.Write($"{bit}, ");
                    }
                    Console.WriteLine("},");
                }
                Console.WriteLine("};");
                Console.WriteLine("");
            }
        }
    }

    public class BrickPattern
    {
        public struct Pattern
        {
            public string Name { get; set; }
            public List<string> Data { get; set; }

            public Pattern(string name, List<string> data)
            {
                Name = name;
                Data = data;
            }
        }

        public List<Pattern> Patterns { get; set; }

        public BrickPattern(List<Pattern> patterns)
        {
            Patterns = patterns;
        }
    }
}
