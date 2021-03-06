pgms/advinhe.hs~                                                                                    0000644 0002433 0002424 00000001017 10360763076 013312  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   module Main
    where

import Random

main =
    do num <- randomRIO (1::Int, 10)
       putStrLn "Eu estou pensando em um n�mero entre  1 e 100"
       adivinhe num

adivinhe num =
    do putStrLn "Tente adivinhar, entre com o n�mero:"
       guess <- getLine
       if (read guess) < num
         then do putStrLn "Muito baixo!"
                 adivinhe num
         else if read guess > num
                then do putStrLn "Muito alto!"
                        adivinhe num
                else do putStrLn "Voc� venceu!"
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 pgms/aux_tuplas.hs                                                                                  0000644 0002433 0002424 00000002335 10422434221 013651  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   -- Ex1
type Seq_Caract = String     -- Uma sequ�ncia de caracteres
type Nomes = (Seq_Caract, Seq_Caract, Seq_Caract, Seq_Caract)

f_nomes_est :: Nomes
f_nomes_est = ("Inverno", "Outono", "Primavera", "Verao")

selec_inv  ( x , _ , _ , _ ) = x
selec_outono  ( _ , x , _ , _ ) = x
selec_prima  ( _ , _ , x , _ ) = x
selec_verao  ( _ , _ , _ , x ) = x

{-
Main> f_nomes_est
("Inverno","Outono","Primavera","Verao")
Main> selec_inv f_nomes_est
"Inverno"
Main> selec_verao f_nomes_est
"Verao"
Main> selec_outono ("Joao", "Pedro", "Augusto", "Marcio")
"Pedro"

-}
-- Ex 2
type Peso = Float
type Idade = Int
type Pessoa = (String , Idade , Peso , String)

f_joao, f_maria :: Pessoa
f_joao = ("Joao Pedro", 19, 75.789 ,"Basquete")
f_maria  = ("Maria Fernanda", 18, 65.432, "Volei")

selec_nome :: Pessoa -> String
selec_idade :: Pessoa -> Idade
selec_peso :: Pessoa -> Peso
selec_esporte :: Pessoa -> String

selec_nome (n,i,p,e) = n
selec_idade (n,i,p,e) = i
selec_peso (n,i,p,e) = p
selec_esporte (n,i,p,e) = e

{-
Main> f_joao
("Joao Pedro",19,75.789,"Basquete")
Main> f_maria
("Maria Fernanda",18,65.432,"Volei")
Main> selec_nome f_joao
"Joao Pedro"
Main> selec_peso f_maria
65.432
Main> selec_idade f_joao
19
Main> selec_esporte f_maria
"Volei"
-}
                                                                                                                                                                                                                                                                                                   pgms/aux_tuplas.hs~                                                                                 0000644 0002433 0002424 00000002310 10422434136 014045  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   -- Ex1
type Seq_Caract = String     -- Uma sequ�ncia de caracteres
type Nomes = (Seq_Caract, Seq_Caract, Seq_Caract, Seq_Caract)

f_nomes_est = ("Inverno", "Outono", "Primavera", "Verao")

selec_inv  ( x , _ , _ , _ ) = x
selec_outono  ( _ , x , _ , _ ) = x
selec_prima  ( _ , _ , x , _ ) = x
selec_verao  ( _ , _ , _ , x ) = x

{-
Main> f_nomes_est
("Inverno","Outono","Primavera","Verao")
Main> selec_inv f_nomes_est
"Inverno"
Main> selec_verao f_nomes_est
"Verao"
Main> selec_outono ("Joao", "Pedro", "Augusto", "Marcio")
"Pedro"

-}
-- Ex 2
type Peso = Float
type Idade = Int
type Pessoa = (String , Idade , Peso , String)

f_joao, f_maria :: Pessoa
f_joao = ("Joao Pedro", 19, 75.789 ,"Basquete")
f_maria  = ("Maria Fernanda", 18, 65.432, "Volei")

selec_nome :: Pessoa -> String
selec_idade :: Pessoa -> Idade
selec_peso :: Pessoa -> Peso
selec_esporte :: Pessoa -> String

selec_nome (n,i,p,e) = n
selec_idade (n,i,p,e) = i
selec_peso (n,i,p,e) = p
selec_esporte (n,i,p,e) = e

{-
Main> f_joao
("Joao Pedro",19,75.789,"Basquete")
Main> f_maria
("Maria Fernanda",18,65.432,"Volei")
Main> selec_nome f_joao
"Joao Pedro"
Main> selec_peso f_maria
65.432
Main> selec_idade f_joao
19
Main> selec_esporte f_maria
"Volei"
-}
                                                                                                                                                                                                                                                                                                                        pgms/cap_arvores.hs                                                                                 0000644 0002433 0002424 00000003060 10421045233 013764  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   --�rvore Bin�ria de Inteiros

data ArvoreBin_Int = Nil_int | Nodo_int Int ArvoreBin_Int ArvoreBin_Int
       deriving Show   
       
arvoreB = Nodo_int 4 (Nodo_int 2 Nil_int Nil_int)
                 (Nodo_int 10 (Nodo_int 5 Nil_int Nil_int)
                          (Nodo_int 15 Nil_int Nil_int))
			  
folhas_int :: ArvoreBin_Int -> [Int]
folhas_int Nil_int = []
folhas_int (Nodo_int n Nil_int Nil_int) = [n]
folhas_int (Nodo_int _ esq dir) = folhas_int esq ++ folhas_int dir

--�rvore Bin�ria Gen�rica

data ArvoreBin_gen a = Nil | Nodo a (ArvoreBin_gen a) (ArvoreBin_gen a)
        deriving Show
	
arvoreB1 :: ArvoreBin_gen Char
arvoreB1 = Nodo 'a' (Nodo 'b' Nil Nil)
                   (Nodo 'c' (Nodo 'd' Nil Nil)
                             (Nodo 'e' Nil Nil))

arvoreB2 :: ArvoreBin_gen (Integer,Char)
arvoreB2 = Nodo (4,'a') (Nodo (2,'b') Nil Nil)
                              (Nodo (10,'c') (Nodo (5,'d') Nil Nil)
                                             (Nodo (15,'e') Nil Nil))
folhas_gen :: ArvoreBin_gen a -> [a]
folhas_gen Nil = []
folhas_gen (Nodo n Nil Nil) = [n]
folhas_gen (Nodo _ esq dir) = folhas_gen esq ++ folhas_gen dir            


--�rvore Bin�ria com Tuplas

data ArvoreBin_tup a = Vazio | No2 a |No ((ArvoreBin_tup a),(ArvoreBin_tup a))

folhas_tup :: ArvoreBin_tup Int -> [Int]
folhas_tup Vazio = []
folhas_tup (No (Vazio, Vazio)) = []
folhas_tup (No(No2 esq, Vazio)) = [esq]
folhas_tup (No (Vazio ,No2 dir)) = [dir]
folhas_tup (No (No2 esq,No2 dir)) = [esq]++[dir]
folhas_tup (No (esq , dir)) = folhas_tup esq ++ folhas_tup dir
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                pgms/cap_classes.hs                                                                                 0000644 0002433 0002424 00000001766 10463720745 013771  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   



soma_lista :: [Int] -> Int
soma_lista [] = 0
soma_lista (x:xs) = x + soma_lista xs

data Dia = Segunda | Ter�a | Quarta | Quinta | Sexta | S�bado | Domingo
           deriving (Enum,Show)
----------------------------------------------------------------------------------------------	   
f_um_int :: Int 
f_um_int = 77	   
{-
Main> 789 /  f_um_int
ERROR - Cannot infer instance
*** Instance   : Fractional Int
*** Expression : 789 /  f_um_int

Main> 789 / (fromIntegral)  f_um_int
10.2467532467532

Main> :t  (/)
(/) :: Fractional a => a -> a -> a

-}
{-	   

Main> log 77
4.34380542185368

Main> log     f_um_int
ERROR - Cannot infer instance
*** Instance   : Floating Int
*** Expression : log  f_um_int

Main> :t log
log :: Floating a => a -> a

Main> log (fromIntegral     f_um_int)
4.34380542185368

Main> :t sin
sin :: Floating a => a -> a

-}	   
f_dois_integer :: Integer	   
f_dois_integer = 99


le_imprime_1 = getLine >>= \e -> putStrLn e
le_imprime_2 = do  e <- getLine
                   putStrLn e
          pgms/cap_classes.hs~                                                                                0000644 0002433 0002424 00000001764 10463720635 014163  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   



soma_lista :: [Int] -> Int
soma_lista [] = 0
soma_lista (x:xs) = x + soma_lista xs

data Dia = Segunda | Ter�a | Quarta | Quinta | Sexta | S�bado | Domingo
           deriving (Enum,Show)
----------------------------------------------------------------------------------------------	   
f_um_int :: Int 
f_um_int = 77	   
{-
Main> 789 /  f_um_int
ERROR - Cannot infer instance
*** Instance   : Fractional Int
*** Expression : 789 /  f_um_int

Main> 789 / (fromIntegral)  f_um_int
10.2467532467532

Main> :t  (/)
(/) :: Fractional a => a -> a -> a

-}
{-	   

Main> log 77
4.34380542185368

Main> log     f_um_int
ERROR - Cannot infer instance
*** Instance   : Floating Int
*** Expression : log  f_um_int

Main> :t log
log :: Floating a => a -> a

Main> log (fromIntegral     f_um_int)
4.34380542185368

Main> :t sin
sin :: Floating a => a -> a

-}	   
f_dois_integer :: Integer	   
f_dois_integer = 99


le_imprime_1 = getLine >>= \e -> putStrLn
le_imprime_2 = do  e <- getLine
                   putStrLn e
            pgms/cap_elementos_n_funcionais.hs                                                                  0000644 0002433 0002424 00000003047 10431772243 017047  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   lista_de_acoes :: [ IO() ] 
lista_de_acoes =
    [ putStrLn   "Aqui come�a uma lista de a��es de IO" ,
      do { putStr   "Digite dois n�meros::  "  ;
           x <-  le_Float   ;
           y <-  le_Float   ;
	   putStr "A m�dia � dada por:  " ;
           print ( f_media_2  x  y ) ;
	 } ,
      putStr "\n saltando de linha \n"   ,
      do
	  putStrLn " Tudo visivel localmente neste 'do' "    
	  putStr   "O tamanho dessa  lista de a��es: "    ,
     print  ( f_compto   lista_de_acoes ),
     putStr "\n \t FIM ..."  
    ]    

-- lendo um valor real
le_Float :: IO Float
le_Float = do { linha <- getLine ;
                 return (read linha :: Float) ;
              }		  

-- comprimento de uma lista
f_compto :: [ IO() ]  -> Int
f_compto [] = 0
f_compto (a:b) = 1 +  f_compto b	      

-- valor m�dio entre dois n�meros
f_media_2  :: Float   -> Float   -> Float  
f_media_2     x    y    = (/)  ( (+) x  y )  2

-- fun��o gen�rica de execu�ao de uma lista
exec_lista ::  [ IO() ]  ->  IO()
exec_lista [] = return ()
exec_lista (a:b) = do { a ;
                       exec_lista  b; 
		      }




mp_lista_1 ::  [ Int ]  ->  IO()
imp_lista_1 [] = return ()
imp_lista_1  (a:b) = do { print a ;
                       imp_lista_1  b ;
                       }
					     
{-
Main>
imp_lista_1 [4 .. 9]
4
5
6
7
8
9

-}


imp_lista_2 ::  [ Int ]  ->  IO()
imp_lista_2 [] = return ()
imp_lista_2  (a:b) = do { putStr (show a);
                             imp_lista_2  b;
                                }
							  
{-
Main> imp_lista_2 [4 .. 9]
456789
Main>
-}

-- 
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         pgms/cap_elementos_n_funcionais.hs~                                                                 0000644 0002433 0002424 00000002123 10430702122 017223  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   lista_de_acoes :: [ IO() ] 
lista_de_acoes =
    [ putStrLn   "Aqui come�a uma lista de a��es de IO" ,
      do { putStr   "Digite dois n�meros::  "  ;
           x <-  le_Float   ;
           y <-  le_Float   ;
	   putStr "A m�dia � dada por:  " ;
           print ( f_media_2  x  y ) ;
	 } ,
      putStr "\n saltando de linha \n"   ,
      do
	  putStrLn " Tudo visivel localmente neste 'do' "    
	  putStr   "O tamanho dessa  lista de a��es: "    ,
     print  ( f_compto   lista_de_acoes ),
     putStr "\n \t FIM ..."  
    ]    

-- lendo um valor real
le_Float :: IO Float
le_Float = do { linha <- getLine ;
                 return (read linha :: Float) ;
              }		  

-- comprimento de uma lista
f_compto :: [ IO() ]  -> Int
f_compto [] = 0
f_compto (a:b) = 1 +  f_compto b	      

-- valor m�dio entre dois n�meros
f_media_2  :: Float   -> Float   -> Float  
f_media_2     x    y    = (/)  ( (+) x  y )  2

-- fun��o gen�rica de execu�ao de uma lista
exec_lista ::  [ IO() ]  ->  IO()
exec_lista [] = return ()
exec_lista (a:b) = do { a ;
                       exec_lista  b; 
		      }
                                                                                                                                                                                                                                                                                                                                                                                                                                             pgms/cap_figuras.hs                                                                                 0000644 0002433 0002424 00000005165 10444622667 013774  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   
losango = ["....#....",
           "...###...",
           "..#####..",
           "...###...",
           "....#...."]
	   
concatena :: [a] -> [a] -> [a]
concatena [] lista_2  =  lista_2
concatena (a:b) lista_2 = a : concatena b lista_2 


inverte_1 :: [a] -> [a]
inverte_1 []     =  []
inverte_1 (x:xs) =  concatena ( inverte_1 xs ) [x]

type Figura = [[Char]]   -- [String]

cavalo :: Figura
cavalo = [
          ".......##..." ,
         ".....##..#.." ,
         "...##.....#." ,
         "..#.......#." ,
         "..#...#...#." ,
         "..#...###.#." ,
         ".#....#..##." ,
         "..#...#....." ,
         "...#...#...." ,
         "....#..#...." ,
         ".....#.#...." ,
         "......##...." ]
	 
imp_cavalo :: [[Char]] -> IO ()
imp_cavalo [] = putStr  "................."
imp_cavalo (c:resto) = do {
                               putStr c;
                               putStr "\n";
                               imp_cavalo resto
                           }	 
	 
imp_cavalo2 :: [[Char]] -> IO ()
imp_cavalo2 x= putStr(reduzir (\x y-> x ++ "\n" ++ y )  x)

-- auxiliar
reduzir :: (a -> a -> a) -> [a] -> a
reduzir f [a]     = a
reduzir f (a:b) = f a (reduzir f  b)

mapear :: (a -> b) -> [a] -> [b]
mapear f [ ]  = [ ]
mapear f (a:b) = (f a) : (mapear f  b)
-------------------------------------------------------------

inverte_vertical :: Figura -> Figura
inverte_vertical = mapear inverte_1
inv_vert_2  :: Figura -> Figura
inv_vert_2  x  = mapear inverte_1 x

inverte_horizontal :: Figura -> Figura
inverte_horizontal = inverte_1


translada_1 :: Figura -> Figura
translada_1 = inverte_vertical . inverte_horizontal


translada_2, translada_3 :: Figura -> Figura
translada_2 x = inverte_horizontal  (inverte_vertical x)
translada_3 x = inverte_horizontal  (inverte_vertical  x)

inverte_cor :: Figura -> Figura
inverte_cor = map (map troca_cor)

troca_cor :: Char -> Char
troca_cor ch = if ch == '.' then '#' else '.'

zoom :: Figura -> Figura
zoom [] = []
zoom (a:b) = duplica a : duplica a : zoom b

duplica :: String -> String
duplica [] = []
duplica (a:b) = a : a : duplica b

acima, acima_2 :: Figura -> Figura -> Figura
acima = concatena   
acima_2 x y = concatena x y
--------------
zipa_lista :: (a -> b -> c) -> [a] -> [b] -> [c]
zipa_lista f [a]  [c] = f a c : []
--zipa_lista f (a:b)  (c:[]) = f a c : []
zipa_lista f (a:b) (c:d) = f a c :  (zipa_lista f  b d)

lado_a_lado :: Figura -> Figura -> Figura
lado_a_lado =  zipa_lista concatena

-----
sobreposicao :: Figura -> Figura -> Figura
sobreposicao = zipa_lista (zipa_lista  sobrepoe_letra)

sobrepoe_letra :: Char -> Char -> Char
sobrepoe_letra c d = if c=='#' then '#' else d
                                                                                                                                                                                                                                                                                                                                                                                                           pgms/cap_figuras.hs~                                                                                0000644 0002433 0002424 00000004651 10444621351 014156  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   
losango = ["....#....",
           "...###...",
           "..#####..",
           "...###...",
           "....#...."]
	   
concatena :: [a] -> [a] -> [a]
concatena [] lista_2  =  lista_2
concatena (a:b) lista_2 = a : concatena b lista_2 


inverte_1 :: [a] -> [a]
inverte_1 []     =  []
inverte_1 (x:xs) =  concatena ( inverte_1 xs ) [x]

type Figura = [[Char]]   -- [String]

cavalo :: Figura
cavalo = [
          ".......##..." ,
         ".....##..#.." ,
         "...##.....#." ,
         "..#.......#." ,
         "..#...#...#." ,
         "..#...###.#." ,
         ".#....#..##." ,
         "..#...#....." ,
         "...#...#...." ,
         "....#..#...." ,
         ".....#.#...." ,
         "......##...." ]
	 
imp_cavalo :: [[Char]] -> IO ()
imp_cavalo [] = putStr  "................."
imp_cavalo (c:resto) = do {
                               putStr c;
                               putStr "\n";
                               imp_cavalo resto
                           }	 
	 
imp_cavalo2 :: [[Char]] -> IO ()
imp_cavalo2 x= putStr(reduzir (\x y-> x ++ "\n" ++ y )  x)

-- auxiliar
reduzir :: (a -> a -> a) -> [a] -> a
reduzir f [a]     = a
reduzir f (a:b) = f a (reduzir f  b)

mapear :: (a -> b) -> [a] -> [b]
mapear f [ ]  = [ ]
mapear f (a:b) = (f a) : (mapear f  b)
-------------------------------------------------------------

inverte_vertical :: Figura -> Figura
inverte_vertical = mapear inverte_1
inv_vert_2  :: Figura -> Figura
inv_vert_2  x  = mapear inverte_1 x

inverte_horizontal :: Figura -> Figura
inverte_horizontal = inverte_1


translada_1 :: Figura -> Figura
translada_1 = inverte_vertical . inverte_horizontal


translada_2, translada_3 :: Figura -> Figura
translada_2 x = inverte_horizontal  (inverte_vertical x)
translada_3 x = inverte_horizontal  (inverte_vertical  x)

inverte_cor :: Figura -> Figura
inverte_cor = map (map troca_cor)

troca_cor :: Char -> Char
troca_cor ch = if ch == '.' then '#' else '.'

zoom :: Figura -> Figura
zoom [] = []
zoom (a:b) = duplica a : duplica a : zoom b

duplica :: String -> String
duplica [] = []
duplica (a:b) = a : a : duplica b

acima, acima_2 :: Figura -> Figura -> Figura
acima = concatena   
acima_2 x y = concatena x y

zipa_lista :: (a -> b -> c) -> [a] -> [b] -> [c]

zipa_lista f [a]  [c] = f a c : []
--zipa_lista f (a:b)  (c:[]) = f a c : []

zipa_lista f (a:b) (c:d) = f a c :  (zipa_lista f  b d)

lado_a_lado :: Figura -> Figura -> Figura
lado_a_lado =  zipa_lista concatena
                                                                                       pgms/cap_generalizacao.hs                                                                           0000644 0002433 0002424 00000006144 10444422625 015126  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   
import Char

dobro :: [Int] -> [Int]
dobro []    = []
dobro (a:b) = (2*a) : dobro   b

conv_maiusc :: String  -> String
conv_maiusc [ ] = [ ]
conv_maiusc (a:b) = toUpper  a : conv_maiusc b

retorna_nome :: [(Int,String)] -> [String]
retorna_nome []    = []
retorna_nome (a:b) = conv_maiusc (snd a) : retorna_nome b
--------------------------
par :: Int -> Bool
par a = a `mod`  2 == 0  -- ou mod a 2

somente_par :: [Int] -> [Int]
somente_par []   = []
somente_par (a:b)
            |par(a)    = a : (somente_par b)
            |otherwise = somente_par b

maior_15 :: [(String,Int)] -> [(String,Int)]
maior_15 [] = []
maior_15 (a:b)
       | (snd a) > 15  = a : (maior_15 b)
       | otherwise     = maior_15 b

------------------------
soma :: [Int] -> Int
soma [] = 0
soma (a:b) = a + (soma b)

gera_frase :: [String] -> String
gera_frase []    = ""
gera_frase (a:b) = a ++ (gera_frase b)
-----------------------------------------
vezes_2 :: [Int] -> [Int]
vezes_2 []    = []
vezes_2 (a:b) = (2*a) : vezes_2   b

vezes_3 :: [Int] -> [Int]
vezes_3 []    = []
vezes_3 (a:b) = (3*a) : vezes_3   b


vezes_4 :: [Int] -> [Int]
vezes_4 []    = []
vezes_4 (a:b) = (4*a) : vezes_4   b
------------------------------
mult_2, mult_3, mult_4 :: Int -> Int
mult_2 n = 2*n
mult_3 n = 3*n
mult_4 n = 4*n
-----------------------
mapear :: (a -> b) -> [a] -> [b]
mapear f [ ]  = [ ]
mapear f (a:b) = (f a) : (mapear f  b)

mapear_2  f  lista  = [ (f  a) | a <-  lista]

dobro_lst :: [Int] -> [Int]
dobro_lst  l = mapear  mult_2  l
triplo_lst :: [Int] -> [Int]
triplo_lst  l = mapear  mult_3  l
-------------------------------------------
-- FILTRAR

maior_1 :: [Int] -> [Int]
maior_1 [] = []
maior_1 (a:b)
       | a > 1    = a : (maior_1 b)
       |otherwise = maior_1   b


maior_2 :: [Int] -> [Int]
maior_2 [] = []
maior_2 (a:b)
       | a > 2    = a : (maior_1  b)
       |otherwise = maior_1   b


maior_3 :: [Int] -> [Int]
maior_3 [] = []
maior_3 (a:b)
       | a > 3    = a : (maior_1 b)
       |otherwise = maior_1   b


condicao_1, condicao_2, condicao_3 :: Int -> Bool
condicao_1 n = n > 1
condicao_2 n = n > 2
condicao_3 n = n > 3

maior_q_1 l = filtrar  condicao_1  l
maior_q_2 l = filtrar  condicao_2  l

filtrar :: (a -> Bool) -> [a] -> [a]
filtrar f []       = []
filtrar f (a:xs)
       | f   a  = a : filtrar f  xs     -- f a   � igual a: (f  a) == True
       | otherwise = filtrar f  xs


filtrar_2   f   lista = [ (f  a) | a <- lista]


mult_l :: [Int] -> Int
mult_l []   = 1
mult_l (a:b)= a * mult_l    b

soma_l :: [Int] -> Int
soma_l []   = 0
soma_l (a:b)= a + soma_l   b



concatena_L :: [String] -> String
concatena_L  []   = ""
concatena_L (a:b)= a ++ concatena_L  b


reduzir :: (a -> a -> a) -> [a] -> a
reduzir f [a]     = a
reduzir f (a:b) = f a (reduzir f  b)


mod_soma :: Num a => a -> a -> a
mod_soma a  b  = abs ( a + b)
---------------------------------
reduzird :: (a -> b -> b) -> b -> [a] -> b
reduzird f aux [ ]     = aux
reduzird f aux (a:b) = f a (reduzird  f  aux  b)

t1 = reduzird (\x y -> y+1) 0 [5,12,25,14]


reduzire :: (a -> b -> a) -> a -> [b] -> a
reduzire f  aux  [ ]    = aux
reduzire f  aux  (a:b) = reduzire f  (f  aux  a)  b


                                                                                                                                                                                                                                                                                                                                                                                                                            pgms/cap_generalizacao.hs~                                                                          0000644 0002433 0002424 00000006141 10444420753 015321  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   
import Char

dobro :: [Int] -> [Int]
dobro []    = []
dobro (a:b) = (2*a) : dobro   b

conv_maiusc :: String  -> String
conv_maiusc [ ] = [ ]
conv_maiusc (a:b) = toUpper  a : conv_maiusc b

retorna_nome :: [(Int,String)] -> [String]
retorna_nome []    = []
retorna_nome (a:b) = conv_maiusc (snd a) : retorna_nome b
--------------------------
par :: Int -> Bool
par a = a `mod`  2 == 0  -- ou mod a 2

somente_par :: [Int] -> [Int]
somente_par []   = []
somente_par (a:b)
            |par(a)    = a : (somente_par b)
            |otherwise = somente_par b

maior_15 :: [(String,Int)] -> [(String,Int)]
maior_15 [] = []
maior_15 (a:b)
       | (snd a) > 15  = a : (maior_15 b)
       | otherwise     = maior_15 b

------------------------
soma :: [Int] -> Int
soma [] = 0
soma (a:b) = a + (soma b)

gera_frase :: [String] -> String
gera_frase []    = ""
gera_frase (a:b) = a ++ (gera_frase b)
-----------------------------------------
vezes_2 :: [Int] -> [Int]
vezes_2 []    = []
vezes_2 (a:b) = (2*a) : vezes_2   b

vezes_3 :: [Int] -> [Int]
vezes_3 []    = []
vezes_3 (a:b) = (3*a) : vezes_3   b


vezes_4 :: [Int] -> [Int]
vezes_4 []    = []
vezes_4 (a:b) = (4*a) : vezes_4   b
------------------------------
mult_2, mult_3, mult_4 :: Int -> Int
mult_2 n = 2*n
mult_3 n = 3*n
mult_4 n = 4*n
-----------------------
mapear :: (a -> b) -> [a] -> [b]
mapear f [ ]  = [ ]
mapear f (a:b) = (f a) : (mapear f  b)

mapear_2  f  lista  = [ (f  a) | a <-  lista]

dobro_lst :: [Int] -> [Int]
dobro_lst  l = mapear  mult_2  l
triplo_lst :: [Int] -> [Int]
triplo_lst  l = mapear  mult_3  l
-------------------------------------------
-- FILTRAR

maior_1 :: [Int] -> [Int]
maior_1 [] = []
maior_1 (a:b)
       | a > 1    = a : (maior_1 b)
       |otherwise = maior_1   b


maior_2 :: [Int] -> [Int]
maior_2 [] = []
maior_2 (a:b)
       | a > 2    = a : (maior_1  b)
       |otherwise = maior_1   b


maior_3 :: [Int] -> [Int]
maior_3 [] = []
maior_3 (a:b)
       | a > 3    = a : (maior_1 b)
       |otherwise = maior_1   b


condicao_1, condicao_2, condicao_3 :: Int -> Bool
condicao_1 n = n > 1
condicao_2 n = n > 2
condicao_3 n = n > 3

maior_q_1 l = filtrar  condicao_1  l
maior_q_2 l = filtrar  condicao_2  l

filtrar :: (a -> Bool) -> [a] -> [a]
filtrar f []       = []
filtrar f (a:xs)
       | f   a  = a : filtrar f  xs     -- f a   � igual a: (f  a) == True
       | otherwise = filtrar f  xs


filtrar_2   f   lista = [ (f  a) | a <- lista]


mult_l :: [Int] -> Int
mult_l []   = 1
mult_l (a:b)= a * mult_l    b

soma_l :: [Int] -> Int
soma_l []   = 0
soma_l (a:b)= a + soma_l   b



concatena_L :: [String] -> String
concatena_L  []   = ""
concatena_L (a:b)= a ++ concatena_L  b


reduzir :: (a -> a -> a) -> [a] -> a
reduzir f [a]     = a
reduzir f (a:b) = f a (reduzir f  b)


mod_soma :: Num a => a -> a -> a
mod_soma a  b  = abs ( a + b)
---------------------------------
reduzird :: (a -> b -> b) -> b -> [a] -> b
reduzird f aux [ ]     = aux
reduzird f aux (a:b) = f a (reduzird  f  aux  b)

t1 = reduzird (\x y -> y+1) 0 [5,12,25,14]


reduzire :: (a -> b -> a) -> a -> [b] -> a
reduzire f  aux  [ ]    = aux
reduzire f  aux  (a:b) = reduzire f (f  aux  a)  b
                                                                                                                                                                                                                                                                                                                                                                                                                               pgms/cap_inducao.hs                                                                                 0000644 0002433 0002424 00000002155 10431775605 013747  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   soma a b = a + b


fib 0 = 0
fib 1 = 1
fib n = soma (fib (n-1))  (fib (n-2))    --  Equivalente a: fib (n-1) + fib (n-2) 

--seq = [x | x <- fib \y, \y < 10]

{- 
f x y z | (x > 7) = 789 
f x y z | (y < 7) = 789
f x y z | (z == 7) = 789
        | otherwise = 0 


g  x y z | (x > 7) || (y < 7) || (z == 7) = 789
         | otherwise = 0


h  x _ _ | (x > 7) = 789
h  _ y _ | (y < 7) = 789
h  _ _ z | (z == 7) = 789
         | otherwise = 0
	
	
 -}
f x y z | (x == 7) = 10
f x y z | (y == 8) = 20
f x y z | (z == 9) = 30
        | otherwise = 0 


g 7 y z  = 10
g x 8 z  = 20
g x y 9  = 30
g x y z  | (x /= 7) || (y /= 8) || (z /= 9)  = 0
	
	
h  7 _ _  = 10
h  _ 8 _  = 20
h  _ _ 9  = 30
h  _  _ _ = 0




	
{-   EXECUCAO

Main> f 7 8 9
10
Main> f 17 8 9
20
Main> f 17 18 9
30
Main> f 17 18 19
0
Main> g 7 8 9
10
Main> g 17 8 9
20
Main> g 17 18 9
30
Main> g 17 18 19
0
Main> h 7 8 9
10
Main> h 17 8 9
20
Main> h 17 18 9
30
Main> h 17 18 19
0
Main>            

-}
{- multi_7 x |(x>=1) && (x<=6) = 0
          |otherwise        = 1 + multi_7 (x-7)
-}


multi_7 x | (x<1) && (x>7) =  1 + multi_7 (x-7)
multi_7   7   =  1
multi_7 _ = 0

                                                                                                                                                                                                                                                                                                                                                                                                                   pgms/cap_inducao.hs~                                                                                0000644 0002433 0002424 00000002153 10431775536 014146  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   soma a b = a + b


fib 0 = 0
fib 1 = 1
fib n = soma (fib (n-1))  (fib (n-2))    --  Equivalente a: fib (n-1) + fib (n-2) 

seq = [x | x <- fib \y, \y < 10]

{- 
f x y z | (x > 7) = 789 
f x y z | (y < 7) = 789
f x y z | (z == 7) = 789
        | otherwise = 0 


g  x y z | (x > 7) || (y < 7) || (z == 7) = 789
         | otherwise = 0


h  x _ _ | (x > 7) = 789
h  _ y _ | (y < 7) = 789
h  _ _ z | (z == 7) = 789
         | otherwise = 0
	
	
 -}
f x y z | (x == 7) = 10
f x y z | (y == 8) = 20
f x y z | (z == 9) = 30
        | otherwise = 0 


g 7 y z  = 10
g x 8 z  = 20
g x y 9  = 30
g x y z  | (x /= 7) || (y /= 8) || (z /= 9)  = 0
	
	
h  7 _ _  = 10
h  _ 8 _  = 20
h  _ _ 9  = 30
h  _  _ _ = 0




	
{-   EXECUCAO

Main> f 7 8 9
10
Main> f 17 8 9
20
Main> f 17 18 9
30
Main> f 17 18 19
0
Main> g 7 8 9
10
Main> g 17 8 9
20
Main> g 17 18 9
30
Main> g 17 18 19
0
Main> h 7 8 9
10
Main> h 17 8 9
20
Main> h 17 18 9
30
Main> h 17 18 19
0
Main>            

-}
{- multi_7 x |(x>=1) && (x<=6) = 0
          |otherwise        = 1 + multi_7 (x-7)
-}


multi_7 x | (x<1) && (x>7) =  1 + multi_7 (x-7)
multi_7   7   =  1
multi_7 _ = 0

                                                                                                                                                                                                                                                                                                                                                                                                                     pgms/cap_lambda.hs                                                                                  0000644 0002433 0002424 00000001177 10421045270 013533  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   fatorial 0 = 1
fatorial n = fatorial (n-1) * n

g x = x / (fatorial x)

inc = \x -> (+) x 1


data Lam = Var Int | Comb Lam Lam | Abstr Int Lam

testa_liberdade a b|livre_ou_ligada a b = "A variavel eh livre"
                   |otherwise           = "A variavel eh ligada"
		   
livre_ou_ligada x (Var y)            =  x == y
livre_ou_ligada x (Comb lamb_1 lamb_2)  = livre_ou_ligada x lamb_1 ||
                                          livre_ou_ligada x lamb_2
livre_ou_ligada x (Abstr int_var lamb) = (x /=  int_var) && 
                                         (livre_ou_ligada x lamb)
livre_ou_ligada     _   _              = False

                                                                                                                                                                                                                                                                                                                                                                                                 pgms/cap_lambda.hs~                                                                                 0000644 0002433 0002424 00000001165 10414541164 013733  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   fatorial 0 = 1
fatorial n = fatorial (n-1) * n

g x = x / (fatorial x)

inc = \x -> (+) x 1


data Lam = Var Int | Comb Lam Lam | Abstr Int Lam

testa_liberdade a b|livre_ou_ligada a b = "A variavel eh livre"
                   |otherwise           = "A variavel eh ligada"
		   
livre_ou_ligada x (Var y)            =  x == y
livre_ou_ligada x (Comb rator rand)  = livre_ou_ligada x rator ||
                                       livre_ou_ligada x rand
livre_ou_ligada x (Abstr bndvar corpo) = (x /= bndvar) && 
                                         (livre_ou_ligada x corpo)
livre_ou_ligada     _   _              = False

                                                                                                                                                                                                                                                                                                                                                                                                           pgms/cap_listas.hs                                                                                  0000644 0002433 0002424 00000003006 10433523436 013613  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   import Observe


lista [] = True           -- fun��o 1
lista (a:x)= lista x     -- fun��o 2


primeiros  0  _      = []
primeiros  _  []     = []
primeiros  n  (a:x)  = a  :  primeiros (n-1)    x 

rem_ultimo  [ _ ]    =  []
rem_ultimo (a:corpo) = observe "a" a : observe "rem_ultimo" rem_ultimo corpo

constroi_lista = [ x*x | x <- [9 .. 39], par x]

par :: Int -> Bool
par x =  mod  x  2 == 0



l1 = [ a | a <-[9 .. 90],  a < 100]
l2 = ['a' .. 'g'] 


-- zipar :: [Char] -> [Int] -> [(Char, Int)]
zipar (a:b) (x:y) = (a,x) : zipar b y
zipar  _      _   = []


concatena :: [a] -> [a] -> [a]
concatena [ ]  ys     =  ys
concatena (x : xs) ys =  x : concatena  xs  ys

{-------------------------------------}

menor [a] = a
menor (a:c) | a < (menor c) = a
            | otherwise = menor c

remove_menor [a] = []
remove_menor (a:c)
             | a == (menor (a:c)) = c
             | otherwise = a : remove_menor c


ordena_lista [] = []
ordena_lista [a] = [a]
ordena_lista l   = (menor l) : (ordena_lista (remove_menor l))
{-------------------------------------------------------------}

menor_2 [a] = a
menor_2 [a,b]
        | a < b = a
	| otherwise = b
menor_2 (a:b:c) 
        | a < b = menor (a:c)
        | otherwise = menor (b:c)

remove_2 _ [] = []
remove_2 m [a] 
       | m == a = []
       | otherwise = error "O menor valor n�o est� na lista ! " 
remove_2 m (b:c)
           | m == b = c
	   | otherwise = b : remove_2  m  c


ordena_2 [] = []
ordena_2 [a] = [a]
ordena_2  l   = (menor_2 l) : ordena_2 (remove_2 (menor_2 l) l )
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          pgms/cap_listas.hs~                                                                                 0000644 0002433 0002424 00000002747 10433521407 014020  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   import Observe


lista [] = True           -- fun��o 1
lista (a:x)= lista x     -- fun��o 2


primeiros  0  _      = []
primeiros  _  []     = []
primeiros  n  (a:x)  = a  :  primeiros (n-1)    x 

rem_ultimo  [ _ ]    =  []
rem_ultimo (a:corpo) = observe "a" a : observe "rem_ultimo" rem_ultimo corpo

constroi_lista = [ x*x | x <- [9 .. 39], par x]

par :: Int -> Bool
par x =  mod  x  2 == 0



l1 = [ a | a <-[9 .. 90],  a < 100]
l2 = ['a' .. 'g'] 


-- zipar :: [Char] -> [Int] -> [(Char, Int)]
zipar (a:b) (x:y) = (a,x) : zipar b y
zipar  _      _   = []


concatena :: [a] -> [a] -> [a]
concatena [ ]  ys     =  ys
concatena (x : xs) ys =  x : concatena  xs  ys

{-------------------------------------}

menor [a] = a
menor (a:x) | a<(menor x) = a
            | otherwise = menor x

remove_menor [a] = []
remove_menor (a:x)| a == (menor (a:x)) = x
                  | otherwise = a : remove_menor x


ordena_lista [a] = [a]
ordena_lista l   = (menor l) : (ordena_lista (remove_menor l))
{-------------------------------------------------------------}


menor_2 [a] = a
menor_2 [a,b]
        | a < b = a
	| otherwise = b
menor_2 (a:b:c) 
        | a < b = menor (a:c)
        | otherwise = menor (b:c)

remove_2 _ [] = []
remove_2 m [a] 
       | m == a = []
       | otherwise = error "O menor valor n�o est� na lista ! " 
remove_2 m (b:c)
           | m == b = c
	   | otherwise = b : remove_2  m  c


ordena_2 [] = []
ordena_2 [a] = [a]
ordena_2  l   = (menor_2 l) : ordena_2 (remove_2 (menor_2 l) l )
                         pgms/cap_matematica_funcional.hs                                                                    0000644 0002433 0002424 00000000251 10421045275 016453  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   
soma x y = x + y
soma_3  x  y  z =  x + y + z
media_3 x y z = (soma_3 x y z) / 3
media_4 x y z w = soma_3 (soma x y) z w / 4


hipotenusa x y = sqrt (soma (x*x) (y*y))
                                                                                                                                                                                                                                                                                                                                                       pgms/cap_matrizes.hs                                                                                0000644 0002433 0002424 00000001431 10421045275 014147  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   import Array

vet :: Array Int Char
vet = array (1,6) [(1,'b'),(2,'r'),(3,'a'),(4,'s'),(5,'i'),(6,'l')]


quad_array :: Int -> Array Int Int
quad_array n = array (0,n) [(i,i*i) | i <-[0..n]]


histograma (inf,sup) xs = atualHist (array (inf,sup) [(i,0) | i <- [inf..sup]]) xs

atualHist hist []    = hist
atualHist hist (x:xs) = atualHist (hist //[(x, hist!x +1)]) xs


--funcao que calcula a determinante de uma matriz pela regra de Sarrus

determinante x = (x ! (1,1) * x ! (2,2) * x ! (3,3)) + (x ! (1,2) * x ! (2,3) * x ! (3,1)) +
                 (x ! (1,3) * x ! (2,1) * x ! (3,2)) - (x ! (3,1) * x ! (2,2) * x ! (1,3)) -
                 (x ! (3,2) * x ! (2,3) * x ! (1,1)) - (x ! (3,3) * x ! (2,1) * x ! (1,2))

matriz x = listArray ((1,1),(3,3)) x     --construtor da matriz
                                                                                                                                                                                                                                       pgms/cap_ordenacao.hs                                                                               0000644 0002433 0002424 00000004601 10421045275 014246  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   --Ordena��o por Sele��o

ordsel :: (Ord a) => [a] -> [a]
ordsel [] = []
ordsel x  = m : ordsel (remove m x)
              where
                m = minimo x

remove :: Ord a => a -> [a] -> [a]
remove m [] = []
remove m (x:xs)
                |x == m    = xs
                |otherwise = x : (remove m xs)

minimo :: Ord a => [a] -> a
minimo [xs] = xs
minimo (x:xs) = if  x < (minimo xs) then x else minimo xs

--

ordsel_2 :: (Ord a) => [a] -> [a]
ordsel_2 []     = []
ordsel_2 (x:xs) = m : (ordsel_2 resto)
              where
                (m,resto) = selec x xs

selec :: (Ord a) => a -> [a] -> (a,[a])
selec x []     = (x, [])
selec x (y:ys) = (sel , m:resto)
             where
               m = max x y
               (sel, resto) = selec (min x y) ys
	       
--

ordsel_3 :: (Ord a) => [a] -> [a]
ordsel_3 []     = []
ordsel_3 (x:xs) = menor_primeiro xs x []

menor_primeiro :: (Ord a) => [a] -> a -> [a] -> [a]
menor_primeiro [] m r    = m : (ordsel_3 r)
menor_primeiro(x:xs) m r = if x < m
                           then menor_primeiro xs x (m:r)
                           else menor_primeiro xs m (x:r)
			   
--Ordena��o por Inser��o
ordins :: (Ord a) => [a] -> [a]
ordins []     = []
ordins (a:xs) = inserir a (ordins xs)

inserir :: (Ord a) => a -> [a] -> [a]
inserir x xs = takeWhile ((>=) x) xs ++ [x] ++
               dropWhile ((>=) x) xs
	       
--

ordins_2 :: (Ord a) => [a] -> [a]
ordins_2 x = foldr inserir [] x

--

inserir_2 :: (Ord a) => a -> [a] -> [a]
inserir_2 chave []     = [chave]
inserir_2 chave (x:xs) | chave <= x = chave:x:xs
                       | otherwise  = x:(inserir_2 chave xs)
		       
ordins_3 :: (Ord a) => [a] -> [a]
ordins_3 []     = []
ordins_3 (a:xs) = inserir_2 a (ordins xs)

--MergeSort

mergeSort [] = []
mergeSort [x] = [x]
mergeSort xs |tamanho >= 1  = merge (mergeSort comeco) (mergeSort fim)
               where
                       tamanho  = length xs `div` 2
                       comeco   = take tamanho xs
                       fim      = drop tamanho xs

merge xs []     = xs
merge [] ys     = ys
merge (x : xs) (y : ys)
    | x <= y    = x : merge xs (y : ys)
    | x > y     = y : merge (x : xs) ys
    
--Quicksort

qsort []     = []
qsort (x:xs) = qsort elts_esquerdo_x ++ [x] ++ qsort elts_direito_x
         where
           elts_esquerdo_x   = [y | y <- xs, y < x]
           elts_direito_x    = [y | y <- xs, y >= x]                                                                                                                               pgms/cap_seq_acoes_arq_e_s.hs                                                                       0000644 0002433 0002424 00000005361 10426005667 015760  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   import IO
olaMundo :: IO ()
olaMundo = putStr "Ol� mundo!"
num_float :: Float
num_float = 3.4567
num_double :: Double
num_double = 9.87654
imprime :: Show a => a -> IO ()
imprime x = print x


le_Int :: IO Int
le_Int = do linha <- getLine
            return (read linha :: Int)

le_Float :: IO Float
le_Float = do linha <- getLine
              return (read linha :: Float)

soma_Int :: IO Int
soma_Int = do linha_1 <- le_Int
              linha_2 <- le_Int
 	      return (linha_1 + linha_2)
	      
soma_Interage :: IO ()
soma_Interage = do putStrLn "Entre com os n�meros a serem somados:"
                   sum <- soma_Int
	 	   putStrLn "A soma �"
		   print sum
	      


w_arq_h  :: IO ()
w_arq_h =  do 
           fh <- openFile   "teste_1.txt"  WriteMode
           hPutStr  fh "Escrevendo no arquivo usando handles ! \n"
	   putStr   "Escrita com sucesso !"
	   hFlush   fh
	   hClose   fh


r_arq_h :: IO ()
r_arq_h = do 
          fh <- openFile   "teste_1.txt"   ReadMode
          conteudo <-  hGetContents   fh
	  putStrLn   conteudo
	  putStr     "Apresentada leitura do conteudo !" 
          hClose     fh


a_arq_h  :: IO ()
a_arq_h =  do
           fh <- openFile   "teste_1.txt"  AppendMode
           hPutStr  fh "Escrevendo no final deste arquivo ... \n"
           putStr   "Anexado com sucesso !"
	   hFlush   fh
	   hClose   fh
				 

w_direta :: IO ()
w_direta = do 
          writeFile   "teste_2.txt" "Escrevendo diretamente  no arquivo \n "
          putStr      " J� escrito algo em teste_2.txt"

r_direta :: IO ()
r_direta  = do 
            conteudo <- readFile "teste_2.txt"
            putStr     conteudo
	    putStr    " Sem mais nada em teste_2.txt"
	       

a_direta :: IO ()
a_direta = do
           appendFile   "teste_2.txt"  "\n Anexando no final do arquivo \n"
	   putStr        " ... Anexado OK ..."

----------------------------------------------------------------------------
le_imprime :: IO () 
le_imprime = do 
               {entrada <- getLine;    -- in�cio do la�o
                if ( entrada  == [] )  -- teste condicional
		      then return ()
                      else  do {putStrLn   entrada; 
                                le_imprime; }      
		   } -- fim do la�o	
----------------------------------------------------------------------------	   
le_arquivo :: IO ()
le_arquivo =
 do
  { catch (testa_arquivo) trataErro;} 
    where  
     testa_arquivo   = do
        {conteudo <- readFile  "dados_2.txt";
	 putStr "Leitura do arquivo com sucesso!!!";
         return (read conteudo);
         }
     trataErro  erro = if IO.isDoesNotExistError erro
     	  then do
	{ putStr "Gerou uma exce��o. Um arquivo novo foi criado";
	  writeFile  "dados_2.txt"   "Mensagem da exce��o!!";
        }
        else	ioError erro
	  
	  
	  
	  




                                                                                                                                                                                                                                                                               pgms/cap_seq_acoes_arq_e_s.hs~                                                                      0000644 0002433 0002424 00000005370 10426005667 016156  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   import IO
olaMundo :: IO ()
olaMundo = putStr "Ol� mundo!"
num_float :: Float
num_float = 3.4567
num_double :: Double
num_double = 9.87654
imprime :: Show a => a -> IO ()
imprime x = print x


le_Int :: IO Int
le_Int = do linha <- getLine
            return (read linha :: Int)

le_Float :: IO Float
le_Float = do linha <- getLine
              return (read linha :: Float)

soma_Int :: IO Int
soma_Int = do linha_1 <- le_Int
              linha_2 <- le_Int
 	      return (linha_1 + linha_2)
	      
soma_Interage :: IO ()
soma_Interage = do putStrLn "Entre com os n�meros a serem somados:"
                   sum <- soma_Int
	 	   putStrLn "A soma �"
		   print sum
	      


w_arq_h  :: IO ()
w_arq_h =  do 
           fh <- openFile   "teste_1.txt"  WriteMode
           hPutStr  fh "Escrevendo no arquivo usando handles ! \n"
	   putStr   "Escrita com sucesso !"
	   hFlush   fh
	   hClose   fh


r_arq_h :: IO ()
r_arq_h = do 
          fh <- openFile   "teste_1.txt"   ReadMode
          conteudo <-  hGetContents   fh
	  putStrLn   conteudo
	  putStr     "Apresentada leitura do conteudo !" 
          hClose     fh


a_arq_h  :: IO ()
a_arq_h =  do
           fh <- openFile   "teste_1.txt"  AppendMode
           hPutStr  fh "Escrevendo no final deste arquivo ... \n"
           putStr   "Anexado com sucesso !"
	   hFlush   fh
	   hClose   fh
				 

w_direta :: IO ()
w_direta = do 
          writeFile   "teste_2.txt" "Escrevendo diretamente  no arquivo \n "
          putStr      " J� escrito algo em teste_2.txt"

r_direta :: IO ()
r_direta  = do 
            conteudo <- readFile "teste_2.txt"
            putStr     conteudo
	    putStr    " Sem mais nada em teste_2.txt"
	       

a_direta :: IO ()
a_direta = do
           appendFile   "teste_2.txt"  "\n Anexando no final do arquivo \n"
	   putStr        " ... Anexado OK ..."

----------------------------------------------------------------------------
le_imprime :: IO () 
le_imprime = do 
               {entrada <- getLine;    -- in�cio do la�o
                if ( entrada  == [] )  -- teste condicional
		      then return ()
                      else  do {putStrLn   entrada; 
                                le_imprime; }      
		   } -- fim do la�o	
----------------------------------------------------------------------------	   
le_arquivo :: IO ()
le_arquivo =
 do
  { catch (testa_arquivo) trataErro;} 
    where  
     testa_arquivo   = do
        {conteudo <- readFile  "dados_2.txt";
	 putStr "Leitura do arquivo com sucesso!!!";
         return (read conteudo);
         }
     trataErro  erro   =   if  IO.isDoesNotExistError erro
     			then do
	{ putStr "Gerou uma exce��o. Um arquivo novo foi criado";
	  writeFile  "dados_2.txt"   "Mensagem pela exce��o!!";
        }
        else	ioError erro
	  
	  
	  
	  




                                                                                                                                                                                                                                                                        pgms/cap_tipos_aux.hs                                                                               0000644 0002433 0002424 00000001750 10507572040 014330  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   data Nova_Cor = Vermelho | Azul | Amarelo | Rosa | Roxo |
                               Verde | Lilaz
                              deriving (Eq,Show)

combinacao_Cor :: Nova_Cor -> Nova_Cor -> Nova_Cor
combinacao_Cor  Azul    Amarelo    =  Verde
combinacao_Cor  Amarelo  Azul    =  Verde
combinacao_Cor  Verde   Vermelho    = Lilaz
combinacao_Cor  Verde   Azul    = Amarelo
combinacao_Cor   Azul    _        =  Lilaz
combinacao_Cor   _        Vermelho  =  Rosa
combinacao_Cor  _        _       = error  "Uma combina��o qualquer"
{--
Main> combinacao_Cor   Azul        Vermelho 
Lilaz
Main> combinacao_Cor   Azul  Lilaz          
Lilaz
Main> combinacao_Cor   Azul  Vermelho 
Lilaz
Main> combinacao_Cor   Verde   Vermelho 
Lilaz
Main> combinacao_Cor   Lilaz   Vermelho 
Rosa
Main> combinacao_Cor   Vermelho   Vermelho 
Rosa
Main> :r
Main> combinacao_Cor   Beje   Salmao
ERROR - Undefined constructor function "Salmao"
Main> combinacao_Cor   Rosa   Lilaz 

Program error: Uma combina��o qualquer

--}
                        pgms/cap_tipos_aux.hs~                                                                              0000644 0002433 0002424 00000001036 10507567412 014532  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   data Nova_Cor = Vermelho | Azul | Amarelo | Rosa | Roxo |
                               Verde | Lilaz
                              deriving (Eq,Show)

combinacao_Cor :: Nova_Cor -> Nova_Cor -> Nova_Cor
combinacao_Cor  Azul    Amarelo    =  Verde
combinacao_Cor  Amarelo  Azul    =  Verde
combinacao_Cor  Verde   Vermelho    = Lilaz
combinacao_Cor  Verde   Azul    = Amarelo
combinacao_Cor   Azul    _        =  Lilaz
combinacao_Cor   _        Vermelho  =  Rosa
combinacao_Cor  _        _       = error  "Uma combina��o qualquer"
{--



--}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  pgms/cap_tipos.hs                                                                                   0000644 0002433 0002424 00000002117 10507563553 013462  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   import Char
-- import Numeric

f_pot ::  Float -> Int -> Float
f_pot x n = x^n

dif :: Int
dif = ord 'a' - ord 'A'  -- 32

maiusc_Min :: Char -> Char
maiusc_Min ch = chr ((ord ch) + dif)

minusc_Mai :: Char -> Char
minusc_Mai ch = chr ((ord ch) - dif)

conv x
   | x >= 'a' && x <= 'z' = minusc_Mai x
   | x >= 'A' && x <= 'Z' = maiusc_Min x
   | otherwise = error " n�o � uma letra entre A e z  ... "




div_1 a b = a / b

div_2 a b = (fromIntegral a) / b


div_3 :: Float -> Float -> Float
div_3 a b =  a / b

data Cor = Verde | Azul | Amarelo
     deriving (Eq,Show)

corBasica :: Cor -> Bool
corBasica c = (c == Verde) || (c == Azul || (c == Amarelo)

{-- 

data Nova_Cor = Vermelho | Azul | Amarelo | Rosa | Roxo |
  Verde | Lilaz
  deriving (Eq,Show)

combinacao_Cor :: Nova_Cor -> Nova_Cor -> Nova_Cor
combinacao_Cor  Vermelho Azul    = Roxo
combinacao_Cor  Azul Amarelo     = Verde
combinacao_Cor  Amarelo  Azul    = Verde
combinacao_Cor  _        _       = error  "N�o existe essa combinacao"

infixl 7 &&&

(&&&) :: Int -> Int -> Int
a &&& b
    | a > b        = a
    | otherwise    = b
--}
                                                                                                                                                                                                                                                                                                                                                                                                                                                 pgms/cap_tipos.hs~                                                                                  0000644 0002433 0002424 00000002117 10507563532 013655  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   import Char
-- import Numeric

f_pot ::  Float -> Int -> Float
f_pot x n = x^n

dif :: Int
dif = ord 'a' - ord 'A'  -- 32

maiusc_Min :: Char -> Char
maiusc_Min ch = chr ((ord ch) + dif)

minusc_Mai :: Char -> Char
minusc_Mai ch = chr ((ord ch) - dif)

conv x
   | x >= 'a' && x <= 'z' = minusc_Mai x
   | x >= 'A' && x <= 'Z' = maiusc_Min x
   | otherwise = error " n�o � uma letra entre A e z  ... "




div_1 a b = a / b

div_2 a b = (fromIntegral a) / b


div_3 :: Float -> Float -> Float
div_3 a b =  a / b

data Cor = Verde | Azul | Amarelo
     deriving (Eq,Show)

corBasica :: Cor -> Bool
corBasica c = (c == Verde) || (c == Azul || (c == Amarelo)

{-- 

data Nova_Cor = Vermelho | Azul | Amarelo | Rosa | Roxo |
  Verde | Lilaz
  deriving (Eq,Show)

combinacao_Cor :: Nova_Cor -> Nova_Cor -> Nova_Cor
combinacao_Cor  Vermelho Azul    = Roxo
combinacao_Cor  Azul Amarelo     = Verde
combinacao_Cor  Amarelo  Azul    = Verde
combinacao_Cor  _        _       = error  "N�o existe essa combinacao"

infixl 7 &&&

(&&&) :: Int -> Int -> Int
a &&& b
    | a > b        = a
    | otherwise    = b
--}
                                                                                                                                                                                                                                                                                                                                                                                                                                                 pgms/cap_tuplas_exerc_resolv.hs                                                                     0000644 0002433 0002424 00000004421 10422442010 016370  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   import Char

type Meu_tipo = (String, Float, Char)
pessoas :: Float -> (String, Float, Char)
-- retorna uma tupla_3 a partir do rg passado
pessoas rg
           | rg == 1 = ("Joao Silva", 12, 'm')
           | rg == 2 = ("Jonas Souza", 81, 'm')
           | rg == 3 = ("Joice Silva", 21, 'f')
           | rg == 4 = ("Janete Souza", 55, 'f')
           | rg == 5 = ("Jocileide Strauss", 21, 'f')
           | otherwise = ("Nao ha ninguem mais", 0 , 'x')

--QUESTAO 5  - A
-- retorna a tupla_3 referente a pessoa de menor idade ate o valor x

questao_5_a :: Float -> (String, Float, Char)
questao_5_a x 
  | x==1 = pessoas 1
  | otherwise = menor ( pessoas x) (questao_5_a (x-1))

menor :: (String, Float, Char) -> (String, Float, Char) -> (String, Float, Char)
menor x y
  | x1 <= x2 = x
  | otherwise = y
  where
  x1 = idade x
  x2 = idade y

idade :: (String, Float, Char) -> Float
idade (x, y, z) = y

{-
Gabarito> questao_5_a 3
("Joao Silva",12.0,'m')
Gabarito> 
-}



--QUESTAO 5  - B
-- retorna a idade media de todas as pessoas ate um rg passado como parametro 
-- da fun��o

questao_5_b :: Float -> Float

questao_5_b x = (soma_idade x)/x
   

soma_idade :: Float -> Float
  
soma_idade x
  | x == 1  = idade (pessoas 1)
  | otherwise = idade (pessoas x) + (soma_idade (x-1))

{-
Gabarito> questao_5_b 6  
1698.17 ...... troquei 99999 por 0 aqui....
Gabarito> questao_5_b 6
31.6667
Gabarito>
-}

--QUESTAO 5  - C
-- retorna o n�mero de pessoas do sexo masculino 

questao_5_c :: Float -> Float

questao_5_c x = conta x 0

conta :: Float -> Float -> Float

conta x cont   | x == 0 = cont
                     | sex (pessoas x) /= 'm' = conta (x-1) cont
                     | otherwise = conta (x-1) (cont+1) 

sex :: (String, Float, Char) -> Char
sex (x, y, z) = z

{-
Gabarito> questao_5_c 6
2.0
Gabarito>
-}

--QUESTAO 5  - D
-- retorna o n�mero de registro da pessoa de maior idade

maior :: Float -> Float -> Float
maior x y
  | x1 >= x2 = x
  | otherwise = y
  where
  x1 = idade (pessoas x)
  x2 = idade (pessoas y)

questao_5_d :: Float -> Float

questao_5_d x
  | x==1 = x
  | otherwise = maior x (questao_5_d (x-1))

{-
Gabarito> questao_5_d 6
6.0
Gabarito> questao_5_d 5
2.0
Gabarito> 
-}


                                                                                                                                                                                                                                               pgms/cap_tuplas_exerc_resolv.hs~                                                                    0000644 0002433 0002424 00000013030 10422441603 016571  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   module Gabarito where
import Char


-- primeira questao da prova 

-- dados tres valores diferentes entre si, a fun��o abaixo retorna uma tupla_3
-- contendo em forma decrescente os tres valores
-- caso seja fornecido dados iguais, a fun��o acusa erro.

questao_1 :: Int -> Int -> Int -> (Int, Int, Int)

questao_1 x y z
  | (x>y) && (x>z) && (y>z) = (x,y,z)
  | (x>y) && (x>z) && (y<z) = (x,z,y)
  | (y>x) && (y>z) && (x>z) = (y,x,z)
  | (y>x) && (y>z) && (x<z) = (y,z,x)
  | (z>x) && (z>y) && (x>y) = (z,x,y)
  | (z>x) && (z>y) && (x<y) = (z,y,x)
  | otherwise = error "possui valores iguais"

{-
Gabarito> questao_1 5 (-8) 0
(5,0,-8)
Gabarito> 
-}

-- segunda questao da prova 

-- passado como parametro inicial um caracter , a fun��o retorna uma tupla_3
-- contendo o caracter em minusculo, em maiusculo e o seu respectivo
-- valor na tabela ASCII

-- para a utiliza�ao da fun�ao ord foi necessario o import de Char
questao_2 :: Char -> (Char, Char, Int)

questao_2 x = (a, b, c)
  where
  a  | isLower x == True = x
     | otherwise = toLower x
-- caso o parametro esteja em maiusculo ele converte para minusculo
  b  | isUpper x == True = x
     | otherwise = toUpper x
-- caso o parametro esteja em minusculo ele converte para maiusculo
  c  = ord (x)
-- busca o respectivo valor na tabela ASCII, do parametro inicial

{-
Gabarito> questao_2 'h'     
('h','H',104)
Gabarito> 
-}

 -- terceira questao da prova 

-- reutiliza a fun�ao implementada na primeira questao da prova
--questao_1 :: Int -> Int -> Int -> (Int, Int, Int)

meio :: (Int, Int, Int) -> Int
-- passando uma tupla_3 ja ordenada, retorna o valor do meio
meio (x, y, z) = y

questao_3_para_3 :: Int -> Int -> Int -> Int
-- passados tres valores, a fun�ao deve retornar o valor do meio, sendo os 
-- valores ja ordenados
-- primeiro ordena os valores, depois retorna o valor do meio
questao_3_para_3 x y z = meio ( questao_1 x y z)

{-
Gabarito> questao_3_para_3 7 9 8
8
Gabarito> questao_3_para_3 7 (-9) 88
7
-}
estende_ideia_para_5 x y z w k = questao_3_para_3 x y (questao_3_para_3 z w k)
{-
Gabarito> estende_ideia_para_5 7 (-9) 88 2 400
7
Gabarito> estende_ideia_para_5 7 (-9) 88 2 (-400)
2
-}

-- quarta questao da prova 

questao_4 :: Float -> Float -> Float -> Int
-- calcula a media e chama a fun�ao quantos
questao_4 x y z = quantos a x y z
  where
  a = (x+y+z)/3


quantos :: Float -> Float -> Float -> Float -> Int
-- retorna quantos dos tres valores passados estao acima da media
quantos a x y z
  | (x==y) && (x==z) = 0
  | ((a<x) && (a<y))||((a<x) && (a<z))||((a<y) && (a<z)) = 2
  | otherwise = 1


{- 
Gabarito> questao_4 4 6 4
1
Gabarito> questao_4 4 6 6
2
Gabarito> questao_4 6 6 6
0
Gabarito>
-}


 -- segunda questao da prova 

pessoas :: Float -> (String, Float, Char)
-- retorna uma tupla_3 a partir do rg passado
pessoas rg
           | rg == 1 = ("Joao Silva", 12, 'm')
           | rg == 2 = ("Jonas Souza", 81, 'm')
           | rg == 3 = ("Joice Silva", 21, 'f')
           | rg == 4 = ("Janete Souza", 55, 'f')
           | rg == 5 = ("Jocileide Strauss", 21, 'f')
           | otherwise = ("Nao ha ninguem mais", 0 , 'x')

--QUESTAO 5  - A
-- retorna a tupla_3 referente a pessoa de menor idade ate o valor x

questao_5_a :: Float -> (String, Float, Char)
questao_5_a x 
  | x==1 = pessoas 1
  | otherwise = menor ( pessoas x) (questao_5_a (x-1))

menor :: (String, Float, Char) -> (String, Float, Char) -> (String, Float, Char)
menor x y
  | x1 <= x2 = x
  | otherwise = y
  where
  x1 = idade x
  x2 = idade y

idade :: (String, Float, Char) -> Float
idade (x, y, z) = y

{-
Gabarito> questao_5_a 3
("Joao Silva",12.0,'m')
Gabarito> 
-}



--QUESTAO 5  - B
-- retorna a idade media de todas as pessoas ate um rg passado como parametro 
-- da fun��o

questao_5_b :: Float -> Float

questao_5_b x = (soma_idade x)/x
   

soma_idade :: Float -> Float
  
soma_idade x
  | x == 1  = idade (pessoas 1)
  | otherwise = idade (pessoas x) + (soma_idade (x-1))

{-
Gabarito> questao_5_b 6  
1698.17 ...... troquei 99999 por 0 aqui....
Gabarito> questao_5_b 6
31.6667
Gabarito>
-}

--QUESTAO 5  - C
-- retorna o n�mero de pessoas do sexo masculino 

questao_5_c :: Float -> Float

questao_5_c x = conta x 0

conta :: Float -> Float -> Float

conta x cont   | x == 0 = cont
                     | sex (pessoas x) /= 'm' = conta (x-1) cont
                     | otherwise = conta (x-1) (cont+1) 

sex :: (String, Float, Char) -> Char
sex (x, y, z) = z

{-
Gabarito> questao_5_c 6
2.0
Gabarito>
-}

--QUESTAO 5  - D
-- retorna o n�mero de registro da pessoa de maior idade

maior :: Float -> Float -> Float
maior x y
  | x1 >= x2 = x
  | otherwise = y
  where
  x1 = idade (pessoas x)
  x2 = idade (pessoas y)

questao_5_d :: Float -> Float

questao_5_d x
  | x==1 = x
  | otherwise = maior x (questao_5_d (x-1))

{-
Gabarito> questao_5_d 6
6.0
Gabarito> questao_5_d 5
2.0
Gabarito> 
-}


-- sexta questao da prova 

questao_6 :: Int -> Int -> Int 
som :: Int -> Int -> Int -> Int

-- caso os parametros passados estejam corretos ( por exemplo um valor negativo
-- ou um valor para calcular os multiplos maior do que o de condi�ao de parada)
-- chama a fun�ao som que � recursiva
questao_6 x m
  | x <= 0    =  0
  | m <= 0    =  0
  | m < x     =  0
  | m == x    =  x
  | otherwise =  x + som x (x+x) m


som a x m
  | x > m     =  0 
  | otherwise = x + som a (x+a) m

{-
Gabarito> questao_6 7 80
462
Gabarito> 
-}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        pgms/cap_tuplas.hs                                                                                  0000644 0002433 0002424 00000002310 10422434121 013607  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   -- Ex1
type Seq_Caract = String     -- Uma sequ�ncia de caracteres
type Nomes = (Seq_Caract, Seq_Caract, Seq_Caract, Seq_Caract)

f_nomes_est = ("Inverno", "Outono", "Primavera", "Verao")

selec_inv  ( x , _ , _ , _ ) = x
selec_outono  ( _ , x , _ , _ ) = x
selec_prima  ( _ , _ , x , _ ) = x
selec_verao  ( _ , _ , _ , x ) = x

{-
Main> f_nomes_est
("Inverno","Outono","Primavera","Verao")
Main> selec_inv f_nomes_est
"Inverno"
Main> selec_verao f_nomes_est
"Verao"
Main> selec_outono ("Joao", "Pedro", "Augusto", "Marcio")
"Pedro"

-}
-- Ex 2
type Peso = Float
type Idade = Int
type Pessoa = (String , Idade , Peso , String)

f_joao, f_maria :: Pessoa
f_joao = ("Joao Pedro", 19, 75.789 ,"Basquete")
f_maria  = ("Maria Fernanda", 18, 65.432, "Volei")

selec_nome :: Pessoa -> String
selec_idade :: Pessoa -> Idade
selec_peso :: Pessoa -> Peso
selec_esporte :: Pessoa -> String

selec_nome (n,i,p,e) = n
selec_idade (n,i,p,e) = i
selec_peso (n,i,p,e) = p
selec_esporte (n,i,p,e) = e

{-
Main> f_joao
("Joao Pedro",19,75.789,"Basquete")
Main> f_maria
("Maria Fernanda",18,65.432,"Volei")
Main> selec_nome f_joao
"Joao Pedro"
Main> selec_peso f_maria
65.432
Main> selec_idade f_joao
19
Main> selec_esporte f_maria
"Volei"
-}
                                                                                                                                                                                                                                                                                                                        pgms/cavalo.hs                                                                                      0000644 0002433 0002424 00000016456 10563467343 012763  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   --------------------------------------------------------------------
--
--   Pictures.hs
--
--   Simon Thompson
--
--   June 1998
--   Last modified 28 September 2000
--
-- An implementation of a type of rectangular pictures using lists of
-- lists of characters.
-- Alterado:: CCS ... nov/2002
--------------------------------------------------------------------

-- The basics
-- ^^^^^^^^^^

module Cavalos where

type Picture = [[Char]]

-- The example used in Craft2e: a polygon which looks like a horse. Here
-- taken to be a 16 by 12 rectangle.

horse :: Picture

horse = [".......##...",
         ".....##..#..",
         "...##.....#.",
         "..#.......#.",
         "..#...#...#.",
         "..#...###.#.",
         ".#....#..##.",
         "..#...#.....",
         "...#...#....",
         "....#..#....",
         ".....#.#....",
         "......##...."]

-- A completely white picture.

white :: Picture

white = ["............",
         "............",
         "............",
         "............",
         "............",
         "............",
         "............",
         "............",
         "............",
         "............",
         "............",
         "............"]

-- Small black and white squares

sb, sw :: Picture

sb = ["##","##"]
sw = ["..",".."]

-- Getting a picture onto the screen.

printPicture :: Picture -> IO ()

printPicture = putStr . concat . map (++"\n")

{- cuidar....
concat [ [3 .. 7] ]
[3,4,5,6,7]  
-}

-- reescrevendo a printPicture

imp_cavalo_3  x = putStr (uma_soh_lista (mapear (concatena "\n" ) x ))

imp_cavalo_4   = putStr . uma_soh_lista . mapear (concatena  "\n")   


-- convencional...
imp_cavalo [] = putStr "................."
imp_cavalo (c:resto) = do {
						    putStr c;
						    putStr "\n";
						    imp_cavalo resto
						   } 

-- Transformations of pictures.
-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^

-- Reflection in a vertical mirror.

flipV :: Picture -> Picture

flipV = map reverse
vira_V cavalo = xmapear inverte_1 cavalo

-- Reflection in a horizontal mirror.

flipH :: Picture -> Picture
flipH = reverse
vira_H cavalo = inverte_1 cavalo


-- Rotation through 180 degrees, by composing vertical and horizontal
-- reflection. Note that it can also be done by flipV.flipH, and that we
-- can prove equality of the two functions.

rotate :: Picture -> Picture
rotate = flipH . flipV

--  O operador ponto "." (ver o rotate acima), � equivalente h�:

rotaciona :: Picture -> Picture
rotaciona cavalo = flipH (flipV cavalo)
rotac_2   cavalo = vira_H (vira_V cavalo)
rotac_3   cavalo = vira_V (vira_H cavalo)


-- One picture above another. To maintain the rectangular property,
-- the pictures need to have the same width.

above :: Picture -> Picture -> Picture
above = (++)
um_sobre_outro x = append x x -- simples concatena��o de duas listas....

-- One picture next to another. To maintain the rectangular property,
-- the pictures need to have the same height.

sideBySide :: Picture -> Picture -> Picture

sideBySide = zipWith (++)
lado_a_lado x =  aplica_f_sobre append x x

-- Superimose one picture above another. Assume the pictures to be the same
-- size. The individual characters are combined using the combine function.

superimpose :: Picture -> Picture -> Picture
superimpose = zipWith (zipWith combine) --  dois argumentos
sobre_poe x =  aplica_f_sobre (aplica_f_sobre combine)  x


frente_a_frente horse cav_vert  = aplica_f_sobre (aplica_f_sobre combine) horse cav_vert
cav_vert = xmapear reverse horse


x_sobre_ok = imp_cavalo (superimpose horse (flipV horse))

-- For the result to be '.' both components have to the '.'; otherwise
-- get the '#' character.

combine :: Char -> Char -> Char
combine topCh bottomCh
  = if (topCh == '.' && bottomCh == '.')
    then '.'
    else '#'


-- Inverting the colours in a picture; done pointwise by invert...
invertColour :: Picture -> Picture
invertColour = map (map invert)
troca_cor x = xmapear (xmapear invert) x

--troca_cor2 x = xmapear invert2 x

-- ... which works by making the result '.' unless the input is '.'.

invert :: Char -> Char
invert ch = if ch == '.' then '#' else '.'

--invert2 :: String -> String
--invert2 str = if str == "." then "#" else "."

concatena = append
append :: [a] -> [a] -> [a]
append [ ]  ys     =  ys
append (x : xs) ys =  x : append xs ys

uma_soh_lista  xs = foldr (++) [] xs

inverte_1 :: [a] -> [a]
inverte_1 []     =  []
inverte_1 (x:xs) =  append (inverte_1 xs) [x]

{-
  inverte_1 [4 .. 8]
  [8,7,6,5,4] 
-}


aplica_f_sobre  :: (a->b->c) -> [a]->[b]->[c]
aplica_f_sobre f (a:as) (b:bs)   = f a b : aplica_f_sobre f as bs
aplica_f_sobre _ _      _        = []

dobrar :: (a -> [b] -> [b]) -> c -> [a] -> [b]  
dobrar f e []     = []				
dobrar f e (x:xs) = f x (dobrar f e xs)

mapear = xmapear -- para o livro
xmapear :: (a -> b) -> [a] -> [b]    
xmapear f []     =  []
xmapear f (x:xs) = f x : xmapear f xs  

{-
imp_cavalo horse
.......##...
.....##..#..
...##.....#.
..#.......#.
..#...#...#.
..#...###.#.
.#....#..##.
..#...#.....
...#...#....
....#..#....
.....#.#....
......##....

 ...acabou....   
 -}

  
{-
Pictures> printPicture horse    

.......##...
.....##..#..
...##.....#.
..#.......#.
..#...#...#.
..#...###.#.
.#....#..##.
..#...#.....
...#...#....
....#..#....
.....#.#....
......##.... 



Pictures> printPicture (flipH horse)
......##....
.....#.#....
....#..#....
...#...#....
..#...#.....
.#....#..##.
..#...###.#.
..#...#...#.
..#.......#.
...##.....#.
.....##..#..
.......##...

Pictures> printPicture (flipV horse)
...##.......
..#..##.....
.#.....##...
.#.......#..
.#...#...#..
.#.###...#..
.##..#....#.
.....#...#..
....#...#...
....#..#....
....#.#.....
....##......

printPicture (rotaciona  horse)
....##......
....#.#.....
....#..#....
....#...#...
.....#...#..
.##..#....#.
.#.###...#..
.#...#...#..
.#.......#..
.#.....##...
..#..##.....
...##.......

Pictures> printPicture (rotate  horse)
....##......
....#.#.....
....#..#....
....#...#...
.....#...#..
.##..#....#.
.#.###...#..
.#...#...#..
.#.......#..
.#.....##...
..#..##.....
...##.......

Pictures>    

imp_cavalo (lado_a_lado horse)
.......##..........##...
.....##..#.......##..#..
...##.....#....##.....#.
..#.......#...#.......#.
..#...#...#...#...#...#.
..#...###.#...#...###.#.
.#....#..##..#....#..##.
..#...#.......#...#.....
...#...#.......#...#....
....#..#........#..#....
.....#.#.........#.#....
......##..........##....

 acabou....               
Pictures> imp_cavalo(rotac_3 horse)
....##......
....#.#.....
....#..#....
....#...#...
.....#...#..
.##..#....#.
.#.###...#..
.#...#...#..
.#.......#..
.#.....##...
..#..##.....
...##.......
.................
Pictures> imp_cavalo(rotac_2 horse)
....##......
....#.#.....
....#..#....
....#...#...
.....#...#..
.##..#....#.
.#.###...#..
.#...#...#..
.#.......#..
.#.....##...
..#..##.....
...##.......
.................
Pictures>      
 imp_cavalo(troca_cor horse)
#######..###
#####..##.##
###..#####.#
##.#######.#
##.###.###.#
##.###...#.#
#.####.##..#
##.###.#####
###.###.####
####.##.####
#####.#.####
######..####
................. 
-}
                                                                                                                                                                                                                  pgms/cavalo.hs~                                                                                     0000644 0002433 0002424 00000016631 10563467260 013152  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   --------------------------------------------------------------------
--
--   Pictures.hs
--
--   Simon Thompson
--
--   June 1998
--   Last modified 28 September 2000
--
-- An implementation of a type of rectangular pictures using lists of
-- lists of characters.
-- Alterado:: CCS ... nov/2002
--------------------------------------------------------------------

-- The basics
-- ^^^^^^^^^^

module Cavalos where

type Picture = [[Char]]

-- The example used in Craft2e: a polygon which looks like a horse. Here
-- taken to be a 16 by 12 rectangle.

horse :: Picture

horse = [".......##...",
         ".....##..#..",
         "...##.....#.",
         "..#.......#.",
         "..#...#...#.",
         "..#...###.#.",
         ".#....#..##.",
         "..#...#.....",
         "...#...#....",
         "....#..#....",
         ".....#.#....",
         "......##...."]

-- A completely white picture.

white :: Picture

white = ["............",
         "............",
         "............",
         "............",
         "............",
         "............",
         "............",
         "............",
         "............",
         "............",
         "............",
         "............"]

-- Small black and white squares

sb, sw :: Picture

sb = ["##","##"]
sw = ["..",".."]

-- Getting a picture onto the screen.

printPicture :: Picture -> IO ()

printPicture = putStr . concat . map (++"\n")

{- cuidar....
concat [ [3 .. 7] ]
[3,4,5,6,7]  
-}

-- reescrevendo a printPicture

imp_cavalo_3  x = putStr (uma_soh_lista (mapear (concatena "\n" ) x ))

imp_cavalo_4   = putStr . uma_soh_lista . mapear (concatena  "\n")   


-- convencional...
imp_cavalo [] = putStr "................."
imp_cavalo (c:resto) = do {
						    putStr c;
						    putStr "\n";
						    imp_cavalo resto
						   } 

-- Transformations of pictures.
-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^

-- Reflection in a vertical mirror.

flipV :: Picture -> Picture

flipV = map reverse
vira_V cavalo = xmapear inverte_1 cavalo

-- Reflection in a horizontal mirror.

flipH :: Picture -> Picture
flipH = reverse
vira_H cavalo = inverte_1 cavalo


-- Rotation through 180 degrees, by composing vertical and horizontal
-- reflection. Note that it can also be done by flipV.flipH, and that we
-- can prove equality of the two functions.

rotate :: Picture -> Picture
rotate = flipH . flipV

--  O operador ponto "." (ver o rotate acima), � equivalente h�:

rotaciona :: Picture -> Picture
rotaciona cavalo = flipH (flipV cavalo)
rotac_2   cavalo = vira_H (vira_V cavalo)
rotac_3   cavalo = vira_V (vira_H cavalo)


-- One picture above another. To maintain the rectangular property,
-- the pictures need to have the same width.

above :: Picture -> Picture -> Picture
above = (++)
um_sobre_outro x = append x x -- simples concatena��o de duas listas....

-- One picture next to another. To maintain the rectangular property,
-- the pictures need to have the same height.

sideBySide :: Picture -> Picture -> Picture

sideBySide = zipWith (++)
lado_a_lado x =  aplica_f_sobre append x x

-- Superimose one picture above another. Assume the pictures to be the same
-- size. The individual characters are combined using the combine function.

superimpose :: Picture -> Picture -> Picture
superimpose = zipWith (zipWith combine) --  dois argumentos
sobre_poe x =  aplica_f_sobre (aplica_f_sobre combine)  x


frente_a_frente horse cav_vert  = aplica_f_sobre (aplica_f_sobre combine) horse cav_vert
cav_vert = xmapear reverse horse


x_sobre_ok = imp_cavalo (superimpose horse (flipV horse))

-- For the result to be '.' both components have to the '.'; otherwise
-- get the '#' character.

combine :: Char -> Char -> Char
combine topCh bottomCh
  = if (topCh == '.' && bottomCh == '.')
    then '.'
    else '#'


-- Inverting the colours in a picture; done pointwise by invert...
invertColour :: Picture -> Picture
invertColour = map (map invert)
troca_cor x = xmapear (xmapear invert) x

--troca_cor2 x = xmapear invert2 x

-- ... which works by making the result '.' unless the input is '.'.

invert :: Char -> Char
invert ch = if ch == '.' then '#' else '.'

--invert2 :: String -> String
--invert2 str = if str == "." then "#" else "."

concatena = append
append :: [a] -> [a] -> [a]
append [ ]  ys     =  ys
append (x : xs) ys =  x : append xs ys

uma_soh_lista  xs = foldr (++) [] xs

uma_lista_str [a] = a
uma_lista_str ( a : b) = a :  uma_lista_str b
     concat xs = foldr (++) [] xs

inverte_1 :: [a] -> [a]
inverte_1 []     =  []
inverte_1 (x:xs) =  append (inverte_1 xs) [x]

{-
  inverte_1 [4 .. 8]
  [8,7,6,5,4] 
-}


aplica_f_sobre  :: (a->b->c) -> [a]->[b]->[c]
aplica_f_sobre f (a:as) (b:bs)   = f a b : aplica_f_sobre f as bs
aplica_f_sobre _ _      _        = []

dobrar :: (a -> [b] -> [b]) -> c -> [a] -> [b]  
dobrar f e []     = []				
dobrar f e (x:xs) = f x (dobrar f e xs)

mapear = xmapear -- para o livro
xmapear :: (a -> b) -> [a] -> [b]    
xmapear f []     =  []
xmapear f (x:xs) = f x : xmapear f xs  

{-
imp_cavalo horse
.......##...
.....##..#..
...##.....#.
..#.......#.
..#...#...#.
..#...###.#.
.#....#..##.
..#...#.....
...#...#....
....#..#....
.....#.#....
......##....

 ...acabou....   
 -}

  
{-
Pictures> printPicture horse    

.......##...
.....##..#..
...##.....#.
..#.......#.
..#...#...#.
..#...###.#.
.#....#..##.
..#...#.....
...#...#....
....#..#....
.....#.#....
......##.... 



Pictures> printPicture (flipH horse)
......##....
.....#.#....
....#..#....
...#...#....
..#...#.....
.#....#..##.
..#...###.#.
..#...#...#.
..#.......#.
...##.....#.
.....##..#..
.......##...

Pictures> printPicture (flipV horse)
...##.......
..#..##.....
.#.....##...
.#.......#..
.#...#...#..
.#.###...#..
.##..#....#.
.....#...#..
....#...#...
....#..#....
....#.#.....
....##......

printPicture (rotaciona  horse)
....##......
....#.#.....
....#..#....
....#...#...
.....#...#..
.##..#....#.
.#.###...#..
.#...#...#..
.#.......#..
.#.....##...
..#..##.....
...##.......

Pictures> printPicture (rotate  horse)
....##......
....#.#.....
....#..#....
....#...#...
.....#...#..
.##..#....#.
.#.###...#..
.#...#...#..
.#.......#..
.#.....##...
..#..##.....
...##.......

Pictures>    

imp_cavalo (lado_a_lado horse)
.......##..........##...
.....##..#.......##..#..
...##.....#....##.....#.
..#.......#...#.......#.
..#...#...#...#...#...#.
..#...###.#...#...###.#.
.#....#..##..#....#..##.
..#...#.......#...#.....
...#...#.......#...#....
....#..#........#..#....
.....#.#.........#.#....
......##..........##....

 acabou....               
Pictures> imp_cavalo(rotac_3 horse)
....##......
....#.#.....
....#..#....
....#...#...
.....#...#..
.##..#....#.
.#.###...#..
.#...#...#..
.#.......#..
.#.....##...
..#..##.....
...##.......
.................
Pictures> imp_cavalo(rotac_2 horse)
....##......
....#.#.....
....#..#....
....#...#...
.....#...#..
.##..#....#.
.#.###...#..
.#...#...#..
.#.......#..
.#.....##...
..#..##.....
...##.......
.................
Pictures>      
 imp_cavalo(troca_cor horse)
#######..###
#####..##.##
###..#####.#
##.#######.#
##.###.###.#
##.###...#.#
#.####.##..#
##.###.#####
###.###.####
####.##.####
#####.#.####
######..####
................. 
-}
                                                                                                       pgms/dados_2.txt                                                                                    0000644 0002433 0002424 00000000025 10426006067 013205  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   Mensagem da exce��o!!                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           pgms/dados2.txt                                                                                     0000644 0002433 0002424 00000000027 10421050721 013037  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   Mensagem pela exce��o!!                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         pgms/dados.txt                                                                                      0000644 0002433 0002424 00000000152 10417356545 012776  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   Jo�o da Silva#56#1.78#'M'
Jos� da Expedito#35#1.8#'M'
Maria Luiza#35#1.58#'F'
Marcio Ferreira#25#1.98#'M'
                                                                                                                                                                                                                                                                                                                                                                                                                      pgms/dados.txt~                                                                                     0000644 0002433 0002424 00000000064 10417356307 013172  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   Jo�o da Silva#56#1.78#'M'
Jo�o da Silva#45#1.78#'M'
                                                                                                                                                                                                                                                                                                                                                                                                                                                                            pgms/ex_compilado_ghc.hs                                                                            0000644 0002433 0002424 00000000343 10421045302 014742  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                    module Main
    where
    
 main =
       do {
	   putStrLn "Digite um Car�cter: ";
	   x <- getChar;
	   salte_de_linha;
	   putChar x;
	   putStrLn "\n Fim de Programa \n";
	   }
						       
 salte_de_linha = putStrLn ""

                                                                                                                                                                                                                                                                                             pgms/ex_compilado_ghc.hs~                                                                           0000644 0002433 0002424 00000000345 10365721643 015162  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                    module Main
    where
    
 main =
       do {
	   putStrLn "Digite um Car�cter: ";
	   x <- getChar;
	   salte_de_linha;
	   putChar x;
	   putStrLn "\n Fim de Programa \n";
	   }
						       
 salte_de_linha = putStrLn "\n"

                                                                                                                                                                                                                                                                                           pgms/exemplo_lazy_eval.hs                                                                           0000644 0002433 0002424 00000000266 10421045302 015201  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   
dobro, triplo :: Int -> Int
menor, f :: Int -> Int -> Int

menor x y
   | x < y = x
   | otherwise = y
   
dobro x = x + x
triplo x = 3*x
f a b  =  (dobro (triplo (menor a  b) ) ) 
                                                                                                                                                                                                                                                                                                                                          pgms/exemplo_lazy_eval.hs~                                                                          0000644 0002433 0002424 00000000267 10375103341 015406  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   
dobro, triplo :: Int -> Int
menor, f :: Int -> Int -> Int

menor x y
   | x < y = x
   | otherwise = y
   
dobro x = x + x
triplo x = 3*x
f a b  =  (dobro (triplo (menor a  b) ) ) )
                                                                                                                                                                                                                                                                                                                                         pgms/exemplos_lambda.hs                                                                             0000644 0002433 0002424 00000000317 10450030357 014621  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   k1 = (\x y -> x + y^2 ) 2 3 -- 11
k2 = (\x y -> ( x + y^2 ) ) 2 3  -- 11
k3 = (\x -> \y -> ( x + y^2 ) ) 2 3 -- 11

k10 = (\x -> (\y -> ( x + y^2 )) 2 )  3  -- 7
k11 = (\x -> (\y ->  x + y^2  ) 2 )  3 -- 7

                                                                                                                                                                                                                                                                                                                 pgms/f_currificada.hs                                                                               0000644 0002433 0002424 00000001172 10461233222 014244  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   
f_7 x = 7 + x

duas_f f  = f . f
idem_f f a = f ( f a )


tres_1_f f  =  f . f . f
tres_2_f f =  duas_f f . f
tres_3_f f =  f .  duas_f  f

{-
Main> duas_f  f_7    7
21
Main> duas_f  f_7    3
17
Main> 
Main>  f_7     3
10
Main> duas_f   f_7   3
17
Main> tres_1_f  f_7  3
24
Main> tres_2_f  f_7  3
24
Main> tres_3_f  f_7  3
24

Main> :type f_7     
f_7 :: Num a => a -> a
Main> :type duas_f
duas_f :: (a -> a) -> a -> a
Main> :type tres_1_f
tres_1_f :: (a -> a) -> a -> a
Main> :type tres_2_f
tres_2_f :: (a -> a) -> a -> a
Main> :type tres_3_f
tres_3_f :: (a -> a) -> a -> a
Main> :type (.)
(.) :: (a -> b) -> (c -> a) -> c -> b

-}
                                                                                                                                                                                                                                                                                                                                                                                                      pgms/f_currificada.hs~                                                                              0000644 0002433 0002424 00000001142 10461232674 014451  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   
f_7 x = 7 + x

duas_f f  = f . f

tres_1_f f  =  f . f . f
tres_2_f f =  duas_f f . f
tres_3_f f =  f .  duas_f  f

{-
Main> duas_f  f_7    7
21
Main> duas_f  f_7    3
17
Main> 
Main>  f_7     3
10
Main> duas_f   f_7   3
17
Main> tres_1_f  f_7  3
24
Main> tres_2_f  f_7  3
24
Main> tres_3_f  f_7  3
24

Main> :type f_7     
f_7 :: Num a => a -> a
Main> :type duas_f
duas_f :: (a -> a) -> a -> a
Main> :type tres_1_f
tres_1_f :: (a -> a) -> a -> a
Main> :type tres_2_f
tres_2_f :: (a -> a) -> a -> a
Main> :type tres_3_f
tres_3_f :: (a -> a) -> a -> a
Main> :type (.)
(.) :: (a -> b) -> (c -> a) -> c -> b

-}
                                                                                                                                                                                                                                                                                                                                                                                                                              pgms/filtrar.hs                                                                                     0000644 0002433 0002424 00000000142 10517004102 013115  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   filtrar_2  f  lista = [ a | a <- lista, f a == True]
filtrar_3  f  lista = [ a | a <- lista, f a]
                                                                                                                                                                                                                                                                                                                                                                                                                              pgms/filtrar.hs~                                                                                    0000644 0002433 0002424 00000000000 10517004013 013305  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   pgms/jogo_do_8.hs                                                                                   0000644 0002433 0002424 00000012607 10423204413 013335  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   module JOGO_8 where

import Array

{-- esta funcao, transforma uma lista para a forma matricial--}
mat x = listArray ((1,1),(3,3)) x

{-Fun��es que retornam somente lista da tupla, ou semente o pai do
n�, ou somente o n� atual respectivamente-}
lista :: ([Int],Int,Int)->[Int]
pai,nos :: ([Int],Int,Int)->Int

lista (a,b,c)  = a
pai   (a,b,c)  = b
nos   (a,b,c)  = c

{-estado final-}
lista_final :: [Int]
lista_final = [1,2,3,4,5,6,7,8,0]

{-x = lista que o usu�rio deseja encontrar a solu��o-}
jogo_8 :: [Int] -> IO()
jogo_8 x = imprime2 (caminho(busca [(x,0,0)] [(x,0,0)]))
jogo_82 x = busca [(x,0,0)] [(x,0,0)]

{-Fun��o que recebe uma �rvore em forma de lista e
devolve somente o ramo da �rvore que encontrou a
solu��o final-}
caminho (a:b) = reverse (imprime (nos a) (a:b))

imprime a [] = []
imprime a (b:c)
                |a == nos(b) = lista b : imprime (pai b) c
                |otherwise  = imprime a c

busca :: [([Int],Int,Int)] -> [([Int],Int,Int)] -> [([Int],Int,Int)]
busca [] visitados = error "fracasso"
busca (no:subarvore) visitados
             | lista(no)  == lista_final = no:visitados
             | otherwise = busca (subarvore ++ visit) (visit ++ visitados)
                            where
                              visit = (insere 4 (maior (no:subarvore)) no visitados)

maior x = foldl (\x y -> if x>y then x else y) 0 (map nos x)

{-- faz uma busca em amplitude n� a n�, caso a lista que possui os
filhos estiver vazia, ocorrer� fracasso --}

{-- insere na lista de filhos, os novos filhos que ainda nao estao
na lista de visitados--}
--insere:: Int -> Int->  ([Int],Int,Int)-> [([Int],Int,Int)] -> [([Int],Int,Int)]
insere 0 y z w = []
insere x y (a,b,c) z  = (filho x (encontra (a,c,y+1)) z) ++
                                                  (insere (x-1) (y+1) (a,b,c) z)

{-- cria os filhos caso eles nao pertencam a lista de visitados--}

filho 1 ((a,b),c,d,e) y
        | (a+1>3)                           = []
        | (pertence (elems (c // [((a,b),(c!(a+1,b))),
                                             ((a+1,b),0)])) y) == [] = []
        | otherwise                         = [((elems (c // [((a,b),
                                         (c!(a+1,b))),((a+1,b),0)])),d,e)]

filho 2 ((a,b),c,d,e) y
        | b-1<1                             = []
        | (pertence (elems (c // [((a,b),(c!(a,b-1))),
                                             ((a,b-1),0)])) y) == [] = []
        | otherwise                         = [((elems (c // [((a,b),
                                         (c!(a,b-1))),((a,b-1),0)])),d,e)]

filho 3 ((a,b),c,d,e) y
        | b+1>3                             = []
        | (pertence (elems (c // [((a,b),(c!(a,b+1))),
                                             ((a,b+1),0)])) y) == [] = []
        | otherwise                         = [((elems (c // [((a,b),
                                         (c!(a,b+1))),((a,b+1),0)])),d,e)]

filho 4 ((a,b),c,d,e) y
        | (a-1)<1                           = []
        | (pertence (elems (c // [((a,b),(c!(a-1,b))),
                                             ((a-1,b),0)])) y) == [] = []
        | otherwise                         = [((elems (c // [((a,b),
                                         (c!(a-1,b))),((a-1,b),0)])),d,e)]


-- ---------------/Funcoes Auxiliares/----------------

{--encontra a posicao em coordenadas do 0(zero) na matriz--}

encontra   (x,y,z)
             | (encontra1 x) ==  1 = ((1,1), mat x,y,z)
             | (encontra1 x) ==  2 = ((1,2), mat x,y,z)
             | (encontra1 x) ==  3 = ((1,3), mat x,y,z)
             | (encontra1 x) ==  4 = ((2,1), mat x,y,z)
             | (encontra1 x) ==  5 = ((2,2), mat x,y,z)
             | (encontra1 x) ==  6 = ((2,3), mat x,y,z)
             | (encontra1 x) ==  7 = ((3,1), mat x,y,z)
             | (encontra1 x) ==  8 = ((3,2), mat x,y,z)
             | otherwise           = ((3,3), mat x,y,z)

{-- funcao auxiliar da funcao acima(encontra) --}

encontra1 [] = error "a lista nao possui 0"
encontra1 (a:x)
            |a == 0    = 1
            |otherwise =  1 + encontra1 x

{-esta funcao compara a lista corrente com a lista de visitados,
para ver se a lista corrente pertence a lista de visitados -}

pertence x  [] = x
pertence x (b:y)
                | x == lista (b) =[]
                | otherwise = pertence x y

-- Fu��es de impress�o --------------------

imprime2 :: [[Int]]->IO()
imprime2 []   = putStr "fim"
imprime2 (a:x)= do
         {
                  implista 0 a;
                  imprime2 x
         }

implista :: Int -> [Int]->IO()
implista x [a] = do
                      {
                   putStr " " ;
                   putStr (show a);
                   putStrLn "|";
                   putStrLn "-------" ;
                      }
implista 0 a   =   do
            {
                putStrLn "-------";
                putStr "|";
                implista 1 a
            }

implista x (a:b) |x==3 = do
                {
                putStr " " ;
                putStr (show a);
                putStrLn "|";
                putStr "|";
                implista (1) b
                 }

         | otherwise = do
                      {
                   if x==1 then putStr"" else putStr " ";
                   putStr (show a);
                   implista (x+1) b
                      }

                                                                                                                         pgms/leitura.hs                                                                                     0000644 0002433 0002424 00000000553 10504565372 013146  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   import IO

dobro x = x * x

main = do
      putStrLn     " Lendo um inteiro "
      um_int  <- le_int_2          
      print ( dobro  um_int )
      putStrLn     " Lendo um real "
      um_float  <- le_float_2     
      print ( dobro  um_float )
      print " FIM do  main "	  
 
le_float_2 :: IO Float
le_float_2 = readLn
le_int_2 :: IO Int
le_int_2 = readLn

                                                                                                                                                     pgms/leitura.hs~                                                                                    0000644 0002433 0002424 00000000551 10504565341 013336  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   import IO

dobro x = x * x

main = do
      putStrLn     " Lendo um inteiro "
      um_int  <- le_int          
      print ( dobro  um_int )
      putStrLn     " Lendo um real "
      um_float  <- le_float_2     
      print ( dobro  um_float )
      print " FIM do  main "	  
 
le_float_2 :: IO Float
le_float_2 = readLn
le_int_2 :: IO Int
le_int_2 = readLn

                                                                                                                                                       pgms/Liberdade.hs                                                                                   0000644 0002433 0002424 00000000655 10421045303 013340  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   data Lam = Var Int | Comb Lam Lam | Abstr Int Lam

testa_liberdade a b|livre_ou_ligada a b = "A variavel eh livre"
                   |otherwise           = "A variavel eh ligada"

livre_ou_ligada x (Var y) 				= x == y 
livre_ou_ligada x (Comb rator rand) 	= livre_ou_ligada x rator || livre_ou_ligada x rand
livre_ou_ligada x (Abstr bndvar corpo)  = (x /= bndvar) && (livre_ou_ligada x corpo) 
livre_ou_ligada _ _ 					= False
                                                                                   pgms/listas_1.hs                                                                                    0000644 0002433 0002424 00000001177 10421045303 013204  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   {-fun��o para verificar se o n�mero � primo-}
eh_primo :: Int -> Bool
eh_primo 0  =  False
eh_primo 1  =  True
eh_primo n
         |(n_divisiveis n n == 2)   = True
	 | otherwise         = False
			
{-fun��o que encontra por quantos n�meros o n�mero passado como
par�metro � divis�vel. -}
n_divisiveis :: Int-> Int-> Int
n_divisiveis a 1   = 1
n_divisiveis a b
         |(mod a b == 0) = 1 + n_divisiveis a (b-1)
	 |otherwise      = n_divisiveis a (b-1)
			
{-fun��o que encontra o primeiro n�mero primo na lista-}
primeiro_primo :: [Int] -> Int
primeiro_primo (x:xs) | eh_primo x = x
                      | otherwise = primeiro_primo xs
                                                                                                                                                                                                                                                                                                                                                                                                 pgms/listas.hs~                                                                                     0000644 0002433 0002424 00000000264 10412261023 013155  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   lista [] = True           -- fun��o 1
lista (a:x)= lista x     -- fun��o 2


primeiros  0  _      = []
primeiros  _  []     = []
primeiros  n  (a:x)  = a  :  primeiros (n-1)    x 
                                                                                                                                                                                                                                                                                                                                            pgms/monadico_01.hs                                                                                 0000644 0002433 0002424 00000000652 10421045304 013554  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   
-- poe_x = getChar  >>= (ins_x )   >>= putStr
poe_x = getChar  >>=  putChar -- primitiva monadica "bind" (>>=) acoplamento

imp_2_char (c1,c2) = do { putChar c1; putChar c2; }

ler_2_char_1 = getChar >>= \x1 ->
               getChar >>= \x2 ->
	       return(x1,x2)
	       
ler_2_char_2 = do { x1 <- getChar; 
                    x2 <- getChar ;
	            return(x1,x2)
	          }
	       

ins_x a = a:" uma string "
                                                                                      pgms/monadico_01.hs~                                                                                0000644 0002433 0002424 00000000644 10357015501 013757  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   
-- poe_x = getChar  >>= (ins_x )   >>= putStr
poe_x = getChar  >>=  putChar -- primitiva monadica "bind" (>>=) acoplamento

imp_2_char (c1,c2) = do { putChar c1; putChar c2; }

ler_2_char_1 = getChar >>= \x1
               getChar >>= \x2
	       return(x1,x2)
	       
ler_2_char_2 = do { x1 <- getChar; 
                    x2 <- getChar ;
	            return(x1,x2)
	          }
	       

ins_x a = a:" uma string "
                                                                                            pgms/op_composicao.hs                                                                               0000644 0002433 0002424 00000003725 10462405761 014335  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   
suc x = x + 1
aux =  suc

g :: Float -> Int
g x = round x          -- fun��o de arredondamento

f :: Int -> Bool
f x =  even (fromIntegral x)    --  verifica se � par

k :: Bool -> IO ()
k  x 
      | x == True = putStr    " � um n�mero PAR"
      | otherwise   =  putStr   " � IMPAR"
      
      
h_1       =  f . g
h_2   x   =  f (g  x)
h_3   x    =  (f  (g   x))
h_4   f  g =  f . g
h_5   f  g  =  f  g 
h_6   f  g  x = f (g  x)
h_7   f  g  x = (f . g)  x
h_8   k f  g  = k . f . g 
h_9   x  = (k . f .  g ) x
h_10   x  = ( k . ( f .  g))  x
h_11   x  = ((k .  f)  .  g)   x
h_12       =   k .  f  .  g   

{-
Main> :t h_1           -- idem para h_2 e h_3
h_1 :: Float -> Bool
Main> :t h_4
h_4 :: (a -> b) -> (c -> a) -> c -> b
Main> :t h_5
h_5 :: (a -> b) -> a -> b
Main> :t h_6
h_6 :: (a -> b) -> (c -> a) -> c -> b
Main> :t h_7
h_7 :: (a -> b) -> (c -> a) -> c -> b
Main>       

Main> :type h_8
h_8 :: (a -> b) -> (c -> a) -> (d -> c) -> d -> b

Main> :t h_9                            -- idem a h_10 e h_12
h_9 :: Float -> IO ()
Main> :t h_11
h_11 :: Float -> IO ()
-}
{-

Main>  h_2   5.678
True
Main>  h_3   5.678
True
Main>  h_1   5.678
True
Main>  h_1   5.678
True
Main>  h_1  5.4321
False
Main>  h_2  5.4321
False
Main>  h_3  5.4321
False
Main> h_4 f g 5.678 
True
Main> h_4 f g 5.4321
False
Main> h_5   5.4321
ERROR - Cannot infer instance
*** Instance   : Fractional (a -> b)
*** Expression : h_5 5.4321

Main> h_5 f (g 5.4321)
False
Main> h_5 f (g 5.678)
True
Main> 
ain> h_6 f g   5.678
True
Main> h_6 f g  5.4321
False
Main> h_7 f g  5.4321
False
Main> h_7 f g   5.678
True


Main> h_8  f  g  k  5.34
 � IMPAR
Main> h_8  f  g  k  5.84
 � um n�mero PAR
Main> 
Main>  h_8  f  g  k  5.4321
 � IMPAR
Main>  h_8  f  g  k  5.678
 � um n�mero PAR
Main>  h_9   5.678
 � um n�mero PAR
Main>  h_9  5.4321
 � IMPAR
Main>  h_10  5.4321
 � IMPAR
Main>  h_11  5.4321
 � IMPAR
Main>  h_10   5.678
 � um n�mero PAR
Main>  h_11   5.678
 � um n�mero PAR
Main> 
Main>  h_12   5.678
 � um n�mero PAR

-}

                                           pgms/op_composicao.hs~                                                                              0000644 0002433 0002424 00000003672 10462141544 014530  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   g :: Float -> Int
g x = round x          -- fun��o de arredondamento

f :: Int -> Bool
f x =  even (fromIntegral x)    --  verifica se � par

k :: Bool -> IO ()
k  x 
      | x == True = putStr    " � um n�mero PAR"
      | otherwise   =  putStr   " � IMPAR"
      
      
h_1       =  f . g
h_2   x   =  f (g  x)
h_3   x    =  (f  (g   x))
h_4   f  g =  f . g
h_5   f  g  =  f  g 
h_6   f  g  x = f (g  x)
h_7   f  g  x = (f . g)  x
h_8   k f  g  = k . f . g 
h_9   x  = (k . f .  g ) x
h_10   x  = ( k . ( f .  g))  x
h_11   x  = ((k .  f)  .  g)   x
h_12       =   k .  f  .  g   

{-
Main> :t h_1           -- idem para h_2 e h_3
h_1 :: Float -> Bool
Main> :t h_4
h_4 :: (a -> b) -> (c -> a) -> c -> b
Main> :t h_5
h_5 :: (a -> b) -> a -> b
Main> :t h_6
h_6 :: (a -> b) -> (c -> a) -> c -> b
Main> :t h_7
h_7 :: (a -> b) -> (c -> a) -> c -> b
Main>       

Main> :type h_8
h_8 :: (a -> b) -> (c -> a) -> (d -> c) -> d -> b

Main> :t h_9                            -- idem a h_10 e h_12
h_9 :: Float -> IO ()
Main> :t h_11
h_11 :: Float -> IO ()
-}
{-

Main>  h_2   5.678
True
Main>  h_3   5.678
True
Main>  h_1   5.678
True
Main>  h_1   5.678
True
Main>  h_1  5.4321
False
Main>  h_2  5.4321
False
Main>  h_3  5.4321
False
Main> h_4 f g 5.678 
True
Main> h_4 f g 5.4321
False
Main> h_5   5.4321
ERROR - Cannot infer instance
*** Instance   : Fractional (a -> b)
*** Expression : h_5 5.4321

Main> h_5 f (g 5.4321)
False
Main> h_5 f (g 5.678)
True
Main> 
ain> h_6 f g   5.678
True
Main> h_6 f g  5.4321
False
Main> h_7 f g  5.4321
False
Main> h_7 f g   5.678
True


Main> h_8  f  g  k  5.34
 � IMPAR
Main> h_8  f  g  k  5.84
 � um n�mero PAR
Main> 
Main>  h_8  f  g  k  5.4321
 � IMPAR
Main>  h_8  f  g  k  5.678
 � um n�mero PAR
Main>  h_9   5.678
 � um n�mero PAR
Main>  h_9  5.4321
 � IMPAR
Main>  h_10  5.4321
 � IMPAR
Main>  h_11  5.4321
 � IMPAR
Main>  h_10   5.678
 � um n�mero PAR
Main>  h_11   5.678
 � um n�mero PAR
Main> 
Main>  h_12   5.678
 � um n�mero PAR

-}

                                                                      pgms/puzzle_8.hs                                                                                    0000644 0002433 0002424 00000012121 10421045305 013236  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   module JOGO_8 where

import Array

{-- esta funcao, transforma uma lista para a forma matricial--}
mat x = listArray ((1,1),(3,3)) x

{-Fun��es que retornam somente lista da tupla, ou semente o pai do
n�, ou somente o n� atual respectivamente-}

lista,pai,nos :: ([Int],Int,Int)->[Int]

lista (a,b,c)  = a
pai   (a,b,c)  = b
nos   (a,b,c)  = c

{-estado final-}
lista_final :: [Int]
lista_final = [1,2,3,4,5,6,7,8,0]

{-x = lista que o usu�rio deseja encontrar a solu��o-}
jogo_8 :: [Int] -> IO()
jogo_8 x = imprime2 (caminho(busca [(x,0,0)] [(x,0,0)]))
jogo_8 x = busca [(x,0,0)] [(x,0,0)]

{-Fun��o que recebe uma �rvore em forma de lista e
devolve somente o ramo da �rvore que encontrou a
solu��o final-}
caminho (a:b) = reverse (imprime (nos a) (a:b))

imprime a [] = []
imprime a (b:c)
                |a == nos(b) = lista b : imprime (pai b) c
                |otherwise  = imprime a c

busca :: [([Int],Int,Int)] -> [([Int],Int,Int)] -> [([Int],Int,Int)]
busca [] visitados = error "fracasso"
busca (no:subarvore) visitados
             | lista(no)  == lista_final = no:visitados
             | otherwise = busca (subarvore ++ visit) (visit ++ visitados)
                            where
                           visit = (insere 4 (maior (no:subarvore)) no visitados)

maior x = foldl (\x y -> if x>y then x else y) 0 (map nos x)

{-- faz uma busca em amplitude n� a n�, caso a lista que possui os
filhos estiver vazia, ocorrer� fracasso --}

{-- insere na lista de filhos, os novos filhos que ainda nao estao
na lista de visitados--}
--insere:: Int -> Int->  ([Int],Int,Int)-> [([Int],Int,Int)] -> [([Int],Int,Int)]
insere 0 y z w = []
insere x y (a,b,c) z  = (filho x (encontra (a,c,y+1)) z) ++
                                                  (insere (x-1) (y+1) (a,b,c) z)

{-- cria os filhos caso eles nao pertencam a lista de visitados--}

filho 1 ((a,b),c,d,e) y
        | (a+1>3)           = []
        | (pertence (elems (c // [((a,b),(c!(a+1,b))),((a+1,b),0)])) y) == [] = []
        | otherwise    = [((elems (c // [((a,b),(c!(a+1,b))),((a+1,b),0)])),d,e)]

filho 2 ((a,b),c,d,e) y
        | b-1<1                             = []
        | (pertence (elems (c // [((a,b),(c!(a,b-1))),
                                             ((a,b-1),0)])) y) == [] = []
        | otherwise                         = [((elems (c // [((a,b),
                                         (c!(a,b-1))),((a,b-1),0)])),d,e)]

filho 3 ((a,b),c,d,e) y
        | b+1>3                             = []
        | (pertence (elems (c // [((a,b),(c!(a,b+1))),
                                             ((a,b+1),0)])) y) == [] = []
        | otherwise                         = [((elems (c // [((a,b),
                                         (c!(a,b+1))),((a,b+1),0)])),d,e)]

filho 4 ((a,b),c,d,e) y
        | (a-1)<1                           = []
        | (pertence (elems (c // [((a,b),(c!(a-1,b))),
                                             ((a-1,b),0)])) y) == [] = []
        | otherwise                         = [((elems (c // [((a,b),
                                         (c!(a-1,b))),((a-1,b),0)])),d,e)]


-- ---------------/Funcoes Auxiliares/----------------

{--encontra a posicao em coordenadas do 0(zero) na matriz--}

encontra   (x,y,z)
             | (encontra1 x) ==  1 = ((1,1), mat x,y,z)
             | (encontra1 x) ==  2 = ((1,2), mat x,y,z)
             | (encontra1 x) ==  3 = ((1,3), mat x,y,z)
             | (encontra1 x) ==  4 = ((2,1), mat x,y,z)
             | (encontra1 x) ==  5 = ((2,2), mat x,y,z)
             | (encontra1 x) ==  6 = ((2,3), mat x,y,z)
             | (encontra1 x) ==  7 = ((3,1), mat x,y,z)
             | (encontra1 x) ==  8 = ((3,2), mat x,y,z)
             | otherwise           = ((3,3), mat x,y,z)

{-- funcao auxiliar da funcao acima(encontra) --}

encontra1 [] = error "a lista nao possui 0"
encontra1 (a:x)
            |a == 0    = 1
            |otherwise =  1 + encontra1 x

{-esta funcao compara a lista corrente com a lista de visitados,
para ver se a lista corrente pertence a lista de visitados -}

pertence x  [] = x
pertence x (b:y)
                | x == lista (b) =[]
                | otherwise = pertence x y

-- Fu��es de impress�o --------------------

imprime2 :: [[Int]]->IO()
imprime2 []   = putStr "fim"
imprime2 (a:x)= do
         {
                  implista 0 a;
                  imprime2 x
         }

implista :: Int -> [Int]->IO()
implista x [a] = do
                      {
                   putStr " " ;
                   putStr (show a);
                   putStrLn "|";
                   putStrLn "-------" ;
                      }
implista 0 a   =   do
            {
                putStrLn "-------";
                putStr "|";
                implista 1 a
            }

implista x (a:b) |x==3 = do
                {
                putStr " " ;
                putStr (show a);
                putStrLn "|";
                putStr "|";
                implista (1) b
                 }

         | otherwise = do
                      {
                   if x==1 then putStr"" else putStr " ";
                   putStr (show a);
                   implista (x+1) b
                      }
                                                                                                                                                                                                                                                                                                                                                                                                                                               pgms/puzzle_8.hs~                                                                                   0000644 0002433 0002424 00000012121 10374101067 013441  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   module JOGO_8 where

import Array

{-- esta funcao, transforma uma lista para a forma matricial--}
mat x = listArray ((1,1),(3,3)) x

{-Fun��es que retornam somente lista da tupla, ou semente o pai do
n�, ou somente o n� atual respectivamente-}
lista,pai,nos :: ([Int],Int,Int)->[Int]

lista (a,b,c)  = a
pai   (a,b,c)  = b
nos   (a,b,c)  = c

{-estado final-}
lista_final :: [Int]
lista_final = [1,2,3,4,5,6,7,8,0]

{-x = lista que o usu�rio deseja encontrar a solu��o-}
jogo_8 :: [Int] -> IO()
jogo_8 x = imprime2 (caminho(busca [(x,0,0)] [(x,0,0)]))
jogo_82 x = busca [(x,0,0)] [(x,0,0)]

{-Fun��o que recebe uma �rvore em forma de lista e
devolve somente o ramo da �rvore que encontrou a
solu��o final-}
caminho (a:b) = reverse (imprime (nos a) (a:b))

imprime a [] = []
imprime a (b:c)
                |a == nos(b) = lista b : imprime (pai b) c
                |otherwise  = imprime a c

busca :: [([Int],Int,Int)] -> [([Int],Int,Int)] -> [([Int],Int,Int)]
busca [] visitados = error "fracasso"
busca (no:subarvore) visitados
             | lista(no)  == lista_final = no:visitados
             | otherwise = busca (subarvore ++ visit) (visit ++ visitados)
                            where
                           visit = (insere 4 (maior (no:subarvore)) no visitados)

maior x = foldl (\x y -> if x>y then x else y) 0 (map nos x)

{-- faz uma busca em amplitude n� a n�, caso a lista que possui os
filhos estiver vazia, ocorrer� fracasso --}

{-- insere na lista de filhos, os novos filhos que ainda nao estao
na lista de visitados--}
--insere:: Int -> Int->  ([Int],Int,Int)-> [([Int],Int,Int)] -> [([Int],Int,Int)]
insere 0 y z w = []
insere x y (a,b,c) z  = (filho x (encontra (a,c,y+1)) z) ++
                                                  (insere (x-1) (y+1) (a,b,c) z)

{-- cria os filhos caso eles nao pertencam a lista de visitados--}

filho 1 ((a,b),c,d,e) y
        | (a+1>3)           = []
        | (pertence (elems (c // [((a,b),(c!(a+1,b))),((a+1,b),0)])) y) == [] = []
        | otherwise    = [((elems (c // [((a,b),(c!(a+1,b))),((a+1,b),0)])),d,e)]

filho 2 ((a,b),c,d,e) y
        | b-1<1                             = []
        | (pertence (elems (c // [((a,b),(c!(a,b-1))),
                                             ((a,b-1),0)])) y) == [] = []
        | otherwise                         = [((elems (c // [((a,b),
                                         (c!(a,b-1))),((a,b-1),0)])),d,e)]

filho 3 ((a,b),c,d,e) y
        | b+1>3                             = []
        | (pertence (elems (c // [((a,b),(c!(a,b+1))),
                                             ((a,b+1),0)])) y) == [] = []
        | otherwise                         = [((elems (c // [((a,b),
                                         (c!(a,b+1))),((a,b+1),0)])),d,e)]

filho 4 ((a,b),c,d,e) y
        | (a-1)<1                           = []
        | (pertence (elems (c // [((a,b),(c!(a-1,b))),
                                             ((a-1,b),0)])) y) == [] = []
        | otherwise                         = [((elems (c // [((a,b),
                                         (c!(a-1,b))),((a-1,b),0)])),d,e)]


-- ---------------/Funcoes Auxiliares/----------------

{--encontra a posicao em coordenadas do 0(zero) na matriz--}

encontra   (x,y,z)
             | (encontra1 x) ==  1 = ((1,1), mat x,y,z)
             | (encontra1 x) ==  2 = ((1,2), mat x,y,z)
             | (encontra1 x) ==  3 = ((1,3), mat x,y,z)
             | (encontra1 x) ==  4 = ((2,1), mat x,y,z)
             | (encontra1 x) ==  5 = ((2,2), mat x,y,z)
             | (encontra1 x) ==  6 = ((2,3), mat x,y,z)
             | (encontra1 x) ==  7 = ((3,1), mat x,y,z)
             | (encontra1 x) ==  8 = ((3,2), mat x,y,z)
             | otherwise           = ((3,3), mat x,y,z)

{-- funcao auxiliar da funcao acima(encontra) --}

encontra1 [] = error "a lista nao possui 0"
encontra1 (a:x)
            |a == 0    = 1
            |otherwise =  1 + encontra1 x

{-esta funcao compara a lista corrente com a lista de visitados,
para ver se a lista corrente pertence a lista de visitados -}

pertence x  [] = x
pertence x (b:y)
                | x == lista (b) =[]
                | otherwise = pertence x y

-- Fu��es de impress�o --------------------

imprime2 :: [[Int]]->IO()
imprime2 []   = putStr "fim"
imprime2 (a:x)= do
         {
                  implista 0 a;
                  imprime2 x
         }

implista :: Int -> [Int]->IO()
implista x [a] = do
                      {
                   putStr " " ;
                   putStr (show a);
                   putStrLn "|";
                   putStrLn "-------" ;
                      }
implista 0 a   =   do
            {
                putStrLn "-------";
                putStr "|";
                implista 1 a
            }

implista x (a:b) |x==3 = do
                {
                putStr " " ;
                putStr (show a);
                putStrLn "|";
                putStr "|";
                implista (1) b
                 }

         | otherwise = do
                      {
                   if x==1 then putStr"" else putStr " ";
                   putStr (show a);
                   implista (x+1) b
                      }
                                                                                                                                                                                                                                                                                                                                                                                                                                               pgms/repeticoes.hs                                                                                  0000644 0002433 0002424 00000001005 10421045306 013620  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   
para_sempre :: IO () -> IO ()
para_sempre a = do { a; para_sempre a; }

repita_N :: Int -> IO () -> IO ()
repita_N 0 a = return ()
repita_N n a = do { a; repita_N (n-1) a; }

{-
Main> repita_N 7 (putStr " Oi mundo " )
 Oi mundo  Oi mundo  Oi mundo  Oi mundo  Oi mundo  Oi mundo  Oi mundo

 Main> repita_N 7 (putStr ("   Oi mundo " ++ "\n"))
   Oi mundo
   Oi mundo
   Oi mundo
   Oi mundo
   Oi mundo
   Oi mundo
   Oi mundo

Main>  
Main> para_sempre (putChar 'h')
hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh........

-}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           pgms/repeticoes.hs~                                                                                 0000644 0002433 0002424 00000000666 10356570137 014046  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   
para_sempre :: IO () -> IO ()
para_sempre a = do { a; para_sempre a; }

repita_N :: Int -> IO () -> IO ()
repita_N 0 a = return ()
repita_N n a = do { a; repita_N (n-1) a; }

{-
Main> repita_N 7 (putStr " Oi mundo " )
 Oi mundo  Oi mundo  Oi mundo  Oi mundo  Oi mundo  Oi mundo  Oi mundo

 Main> repita_N 7 (putStr ("   Oi mundo " ++ "\n"))
   Oi mundo
   Oi mundo
   Oi mundo
   Oi mundo
   Oi mundo
   Oi mundo
   Oi mundo

Main>  

-}                                                                          pgms/sist_cadastro_livro.hs                                                                         0000644 0002433 0002424 00000022033 10421045307 015540  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   module Cadastro where
import IO
import System
import Numeric
import Char (toUpper)
--import Hugs.Prelude

-- Fun��o Principal --
{-- Antes do menu de op��es ser exibido, deve ser realizada uma
checagem a fim de verificar se o arquivo � vazio ou n�o. Se o arquivo est� vazio
� necess�rio que a inclus�o de uma lista vazia ([]) seja realizada para
que as demais opera��es possam ser realizadas com sucesso.
--}
--

-- Menu de Op��es --
menu::IO()
menu =
    do
        putStrLn " "
        putStrLn " ___________________________________________"
        putStrLn "|                                           |"
        putStrLn "|           CADASTRO DE PESSOAS             |"
        putStrLn "|                                           |"
        putStrLn "|   a -  Insere cadastro                    |"
        putStrLn "|   b -  Imprime cadastro                   |"
        putStrLn "|   c -  Busca por nomes                    |"
        putStrLn "|   d -  Soma das idades                    |"
        putStrLn "|   e -  M�dia das alturas                  |"
        putStrLn "|   f -  Busca por sexo                     |"
        putStrLn "|   g -  Excluir um cadastro                |"
        putStrLn "|   h -  Excluir todos cadastros            |"
        putStrLn "|   i -  Sair do Sistema                    |"
        putStrLn "|___________________________________________|"
        putStr "Digite uma das op��es:"
        le_opcao

le_opcao :: IO ()
le_opcao=
       do   {
            -- op��o do bloco do.... s� aceita tipos
            -- mon�dicos .... onde I/O � uma sub-classe
            opcao <- getChar;
            putStr "\n";
            f_menu (toUpper opcao); -- veja o tipo de f_menu
        }
f_menu :: Char -> IO()
f_menu i =
      do
        case i of
            'A' -> insere_cadastro
            'B' -> imprime_cadastros
            'C' -> busca_p_nomes
            'D' -> soma_d_idades
            'E' -> media_d_alturas
            'F' -> busca_p_sexo
            'G' -> excluir_um_cadastro
            'H' -> excluir_todos_cadastros
            otherwise -> sair i
        putStrLn "\n Operacao Concluida"
        if not(i=='I') then menu else putStr ""


insere_cadastro :: IO ()
insere_cadastro=
        do
            putStrLn "Nome: "
            nm <- getLine
            putStrLn "Idade: "
            id <- getLine
            putStrLn "Altura: "
            alt <- getLine
            putStrLn "M -Masculino |F -Feminino"
            putStrLn "Sexo: "
            sex <- getChar
            let cadastro = nm++"#"++id++"#"++alt++"#'"++[(toUpper sex)]++"'"
            pt_arq <- abreArquivo "dados.txt" AppendMode
            hPutStrLn pt_arq cadastro
            fechaArquivo pt_arq

imprime_cadastros :: IO ()
imprime_cadastros =
         do
            putStrLn ""
            putStrLn "----------------------------------------------------"
            pt_arq <- abreArquivo "dados.txt" ReadMode
            conteudo <- (hGetContents pt_arq)
            cadastros <- (converteConteudo (conteudo))
            imprime cadastros
            fechaArquivo pt_arq
            putStrLn "----------------------------------------------------"


busca_p_nomes :: IO ()
busca_p_nomes =
         do
            putStrLn ""
            putStrLn "Digite o nome desejado: "
            nome <- getLine
            busca_p_algo busca_por_nome nome

soma_d_idades :: IO()
soma_d_idades =
        do
            pt_arq <- abreArquivo "dados.txt" ReadMode
            conteudo <- (hGetContents pt_arq)
            cadastros <- (converteConteudo (conteudo))
            putStrLn (show (soma_d_idade cadastros))
            fechaArquivo pt_arq

media_d_alturas :: IO()
media_d_alturas =
        do
            pt_arq <- abreArquivo "dados.txt" ReadMode
            conteudo <- (hGetContents pt_arq)
            cadastros <- (converteConteudo (conteudo))
            putStrLn (show (media_d_altura cadastros))
            fechaArquivo pt_arq


busca_p_sexo :: IO ()
busca_p_sexo =
         do
            putStrLn ""
            putStrLn "Digite o sexo desejado: "
            sexo <- getChar
            busca_p_algo busca_por_sexo sexo


excluir_um_cadastro :: IO ()
excluir_um_cadastro =
            do
                putStrLn "O cadastro ser� apagado pelo nome."
                putStrLn "Digite o nome desejado:"
                nome <- getLine
                pt_arq <- abreArquivo "dados.txt" ReadMode
                conteudo <- (hGetContents pt_arq)
                cadastros <- (converteConteudo (conteudo))
                let novo_conteudo = apaga_p_nome cadastros nome
                aux_pt_arq <- abreArquivo "auxiliar.txt" WriteMode
                hPutStr aux_pt_arq novo_conteudo
                fechaArquivo aux_pt_arq
                fechaArquivo pt_arq
                copiar "auxiliar.txt" "dados.txt"


excluir_todos_cadastros :: IO ()
excluir_todos_cadastros =
           do
                putStrLn "Tem certeza que deseja apagar todos os dados do sistema?(s/n)"
                resp <- getChar
                if not((toUpper resp)=='S')
                  then putStrLn ""
                  else
                       do
                            pt_arq <- abreArquivo "dados.txt" WriteMode
                            fechaArquivo pt_arq
                            putStrLn "Apagando dados...."

sair :: Char -> IO ()
sair i  |i=='I'     = putStrLn "Saindo do sistema...."
    |otherwise  = putStrLn "Operacao Invalida..."

-- FUNCOES AUXILIARES DE CONSULTA

converteConteudo :: String -> IO [[String]]
converteConteudo conteudo = return (map (explodir '#') (explodir '\n' conteudo))

-- FUNCOES COM NUMEROS

media_d_altura :: [[String]] -> Float
media_d_altura [] = 0
media_d_altura x = (soma_d_alturas x) / (fromIntegral (length x))

soma_d_alturas :: [[String]] -> Float
soma_d_alturas []     = 0
soma_d_alturas (x:xs) = (read (altura x) :: Float) + (soma_d_alturas xs)

soma_d_idade :: [[String]] -> Integer
soma_d_idade []     = 0
soma_d_idade (x:xs) = (read (idade x) :: Integer) + (soma_d_idade xs)

-- FUNCOES UTEIS

explodir :: Eq a => a -> [a] -> [[a]]
explodir a [] = []
explodir a (x:xs)
       | (takeWhile (/= a) (x:xs)) == [] = explodir a xs
       | x == a  = (takeWhile (/= a) xs) : explodir a (dropWhile (/= a) xs)
       | otherwise = (takeWhile (/= a)(x:xs)) : explodir a (dropWhile (/= a) (x:xs))

nome,idade,altura,sexo :: [String] -> String

nome (a:b:c:d:[]) = a
idade (a:b:c:d:[]) = b
altura (a:b:c:d:[]) = c
sexo (a:b:c:d:[]) = d

copiar origem destino =
           do
                pt_arq <- abreArquivo origem ReadMode
                conteudo <- (hGetContents pt_arq)
                aux_pt_arq <- abreArquivo destino WriteMode
                hPutStr aux_pt_arq conteudo
                fechaArquivo aux_pt_arq
                fechaArquivo pt_arq


-- FUNCOES AUXILIARES DE BUSCA

busca_p_algo :: ([[String]] -> a -> IO b) -> a -> IO ()
busca_p_algo funcao filtro=
            do
                putStrLn " "
                putStrLn "----------------------------------------------------"
                pt_arq <- abreArquivo "dados.txt" ReadMode
                conteudo <- (hGetContents pt_arq)
                cadastros <- (converteConteudo (conteudo))
                funcao cadastros filtro
                fechaArquivo pt_arq
                putStrLn "----------------------------------------------------"


busca_por_nome :: [[String]] -> String -> IO ()
busca_por_nome [] nm      = putStrLn ""
busca_por_nome (x:xs) nm
              | (nome x) == nm  =
                         do
                            putStrLn ( foldl1 (\a b->a++" "++b) x)
                            busca_por_nome xs nm
              | otherwise       =  busca_por_nome xs nm

busca_por_sexo :: [[String]] -> Char -> IO ()
busca_por_sexo [] sx      = putStrLn ""
busca_por_sexo (x:xs) sx
              | (sexo x) == ("'"++[(toUpper sx)]++"'")  =
                               do
                                   putStrLn ( foldl1 (\a b->a++" "++b) x)
                                   busca_por_sexo xs sx
              | otherwise =  busca_por_sexo xs sx

-- FUNCOES AUXILIARES DE IMPRESSAO

imprime :: [[[Char]]] -> IO ()
imprime [] = putStrLn ""
imprime (x:xs) = do
                    putStrLn ( foldl1 (\a b->a++" "++b) x)
                    imprime xs

-- FUNCAO DE EXCLUSAO

apaga_p_nome :: [[String]] -> String -> String
apaga_p_nome [] nm = "\n"
apaga_p_nome (x:xs) nm
     | nm == (nome x) = (apaga_p_nome xs nm)
     | otherwise      = (foldl1 (\a b->a++"#"++b) x) ++ "\n" ++ (apaga_p_nome xs nm)
-- FUNCOES AUXILIARES DE ARQUIVOS

-- modo: AppendMode, WriteMode, ReadMode

abreArquivo :: String -> IOMode -> IO Handle
abreArquivo arquivo modo =
       catch (openFile arquivo modo)
             (\_ -> do {
                        putStrLn ("Impossivel abrir "++ arquivo);
                        putStrLn "Ser� aberto com um nome default: dados.txt e limpo" ;
                        pt_arq<-abreArquivo "dados.txt" WriteMode;
                        fechaArquivo pt_arq;
                        abreArquivo "dados.txt" ReadMode
                       }
             )


fechaArquivo :: Handle -> IO ()
fechaArquivo handle_arq = hClose handle_arq
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     pgms/sist_cadastro_livro.hs~                                                                        0000644 0002433 0002424 00000022030 10417355730 015744  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   module Cadastro where
import IO
import System
import Numeric
import Char (toUpper)
--import Hugs.Prelude

-- Fun��o Principal --
{-- Antes do menu de op��es ser exibido, deve ser realizada uma
checagem a fim de verificar se o arquivo � vazio ou n�o. Se o arquivo est� vazio
� necess�rio que a inclus�o de uma lista vazia ([]) seja realizada para
que as demais opera��es possam ser realizadas com sucesso.
--}
--

-- Menu de Op��es --
menu::IO()
menu =
    do
        putStrLn " "
        putStrLn " ___________________________________________"
        putStrLn "|                                           |"
        putStrLn "|           CADASTRO DE PESSOAS             |"
        putStrLn "|                                           |"
        putStrLn "|   a -  Insere cadastro                    |"
        putStrLn "|   b -  Imprime cadastro                   |"
        putStrLn "|   c -  Busca por nomes                    |"
        putStrLn "|   d -  Soma das idades                    |"
        putStrLn "|   e -  M�dia das alturas                  |"
        putStrLn "|   f -  Busca por sexo                     |"
        putStrLn "|   g -  Excluir um cadastro                |"
        putStrLn "|   h -  Excluir todos cadastros            |"
        putStrLn "|   i -  Sair do Sistema                    |"
        putStrLn "|___________________________________________|"
        putStr "Digite uma das op��es:"
        le_opcao

le_opcao :: IO ()
le_opcao=
       do   {
            -- op��o do bloco do.... s� aceita tipos
            -- mon�dicos .... onde I/O � uma sub-classe
            opcao <- getChar;
            putStr "\n";
            f_menu (toUpper opcao); -- veja o tipo de f_menu
        }
f_menu :: Char -> IO()
f_menu i =
      do
        case i of
            'A' -> insere_cadastro
            'B' -> imprime_cadastros
            'C' -> busca_p_nomes
            'D' -> soma_d_idades
            'E' -> media_d_alturas
            'F' -> busca_p_sexo
            'G' -> excluir_um_cadastro
            'H' -> excluir_todos_cadastros
            otherwise -> sair i
        putStrLn "Operacao Concluida"
        if not(i=='I') then menu else putStr ""


insere_cadastro :: IO ()
insere_cadastro=
        do
            putStrLn "Nome: "
            nm <- getLine
            putStrLn "Idade: "
            id <- getLine
            putStrLn "Altura: "
            alt <- getLine
            putStrLn "M -Masculino |F -Feminino"
            putStrLn "Sexo: "
            sex <- getChar
            let cadastro = nm++"#"++id++"#"++alt++"#'"++[(toUpper sex)]++"'"
            pt_arq <- abreArquivo "dados.txt" AppendMode
            hPutStrLn pt_arq cadastro
            fechaArquivo pt_arq

imprime_cadastros :: IO ()
imprime_cadastros =
         do
            putStrLn ""
            putStrLn "----------------------------------------------------"
            pt_arq <- abreArquivo "dados.txt" ReadMode
            conteudo <- (hGetContents pt_arq)
            cadastros <- (converteConteudo (conteudo))
            imprime cadastros
            fechaArquivo pt_arq
            putStrLn "----------------------------------------------------"


busca_p_nomes :: IO ()
busca_p_nomes =
         do
            putStrLn ""
            putStrLn "Digite o nome desejado: "
            nome <- getLine
            busca_p_algo busca_por_nome nome

soma_d_idades :: IO()
soma_d_idades =
        do
            pt_arq <- abreArquivo "dados.txt" ReadMode
            conteudo <- (hGetContents pt_arq)
            cadastros <- (converteConteudo (conteudo))
            putStrLn (show (soma_d_idade cadastros))
            fechaArquivo pt_arq

media_d_alturas :: IO()
media_d_alturas =
        do
            pt_arq <- abreArquivo "dados.txt" ReadMode
            conteudo <- (hGetContents pt_arq)
            cadastros <- (converteConteudo (conteudo))
            putStrLn (show (media_d_altura cadastros))
            fechaArquivo pt_arq


busca_p_sexo :: IO ()
busca_p_sexo =
         do
            putStrLn ""
            putStrLn "Digite o sexo desejado: "
            sexo <- getChar
            busca_p_algo busca_por_sexo sexo


excluir_um_cadastro :: IO ()
excluir_um_cadastro =
            do
                putStrLn "O cadastro ser� apagado pelo nome."
                putStrLn "Digite o nome desejado:"
                nome <- getLine
                pt_arq <- abreArquivo "dados.txt" ReadMode
                conteudo <- (hGetContents pt_arq)
                cadastros <- (converteConteudo (conteudo))
                let novo_conteudo = apaga_p_nome cadastros nome
                aux_pt_arq <- abreArquivo "auxiliar.txt" WriteMode
                hPutStr aux_pt_arq novo_conteudo
                fechaArquivo aux_pt_arq
                fechaArquivo pt_arq
                copiar "auxiliar.txt" "dados.txt"


excluir_todos_cadastros :: IO ()
excluir_todos_cadastros =
           do
                putStrLn "Tem certeza que deseja apagar todos os dados do sistema?(s/n)"
                resp <- getChar
                if not((toUpper resp)=='S')
                  then putStrLn ""
                  else
                       do
                            pt_arq <- abreArquivo "dados.txt" WriteMode
                            fechaArquivo pt_arq
                            putStrLn "Apagando dados...."

sair :: Char -> IO ()
sair i  |i=='I'     = putStrLn "Saindo do sistema...."
    |otherwise  = putStrLn "Operacao Invalida..."

-- FUNCOES AUXILIARES DE CONSULTA

converteConteudo :: String -> IO [[String]]
converteConteudo conteudo = return (map (explodir '#') (explodir '\n' conteudo))

-- FUNCOES COM NUMEROS

media_d_altura :: [[String]] -> Float
media_d_altura [] = 0
media_d_altura x = (soma_d_alturas x) / (fromIntegral (length x))

soma_d_alturas :: [[String]] -> Float
soma_d_alturas []     = 0
soma_d_alturas (x:xs) = (read (altura x) :: Float) + (soma_d_alturas xs)

soma_d_idade :: [[String]] -> Integer
soma_d_idade []     = 0
soma_d_idade (x:xs) = (read (idade x) :: Integer) + (soma_d_idade xs)

-- FUNCOES UTEIS

explodir :: Eq a => a -> [a] -> [[a]]
explodir a [] = []
explodir a (x:xs)
       | (takeWhile (/= a) (x:xs)) == [] = explodir a xs
       | x == a  = (takeWhile (/= a) xs) : explodir a (dropWhile (/= a) xs)
       | otherwise = (takeWhile (/= a)(x:xs)) : explodir a (dropWhile (/= a) (x:xs))

nome,idade,altura,sexo :: [String] -> String

nome (a:b:c:d:[]) = a
idade (a:b:c:d:[]) = b
altura (a:b:c:d:[]) = c
sexo (a:b:c:d:[]) = d

copiar origem destino =
           do
                pt_arq <- abreArquivo origem ReadMode
                conteudo <- (hGetContents pt_arq)
                aux_pt_arq <- abreArquivo destino WriteMode
                hPutStr aux_pt_arq conteudo
                fechaArquivo aux_pt_arq
                fechaArquivo pt_arq


-- FUNCOES AUXILIARES DE BUSCA

busca_p_algo :: ([[String]] -> a -> IO b) -> a -> IO ()
busca_p_algo funcao filtro=
            do
                putStrLn " "
                putStrLn "----------------------------------------------------"
                pt_arq <- abreArquivo "dados.txt" ReadMode
                conteudo <- (hGetContents pt_arq)
                cadastros <- (converteConteudo (conteudo))
                funcao cadastros filtro
                fechaArquivo pt_arq
                putStrLn "----------------------------------------------------"


busca_por_nome :: [[String]] -> String -> IO ()
busca_por_nome [] nm      = putStrLn ""
busca_por_nome (x:xs) nm
              | (nome x) == nm  =
                         do
                            putStrLn ( foldl1 (\a b->a++" "++b) x)
                            busca_por_nome xs nm
              | otherwise       =  busca_por_nome xs nm

busca_por_sexo :: [[String]] -> Char -> IO ()
busca_por_sexo [] sx      = putStrLn ""
busca_por_sexo (x:xs) sx
              | (sexo x) == ("'"++[(toUpper sx)]++"'")  =
                               do
                                   putStrLn ( foldl1 (\a b->a++" "++b) x)
                                   busca_por_sexo xs sx
              | otherwise =  busca_por_sexo xs sx

-- FUNCOES AUXILIARES DE IMPRESSAO

imprime :: [[[Char]]] -> IO ()
imprime [] = putStrLn ""
imprime (x:xs) = do
                    putStrLn ( foldl1 (\a b->a++" "++b) x)
                    imprime xs

-- FUNCAO DE EXCLUSAO

apaga_p_nome :: [[String]] -> String -> String
apaga_p_nome [] nm = "\n"
apaga_p_nome (x:xs) nm
     | nm == (nome x) = (apaga_p_nome xs nm)
     | otherwise      = (foldl1 (\a b->a++"#"++b) x) ++ "\n" ++ (apaga_p_nome xs nm)
-- FUNCOES AUXILIARES DE ARQUIVOS

-- modo: AppendMode, WriteMode, ReadMode

abreArquivo :: String -> IOMode -> IO Handle
abreArquivo arquivo modo =
       catch (openFile arquivo modo)
             (\_ -> do {
                        putStrLn ("Impossivel abrir "++ arquivo);
                        putStrLn "Ser� aberto com um nome default: dados.txt e limpo" ;
                        pt_arq<-abreArquivo "dados.txt" WriteMode;
                        fechaArquivo pt_arq;
                        abreArquivo "dados.txt" ReadMode
                       }
             )


fechaArquivo :: Handle -> IO ()
fechaArquivo handle_arq = hClose handle_arq
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        pgms/teste_1.txt                                                                                    0000644 0002433 0002424 00000000117 10417351663 013245  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   Escrevendo no arquivo usando handles ! 
Escrevendo no final deste arquivo ... 
                                                                                                                                                                                                                                                                                                                                                                                                                                                 pgms/teste_2.txt                                                                                    0000644 0002433 0002424 00000000105 10417354376 013247  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   Escrevendo diretamente  no arquivo 
 
 Anexando no final do arquivo 
                                                                                                                                                                                                                                                                                                                                                                                                                                                           pgms/teste.hs                                                                                       0000644 0002433 0002424 00000000744 10507564257 012633  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   data Nova_Cor = Vermelho | Azul | Amarelo | Rosa | Roxo |
                               Verde | Lilaz
                              deriving (Eq,Show)

combinacao_Cor :: Nova_Cor -> Nova_Cor -> Nova_Cor
combinacao_Cor  Vermelho Azul    = Roxo
combinacao_Cor  Azul   Amarelo    =  Verde
combinacao_Cor  Amarelo  Azul    =  Verde
combinacao_Cor  Verde  Vermelho    = Lilaz
combinacao_Cor  Verde  Azul    = Amarelo
combinacao_Cor  _        _       = error  "N�o existe essa combina��o"
                            pgms/teste.hs~                                                                                      0000644 0002433 0002424 00000000524 10507563777 013033  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   data Nova_Cor = Vermelho | Azul | Amarelo | Rosa | Roxo |
  Verde | Lilaz
  deriving (Eq,Show)

combinacao_Cor :: Nova_Cor -> Nova_Cor -> Nova_Cor
combinacao_Cor  Vermelho Azul    = Roxo
combinacao_Cor  Azul Amarelo     = Verde
combinacao_Cor  Amarelo  Azul    = Verde
combinacao_Cor  _        _       = error  "N�o existe essa combinacao"
                                                                                                                                                                            pgms/testes_lambda.hs~                                                                              0000644 0002433 0002424 00000000000 10450026661 014462  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   pgms/x.log                                                                                          0000644 0002433 0002424 00000001261 10507571344 012113  0                                                                                                    ustar   claudio                         casa                                                                                                                                                                                                                   This is e-TeX, Version 3.14159-2.1 (Web2C 7.4.5) (format=latex 2006.5.11)  30 SEP 2006 19:42
entering extended mode
**caps_isolados_haskell.tex
(/usr/share/texmf/tex/latex/tools/x.tex
LaTeX2e <2001/06/01>
Babel <v3.7h> and hyphenation patterns for american, portuges, nohyphenation, l
oaded.

 ) 
Here is how much of TeX's memory you used:
 6 strings out of 95749
 136 string characters out of 1194824
 44479 words of memory out of 1000001
 3087 multiletter control sequences out of 10000+50000
 3640 words of font info for 14 fonts, out of 500000 for 1000
 16 hyphenation exceptions out of 1000
 5i,0n,1p,105b,8s stack positions out of 1500i,500n,5000p,200000b,5000s

No pages of output.
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               