import java.io.*;

public class Main {
    public static void main(String[] args) {
        try {
            // Leitura do arquivo de entrada
            Reader reader = new BufferedReader(new FileReader("input.txt"));
            
            // Inicializando o analisador léxico
            Lexer lexer = new Lexer(reader);
            
            // Inicializando o analisador sintático
            parser parser = new parser(lexer);
            
            // Executando o parser
            parser.parse();

            System.out.println("Análise completa!");

        } catch (Exception e) {
            System.err.println("Erro ao executar o analisador: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
