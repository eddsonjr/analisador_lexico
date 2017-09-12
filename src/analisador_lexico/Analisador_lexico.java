/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



/*Para maiores informacoes: https://johnidm.gitbooks.io/compiladores-para-humanos/content/part2/building-the-first-lexical-analyzer-with-JFlex.html*/
package analisador_lexico;


import java.io.File;
import java.nio.file.Paths;
import java.io.IOException;
import java.io.StringReader;




/**
 *
 * @author edsonjr
 */
public class Analisador_lexico {

    public static void main(String[] args) throws IOException {
        
        String rootPath = "./src/analisador_lexico/";
        String file = rootPath + "language.lex";
        System.out.println(file);

        File sourceCode = new File(file);

        jflex.Main.generate(sourceCode);
        
        //Criando um objeto do tipo arquivo para ler de arquivos txt 
        Arquivo arquivo = new Arquivo("./program_media.txt");
       
        
        
        String expr = arquivo.lerConteudoArquivo();
        
         
        LexicalAnalyzer lexical = new LexicalAnalyzer(new StringReader(expr));
        lexical.yylex();
        
    }
    
}
