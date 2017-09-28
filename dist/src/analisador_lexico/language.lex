
package analisador_lexico;

%%

%{

private void imprimir(String descricao, String lexema) {
    System.out.println(lexema + " : " + descricao);
    
    //criando uma string que ira receber tanto a descricao quanto o lexema
    //para depois colocar 
    StringBuilder textLine = new StringBuilder();
    textLine.append(lexema);
    textLine.append(" : ");
    textLine.append(descricao);
    textLine.append("\n");

    Arquivo arquivo = new Arquivo("./output.txt");
    arquivo.setConteudoArquivo(textLine.toString());

    arquivo.salvarArquivo();
    

}


   private void PrintError() {
        StringBuilder textLine = new StringBuilder();
        String mainError = "ERROR: LEXEMA NAO FAZ PARTE DA LINGUAGEM: ";
        String lexemaError = new String(yytext());

        textLine.append(mainError);
        textLine.append(lexemaError);
        System.err.println(textLine.toString());

        Arquivo arquivo = new Arquivo("./output.txt");
        arquivo.setConteudoArquivo(textLine.toString());
        arquivo.salvarArquivo();
        
   }

    



%}


%class LexicalAnalyzer
%type void

BRANCO = [\n| |\t|\r]
IDENTIFICADOR = [|a-z|A-Z][a-z|A-Z|0-9|]*
INTEIRO = ([-]?\d+)
REAL =    ([-]?(\d+)[.](\d+))
EXPRESSAOLITERAL = (['](.*?)['])
EXPRESSAOLITERALCOMVALOR = ((['](.*?)['])[#]((((-{1})?(\d+)[.](\d+))|((-{1})?\d+)))[#](['](.*?)[']))
TERMINADOR = ";"


SOMA = "+"
SUBTRACAO = "-"
MULTIPLICACAO = "*"
DIVISAO = "/"


ATRIBUICAO = "="
ABERTURABLOCO = "{"
FECHAMENTOBLOCO = "}"
ABERTURAPARENTESES = "("
FECHAMENTOPARENTESES = ")"
COMENTARIO = "//"


MENOR = "<"
MAIOR = ">"
MENORIGUAL = "<="
MAIORIGUAL = ">="
IGUAL = "=="
DIFERENTE = "!="




%%

"if"                         { imprimir("Palavra reservada if", yytext()); }
"elseif"                     { imprimir("Palavra reservada elseif", yytext()); }
"else"                       { imprimir("Palavra reservada else", yytext()); }
"then"                       { imprimir("Palavra reservada then", yytext()); }
"int"                        { imprimir("Palavra reservada int", yytext()); }
"real"                       { imprimir("Palavra reservada real", yytext()); }
"for"                        { imprimir("Palavra reservada for", yytext()); }
"string"                     { imprimir("Palavra reservada string", yytext()); }
"print"                      { imprimir("Palavra reservada print", yytext()); }
"read"                       { imprimir("Palavra reservada read", yytext()); }



{BRANCO}                    {  }
{IDENTIFICADOR}             { imprimir("Identificador", yytext()); }
{INTEIRO}                   { imprimir("Número Inteiro", yytext()); }
{EXPRESSAOLITERAL}          { imprimir("Expressao literal", yytext());}
{REAL}                      { imprimir("Número Real", yytext());}



{SOMA}                      { imprimir("Operacao de soma", yytext()); }
{SUBTRACAO}                 { imprimir("Operacao de subtracao", yytext()); }
{MULTIPLICACAO}             { imprimir("Operacao de multiplicacao", yytext());}
{DIVISAO}                   { imprimir("Operacao de divisao", yytext());}
{ATRIBUICAO}                { imprimir("Operador de atribuicao", yytext());}
{MENOR}                     { imprimir("Operador de menor", yytext());}
{MAIOR}                     { imprimir("Operador de maior", yytext());}
{MENORIGUAL}                { imprimir("Operador de menor ou igual", yytext());}
{MAIORIGUAL}                { imprimir("Operador de maior ou igual", yytext());}
{IGUAL}                     { imprimir("Operador de igualdade", yytext());}
{DIFERENTE}                 { imprimir("Operador de diferente de", yytext());}
{ABERTURABLOCO}             { imprimir("Abertura bloco", yytext());}
{FECHAMENTOBLOCO}           { imprimir("Fechamento bloco", yytext());}
{ABERTURAPARENTESES}        { imprimir("Inicio expressao", yytext());}
{FECHAMENTOPARENTESES}      { imprimir("Fim expressao", yytext());}
{COMENTARIO}                { imprimir("Comentario", yytext());}
{TERMINADOR}                { imprimir("Terminador de instrucao", yytext());}
{EXPRESSAOLITERALCOMVALOR}  { imprimir("Literal com valor", yytext());}
{EXPRESSAOLITERAL}          { imprimir("Expressao Literal", yytext());}


. { 
    PrintError();
    throw new RuntimeException("RUNTIME ERROR>> Lexema invalido: " + yytext());}