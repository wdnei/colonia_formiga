% =========================================================================
% @desc Gerador de solucoes para o algoritmo colonia de formiga
%
%Autor: Wdnei Ribeiro da Paixao
%Disciplina: Inteligencia Artificial
% =========================================================================
function[solucoes,f_distancia] = gerarSolucoes(numCidades,matrixFeromonio,caminhos,alpha,beta)
%inicializar o percurso das formigas
formigas=zeros(numCidades);
f_distancia=[];
cidades=[1:numCidades];

%coloca cada formiga em 1 cidade
for f=1:numCidades
    caminho_formiga=[];
    f_distancia(f)=0;
    
    %inicializa a formiga com a possiveis cidades,para nao haver repeticao
    cidadesPossiveis=cidades;
    caminho_formiga(1)=f;
    k=2;
    cidadesPossiveis(cidadesPossiveis==f)=[];
    while k<=numCidades
        %seleciona o caminho de acordo com a probabilidade dentre as
        %possiveis cidades
        indexSelecao=roleta(f,cidadesPossiveis,matrixFeromonio,caminhos,alpha,beta);
        %guardar o caminho
        caminho_formiga(k)=cidadesPossiveis(indexSelecao);
        
        %acumular distancia
        f_distancia(f)=f_distancia(f)+caminhos(caminho_formiga(k-1),cidadesPossiveis(indexSelecao));
        
        %elimina do vetor de cidades possiveis para o proximo loop
        cidadesPossiveis(cidadesPossiveis==cidadesPossiveis(indexSelecao))=[];
        k=k+1;
    end
    
    %guarda o caminho gerado
    formigas(f,:)=caminho_formiga(1,:);
    
end

solucoes=formigas;
end
