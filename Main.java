import java.io.*;

public class Main {
    public static void main(String[] args) {
        try {
            // Abre um arquivo de entrada contendo código-fonte
            FileReader fr = new FileReader("input.txt");
            scanner scan = new scanner(fr);
            parser p = new parser(scan);

            // Inicia a análise sintática
            p.parse();
            System.out.println("Análise concluída com sucesso!");
        } catch (Exception e) {
            System.err.println("Erro durante a execução: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
