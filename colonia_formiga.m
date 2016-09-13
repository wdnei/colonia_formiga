% =========================================================================
% @desc Algoritmo colonia de formiga para encontrar melhor caminho no problema do
% caxeiro viajante
%
%Autor: Wdnei Ribeiro da Paixao
%Disciplina: Inteligencia Artificial
% =========================================================================

function [melhorCaminho custoCaminho]=colonia_formiga()

clear all;
clc;

caminhos=[0 2 9 3 6;...
          2 0 4 3 8;...
          9 4 0 7 3;...
          3 3 7 0 3;...
          6 8 3 3 0];



numCidades=length(caminhos);

matrixFeromonio=ones(numCidades,numCidades);

alpha=2;
beta=1;
numMaxIteracoes=20;
numIteracaoAtual=1;
taxaEvaporacao=0.5;


while numIteracaoAtual<numMaxIteracoes
    
    [formigas f_distancia]=gerar_solucoes(numCidades,matrixFeromonio,caminhos,alpha,beta);
    matrixFeromonio=atualiza_feromonio(matrixFeromonio,taxaEvaporacao,formigas,f_distancia);
        
    numIteracaoAtual=numIteracaoAtual+1;
end

disp('Caminhos gerados:');
for(k=1:size(formigas))
    g=sprintf('%d ', formigas(k,:));
    fprintf('Caminho: %s distancia:%d\n', g,f_distancia(k));
    
end

[val index_menor]=min(f_distancia);

g=sprintf('%d ', formigas(index_menor,:));
fprintf('selecao:%dº caminho como MENOR Caminho: %s distancia:%d\n',index_menor, g,f_distancia(index_menor));

end
