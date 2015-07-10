#include <stdio.h>
#include <stdlib.h>
#include <my_global.h>
#include <mysql.h>

/*
 * A partir do nome do professor,
 * imprime a frequencia de cada turma que o mesmo leciona.
 * 
 * input    @nome do professor
 *
 * output   @file
 */
void frequency();

/*
 * Imprime boleto de pagamento de um mes determinado.
 * 
 * input    @aluno
 *          @mes
 * 
 * output   @file
 */
void boleto();

/*
 * Imprime comprovante de pagamento
 * de determinado aluno.
 *
 * input    @nome do aluno
 *          @ano
 *
 * output   @file
 */
void payment_check();

/*
 * Qualquer SQL query que o usuário queira fazer
 *
 * input @string sql query
 *
 * output @tela
 */
void sql_query();

/*
 * Funcao main
 * Selecao de opcoes e menu de usuario
 * 
 * input    @no input
 * 
 * outputs  @erros
 */
void main (){
    MYSQL *con = mysql_init(NULL);
    int opt;

    if(con == NULL){
        fprintf(stderr, "%s\n", mysql_error(con));
        exit(1);
    }

    if(mysql_real_connect(con, "localhost", "root", "12345", NULL, 0, NULL, 0) == NULL){
        fprintf(stderr, "%s\n", mysql_error(con));
        mysql_close(con);
        exit(1);
    }

    printf("Entre com a opnção desejada:\n1-Imprimir frequencia 
            \n2-Imprimir Boleto\n3-Imprimir Extrato de pagamento\n4- SQL query");

    scanf("%d", opt);

    switch(opt){
        case 1:
        break;
        case 2:
        break;
        case 3:
        break;
        case 4: 
        break;
        default:
        break;
    }

}

void frequency(MYSQL *con, char *professor){
    if(mysql_query)
}
