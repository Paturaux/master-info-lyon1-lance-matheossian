%{

	#include "lexer.hpp"
 
	
	#include "TDI.hpp"

	extern TableDesIdentificateurs* tableId;
	extern TableDesIdentificateurs* tableBoolean;
	extern TableDesIdentificateurs* tableInteger;
	extern TableDesIdentificateurs* tableReal;
	extern TableDesIdentificateurs* tableString;
	extern TableDesIdentificateurs* tablePtr;

	int column = 0;
	int ligne = 1;

%}

chiffre				[0-9]
chiffres			[0-9]+
NQUOTE				[^']


SEP_DOT				"."
SEP_DOTS			":"
SEP_SCOL			";"
SEP_COMMA			"," 
SEP_CO				"["
SEP_CF				"]"
SEP_DOTDOT			".."
SEP_PO				"("
SEP_PF				")"



OP_EQ				"="
OP_NEQ				"<>"
OP_LTE				"<="
OP_MUL				"*"
OP_GT				">"
OP_GTE				">="
OP_ADD				"+"
OP_LT				"<"
OP_SLASH 			"/"
OP_SUB				"-"

T				[tT]
R				[rR]
U				[uU]
E				[eE]
F				[fF]
A				[aA]
L				[lL]
S				[sS]


%%


program			{column += yyleng; return KW_PROGRAM;}
var                     {column += yyleng; return KW_VAR;}
begin                   {column += yyleng; return KW_BEGIN;}
end                     {column += yyleng; return KW_END;}
integer                 {column += yyleng; return KW_INTEGER;}
real                    {column += yyleng; return KW_REAL;}
boolean                 {column += yyleng; return KW_BOOLEAN;}
char                    {column += yyleng; return KW_CHAR;}
string                  {column += yyleng; return KW_STRING;}
array			{column += yyleng; return KW_ARRAY;}
of			{column += yyleng; return KW_OF;}
type			{column += yyleng; return KW_TYPE;}
record			{column += yyleng; return KW_RECORD;}
function 		{column += yyleng; return KW_FUNC;}
procedure		{column += yyleng; return KW_PROC;}
const			{column += yyleng; return KW_CONST;}
label			{column += yyleng; return KW_LABEL;}

div			{column += yyleng; return KW_DIV;}
mod			{column += yyleng; return KW_MOD;}
and			{column += yyleng; return KW_AND;}
or			{column += yyleng; return KW_OR;}
xor			{column += yyleng; return KW_XOR;}
not			{column += yyleng; return KW_NOT;}

{SEP_DOT}               {column += yyleng; return SEP_DOT;}
{SEP_DOTS}              {column += yyleng; return SEP_DOTS;}
{SEP_SCOL}              {column += yyleng; return SEP_SCOL;}
{SEP_COMMA}             {column += yyleng; return SEP_COMMA;}
{SEP_CO}		{column += yyleng; return SEP_CO;}
{SEP_CF}		{column += yyleng; return SEP_CF;}
{SEP_DOTDOT}		{column += yyleng; return SEP_DOTDOT;}
{SEP_PO}		{column += yyleng; return SEP_PO;}
{SEP_PF}		{column += yyleng; return SEP_PF;}


{OP_EQ}			{column += yyleng; return OP_EQ;}
{OP_NEQ}		{column += yyleng; return OP_NEQ;}
{OP_LTE}		{column += yyleng; return OP_LTE;}
{OP_MUL}		{column += yyleng; return OP_MUL;}
{OP_GT}			{column += yyleng; return OP_GT;}
{OP_GTE}		{column += yyleng; return OP_GTE;}
{OP_ADD}		{column += yyleng; return OP_ADD;}
{OP_LT}			{column += yyleng; return OP_LT;}
{OP_SLASH}		{column += yyleng; return OP_SLASH;}

"->" |
"^"                     {column += yyleng; return OP_PTR;}
{OP_SUB}		{column += yyleng; return OP_SUB;}


{T}{R}{U}{E}		{column += yyleng; yylval.numeroBoolean = tableBoolean->ajouterAutre(yytext);    return TOK_BOOLEAN;}
{F}{A}{L}{S}{E}		{column += yyleng; yylval.numeroBoolean = tableBoolean->ajouterAutre(yytext);    return TOK_BOOLEAN;}
{chiffres} 		{column += yyleng; yylval.numeroInteger = tableInteger->ajouterAutre(yytext);	 return TOK_INTEGER;}
{chiffres}"."{chiffres} {column += yyleng; yylval.numeroReal = tableReal->ajouterAutre(yytext) ;	 return TOK_REAL;}
'([^']|'')+'		{column += yyleng; yylval.numeroString = tableString->ajouterAutre(yytext) ;	 return TOK_STRING;}
nil			{column += yyleng; yylval.numeroPtr = tablePtr->ajouterAutre(yytext) ;		 return TOK_PTR;}
[a-zA-Z][a-zA-Z0-9]*   	{column += yyleng; yylval.numeroIdent = tableId->ajouterIdent(yytext);  	 return TOK_IDENT;}
\n			{ligne += 1;}
.			
	

%%

int yyerror(char* message)
{
    fprintf( stderr, "Erreur d'analyse : %s [%s] %d\n", message, yytext, ligne );

    return 0;
}
