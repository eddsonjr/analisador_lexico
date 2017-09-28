/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package analisador_lexico;


import java.io.File;
import java.io.IOException;
import org.apache.commons.io.FileUtils;


public class Arquivo {
    
    private String fileName;
    private String conteudoArquivo;
    

    
    public Arquivo(String fileName){
        this.fileName = fileName;
        
    }
    
    public Arquivo(String fileName, String conteudoArquivo){
        this.fileName = fileName;
        this.conteudoArquivo = conteudoArquivo;
    }
    
    
    
    
    public String lerConteudoArquivo() {
        try{
           this.conteudoArquivo = FileUtils.readFileToString(new File(this.fileName), "UTF-8");
            
        }catch (IOException e) {
            System.err.println("ERRO AO LER OU CARREGAR ARQUIVO!");
            e.printStackTrace();
        } 
        return this.conteudoArquivo;
    }
    
    
    public void salvarArquivo() {
        try {
            File file = new File(this.fileName);
            FileUtils.writeStringToFile(file, this.conteudoArquivo, "UTF-8", true);
        } catch (IOException e) {
            System.err.println("ERRO AO SALVAR ARQUIVO!");
            e.printStackTrace();
        } 
    }
    
    
    
    //Getters and Setters
    public void setConteudoArquivo(String conteudoArquivo){
        this.conteudoArquivo = conteudoArquivo;
    }
    
    public String getConteudoArquivo() {
        return this.conteudoArquivo;
    }
    
    
    
   
    
    
    
}
