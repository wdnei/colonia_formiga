% =========================================================================
% @desc Algoritmo colonia de formiga para encontrar melhor caminho no problema do
% caxeiro viajante
%
%Autor: Wdnei Ribeiro da Paixao
%Disciplina: Inteligencia Artificial
% =========================================================================
%seleciona 1 valor entre os possiveis
function index_selecionado=roleta(i,js,matrixFeromonio,caminhos,alpha,beta)
%------ROLETA---------
f_aptidao=[];
total_aptidao=0;

for k=1:length(js)
    f_aptidao(k)= (matrixFeromonio(i,js(k))^alpha)* ((1/caminhos(i,js(k))^beta));
end

total_aptidao=sum(f_aptidao);
%escolher o numero aleatorio da jogada
aleatorio = rand;

setor = 0;
%disp('D');
for k = 1 : length(f_aptidao)
    %calcular o valor do setor
    setor = setor + (f_aptidao(k)/total_aptidao);
    %verificar o setor escolhido
    if(setor >= aleatorio)
        index_selecionado=k;
        
        return;
    end
end
error('nao achou');

end
