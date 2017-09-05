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
        
        
        //String rootPath = Paths.get("").toAbsolutePath(). toString();
        //String subPath = "/src/analisador_lexico/";
        String rootPath = "./src/analisador_lexico/";
        String file = rootPath + "language.lex";
        System.out.println(file);

        File sourceCode = new File(file);

        jflex.Main.generate(sourceCode);
        
        
        
         String expr = "if 2 + 3+a then";
         
        LexicalAnalyzer lexical = new LexicalAnalyzer(new StringReader(expr));
        lexical.yylex();
        
    }
    
}
