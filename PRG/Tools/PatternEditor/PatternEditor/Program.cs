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

            //BrickPatternWriter.SaveByDebugFormat(grass);
            BrickPatternWriter.SaveByCppFormat(grass);

            /*
            BrickPattern grass = BrickPatternReader.LoadYamlFile(@"../../../Resources/Grass.yml");
            BrickPatternWriter.SaveByCSharpFormat(grass, "Grass");

            BrickPattern tree = BrickPatternReader.LoadYamlFile(@"../../../Resources/Tree.yml");
            BrickPatternWriter.SaveByCSharpFormat(tree, "Tree");

            BrickPattern house = BrickPatternReader.LoadYamlFile(@"../../../Resources/House.yml");
            BrickPatternWriter.SaveByCSharpFormat(house, "House");

            BrickPattern tile = BrickPatternReader.LoadYamlFile(@"../../../Resources/Tile.yml");
            BrickPatternWriter.SaveByCSharpFormat(house, "Tile");
            */
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

        /// <summary>
        /// C++ 形式で保存する
        /// </summary>
        /// <param name="brickPattern"></param>
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

        /// <summary>
        /// C# 形式で保存する
        /// </summary>
        /// <param name="brickPattern"></param>
        public static void SaveByCSharpFormat(BrickPattern brickPattern, string brickName)
        {
            // TODO: id は class Pattern に含めるべき
            int id = 0;
            int indent = 0;

            Console.WriteLine($"namespace PatternEditor");
            Console.WriteLine($"{{");

            indent += 4;
            {
                Console.WriteLine($"{new String(' ', indent)}public enum class {brickName}");
                Console.WriteLine($"{new String(' ', indent)}{{");

                indent += 4;
                foreach (var pattern in brickPattern.Patterns)
                {
                    Console.WriteLine($"{new String(' ', indent)}{pattern.Name} = {id},");
                    id++;
                }
                indent -= 4;

                Console.WriteLine($"{new String(' ', indent)}}}");
            }
            indent -= 4;

            Console.WriteLine($"}}");
        }
    }

    //public struct YamlPattern
    //{
    //    public string Name { get; set; }
    //    public List<string> Data { get; set; }
    //}

    public class BrickPattern
    {
        public struct Pattern
        {
            //public int Id { get; set; } 
            public string Name { get; set; }
            public List<string> Data { get; set; }

            public Pattern(string name, List<string> data)
            {
                Name = name;
                Data = data;
            }

            public int GetEstimatedTime(int stepTime)
            {
                return stepTime * Data.Count;
            }
        }

        public List<Pattern> Patterns { get; set; }

        public BrickPattern(List<Pattern> patterns)
        {
            Patterns = patterns;
        }
    }
}
