% =========================================================================
% @desc Algoritmo colonia de formiga para encontrar melhor caminho no problema do
% caxeiro viajante
%
%Autor: Wdnei Ribeiro da Paixao
%Disciplina: Inteligencia Artificial
% =========================================================================
function matrixFeromonio=atualizaFeromonio(matFeromonio,taxaEvaporacao,formigas,f_distancia)



[numFormigas numCidades]=size(formigas);

%aplica evaporacao a todos
matFeromonio=(1-taxaEvaporacao)*matFeromonio;

for f=1:numFormigas
    for c=1:numCidades-1
        i=int8(formigas(f,c));
        j=int8(formigas(f,c+1));
        valor=matFeromonio(i,j)+(1/f_distancia(f));
        matFeromonio(i,j)=valor;
        matFeromonio(j,i)=valor;
    end
end

matrixFeromonio=matFeromonio;

end
