%{
	open Printf
	open Functions
  (*Changes in Parser*)
  (*changed the grammar by replacing the integer with ranges and indices and called the functions properly*)
%}
%token <int> INT
%token <float> FLOAT
%token <int*int> INDICES
%token <int*int*int*int> RANGE
%token <string>  ADD SUBT MULT DIV COUNT ROWCOUNT COLCOUNT MIN ROWMIN COLMIN MAX COLMAX ROWMAX AVG ROWAVG COLAVG SUM ROWSUM COLSUM
%token ASSIGNMENT SEMICOLON SPACE NEWLINE ERR EOF
%left ADD SUBT
%left MULT DIV 
%start main             
%type <unit> main

%%
main : NEWLINE		{ }
  	| func NEWLINE			{ }
  	;

func:
  	| INDICES SPACE ASSIGNMENT SPACE COUNT SPACE RANGE SPACE SEMICOLON      			      {full_count spreadsheet $7 $1}
  	| INDICES SPACE ASSIGNMENT SPACE ROWCOUNT SPACE RANGE SPACE SEMICOLON      			    {row_count spreadsheet $7 $1}
  	| INDICES SPACE ASSIGNMENT SPACE COLCOUNT SPACE RANGE SPACE SEMICOLON      			    {col_count spreadsheet $7 $1}
  	| INDICES SPACE ASSIGNMENT SPACE MIN SPACE RANGE SPACE SEMICOLON      				      {full_min spreadsheet $7 $1}
  	| INDICES SPACE ASSIGNMENT SPACE ROWMIN SPACE RANGE SPACE SEMICOLON     	 		      {row_min spreadsheet $7 $1}
  	| INDICES SPACE ASSIGNMENT SPACE COLMIN SPACE RANGE SPACE SEMICOLON      			      {col_min spreadsheet $7 $1}
  	| INDICES SPACE ASSIGNMENT SPACE MAX SPACE RANGE SPACE SEMICOLON      				      {full_max spreadsheet $7 $1}
  	| INDICES SPACE ASSIGNMENT SPACE ROWMAX SPACE RANGE SPACE SEMICOLON      			      {row_max spreadsheet $7 $1}
  	| INDICES SPACE ASSIGNMENT SPACE COLMAX SPACE RANGE SPACE SEMICOLON      			      {col_max spreadsheet $7 $1}
  	| INDICES SPACE ASSIGNMENT SPACE SUM SPACE RANGE SPACE SEMICOLON      				      {full_sum spreadsheet $7 $1}
  	| INDICES SPACE ASSIGNMENT SPACE ROWSUM SPACE RANGE SPACE SEMICOLON     	 		      {row_sum spreadsheet $7 $1}
  	| INDICES SPACE ASSIGNMENT SPACE COLSUM SPACE RANGE SPACE SEMICOLON      			      {col_sum spreadsheet $7 $1}
  	| INDICES SPACE ASSIGNMENT SPACE AVG SPACE RANGE SPACE SEMICOLON      				      {full_avg spreadsheet $7 $1}
  	| INDICES SPACE ASSIGNMENT SPACE ROWAVG SPACE RANGE SPACE SEMICOLON      			      {row_avg spreadsheet $7 $1}
  	| INDICES SPACE ASSIGNMENT SPACE COLAVG SPACE RANGE SPACE SEMICOLON      			      {col_avg spreadsheet $7 $1}
  	| INDICES SPACE ASSIGNMENT SPACE ADD SPACE RANGE SPACE RANGE SPACE SEMICOLON      	{add_range spreadsheet $7 $9 $1}
  	| INDICES SPACE ASSIGNMENT SPACE ADD SPACE RANGE SPACE FLOAT SPACE SEMICOLON      	{add_const spreadsheet $7 $9 $1}
  	| INDICES SPACE ASSIGNMENT SPACE ADD SPACE FLOAT SPACE RANGE SPACE SEMICOLON      	{add_const spreadsheet $9 $7 $1}
  	| INDICES SPACE ASSIGNMENT SPACE ADD SPACE INDICES SPACE RANGE SPACE SEMICOLON      {add_index spreadsheet $9 $7 $1}
  	| INDICES SPACE ASSIGNMENT SPACE ADD SPACE RANGE SPACE INDICES SPACE SEMICOLON      {add_index spreadsheet $7 $9 $1}
  	| INDICES SPACE ASSIGNMENT SPACE SUBT SPACE RANGE SPACE RANGE SPACE SEMICOLON     	{subt_range spreadsheet $7 $9 $1}
  	| INDICES SPACE ASSIGNMENT SPACE SUBT SPACE RANGE SPACE FLOAT SPACE SEMICOLON      	{subt_const spreadsheet $7 $9 $1}
  	| INDICES SPACE ASSIGNMENT SPACE SUBT SPACE FLOAT SPACE RANGE SPACE SEMICOLON      	{subt_const spreadsheet $9 $7 $1}
  	| INDICES SPACE ASSIGNMENT SPACE SUBT SPACE INDICES SPACE RANGE SPACE SEMICOLON     {subt_index spreadsheet $9 $7 $1}
  	| INDICES SPACE ASSIGNMENT SPACE SUBT SPACE RANGE SPACE INDICES SPACE SEMICOLON     {subt_index spreadsheet $7 $9 $1}  
  	| INDICES SPACE ASSIGNMENT SPACE MULT SPACE RANGE SPACE RANGE SPACE SEMICOLON      	{mult_range spreadsheet $7 $9 $1}
  	| INDICES SPACE ASSIGNMENT SPACE MULT SPACE RANGE SPACE FLOAT SPACE SEMICOLON      	{mult_const spreadsheet $7 $9 $1}
  	| INDICES SPACE ASSIGNMENT SPACE MULT SPACE FLOAT SPACE RANGE SPACE SEMICOLON      	{mult_const spreadsheet $9 $7 $1}
  	| INDICES SPACE ASSIGNMENT SPACE MULT SPACE INDICES SPACE RANGE SPACE SEMICOLON     {mult_index spreadsheet $9 $7 $1}
  	| INDICES SPACE ASSIGNMENT SPACE MULT SPACE RANGE SPACE INDICES SPACE SEMICOLON     {mult_index spreadsheet $7 $9 $1} 
  	| INDICES SPACE ASSIGNMENT SPACE DIV SPACE RANGE SPACE RANGE SPACE SEMICOLON      	{div_range spreadsheet $7 $9 $1}
  	| INDICES SPACE ASSIGNMENT SPACE DIV SPACE RANGE SPACE FLOAT SPACE SEMICOLON      	{div_const spreadsheet $7 $9 $1}
  	| INDICES SPACE ASSIGNMENT SPACE DIV SPACE FLOAT SPACE RANGE SPACE SEMICOLON      	{div_const spreadsheet $9 $7 $1}
  	| INDICES SPACE ASSIGNMENT SPACE DIV SPACE INDICES SPACE RANGE SPACE SEMICOLON      {div_index spreadsheet $9 $7 $1}
  	| INDICES SPACE ASSIGNMENT SPACE DIV SPACE RANGE SPACE INDICES SPACE SEMICOLON      {div_index spreadsheet $7 $9 $1}
  	;