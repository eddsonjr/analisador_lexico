Criado por: Edson Jr
5/9/2017


Este projeto foi criado na IDE netbeans 8.1.

Dentro do diretorio raiz do projeto existe o diretorio /libs, onde 
encontra - se a biblioteca do Jflex. O arquivo esta entitulado de 
jflex-1.6.1.jar. Para adicionar o ele ao classpath do projeto, basta 
voce configurar o projeto usando a opcao da IDE Ferramentas > Bibliotecas,
onde você podera criar uma nova biblioteca (entitule ela de jflex) e adicione
o jar contido na pasta /libs. 
Realize o mesmo procedimento para a lib apache-commons-io (responsável por trabalhar com 
os arquivos de texto dentro dos programas.)

ATENCAO: Caso você baixe o projeto e ainda o netbeans nao consiga encontrar 
os arquivos de biblioteca, faca o procedimento acima. 


Ainda dentro da pasta raiz do projeto, existe a pasta /dist, que e a 
pasta onde o netbeans cria o arquivo compilado do seu projeto (quando voce da
build no seu projeto, o netbeans cria um .jar nesta pasta com o nome do
projeto). Para que esse .jar funcione normalmente via terminal (ou cmd, no 
caso do windows), voce devera copiar a pasta /src da raiz do projeto para 
dentro da pasta /dist, pois ao executar o analisador_lexico_teste.jar, o
java ira procurar pelo arquivo "language.lex".



Ao realizar um novo build ou executar o projeto pelo proprio netbeans, sera chamada a ferramenta do jflex que ja deve estar instalada no sistema operacional, e com isso uma nova classe sera gerada e aparecera no projeto. Essa classe e a 
LexicalAnalyzer.java e ela pode apresentar alguns probleminhas com relacao 
ao codigo, mas que sao faceis de serem corridos. Sao eles:

1. Nome do pacote incorreto: Logo no inicio da classe existe o comando
"package", coloque a seguinte instrucao nele: "package analisador_lexico;"
[SEM ASPAS]

2. Retorno incorreto: existe um trecho no codigo desta classe que esta dessa
maneira: 


 // store back cached position
      zzMarkedPos = zzMarkedPosL;

      if (zzInput == YYEOF && zzStartRead == zzCurrentPos) {
        zzAtEOF = true;
        return null;   <--- RETIRE O NULL
      }
      else {
        switch (zzAction < 0 ? zzAction : ZZ_ACTION[zzAction]) {
          case 1: 
            { throw new RuntimeException("Caractere inválido " + yytext());


voce devera apagar o comando "null" do return [esta marcado com RETIRE O NULL 
acima no codigo]. 

ATENCAO: Voce devera realizar os procedimentos acima com relacao ao codigo toda vez que for dar build ou executar o seu projeto, pois a classe LexicalAnalyzer.java e recriada toda vez.




MODO DE OPERAR O PROGRAMA

Dentro da pasta /dist encontra - se o arquivo executavel do java (.jar), entitulado de “analisador_lexico_teste.jar”. Ao chamar o java para executa-lo, voce devera passar o nome de algum arquivo texto que contenha as definicoes da linguagem a ser analisada. Portanto, o modo correto de chamar o programa via terminal e:


java -jar analisador_lexico_teste.jar <arquivo.txt>

Onde <arquivo.txt>  e o nome do arquivo que contem as definicoes da linguagem. Toda vez que o programa e executado, ele gera um arquivo entitulado “output.txt”, porem uma vez criado, o mesmo arquivo e atualizado toda vez que o analisador lexico e executado, por tanto, recomenda - se apagar o arquivo antes de executar o analisador.

Voce pode utilizar os arquivos de codigo fonte de testes, que comecam com a sentenca “program”, para testar o analisador.

IMPORTANTE: dentro da pasta ./dist devera ter uma uma pasta /src. A /src nada mais e que uma copia da pasta /src que encontra - se na raiz do projeto. Portanto, copie a pasta /src da raiz do projeto para dentro da pasta /dist [O codigo java esta programado para procurar o arquivo .lex dentro da pasta /src].


