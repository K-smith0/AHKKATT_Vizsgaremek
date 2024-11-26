using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace datatextToSQL
{
    class Program
    {
        static void Main(string[] args)
        {
            if(args.Length < 2)
            {
                Console.WriteLine("please give me the table to insert into, AND the file to convert");
                return;
            }
            string tableName = args[0];
            string path = args[1];
            string destination = path.Substring(0, path.Length - 4) + ".sql";
            if (args.Length >= 3) destination = args[2] + ".sql";
            Console.WriteLine($"{Math.Min(args.Length,3)} args read, (the rest ignored)");
            string accumulatorStr = "";
            try
            {
                accumulatorStr = $"INSERT INTO {tableName}(`{System.IO.File.ReadAllLines("./"+path).First().Replace(";","`,`")}`)\nVALUES\n";
                Console.WriteLine("read column names");
                accumulatorStr += System.IO.File.ReadAllLines("./"+path).Skip(1).Select((line) => $"('{line.Replace(";","','")}'),\n").Aggregate((text,x)=>text+=x);
                Console.WriteLine("read contents\n-----------------------------------");
                accumulatorStr = accumulatorStr.Remove(accumulatorStr.Length - 2,2) + ";";
                Console.WriteLine(accumulatorStr);
            }
            catch
            {
                Console.WriteLine("something went wrong reading the input :(");
                return;
            }
            try
            {
                System.IO.File.WriteAllText(destination, accumulatorStr);
            }
            catch
            {
                Console.WriteLine("something went wrong writing the file.");
                return;
            }
            Console.WriteLine($"-----------------------------------\nfind your file here:\n{destination}");
        }
    }
}
