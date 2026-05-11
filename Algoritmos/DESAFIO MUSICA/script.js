let lista_musicas = [
    {
        "titulo": 'a',
        "banda": 'b',
        "duracao": 'c',
        "anoLancamento": 1990,
        "avaliacoes": 'e',
        "integrantes": 'f'
    }
]

function adicionar_musica(titulo, banda, duracao, ano, avaliacoes, integrantes) {
    resultado_adicionar.innerHTML = ``;
    duracao = Number(duracao);
    ano = Number(ano);

    if (titulo == "" || banda == "" || duracao == "", ano == "" || avaliacoes == "" || integrantes == "") {
        resultado_adicionar.innerHTML = `Preencha todos os campos!`;
    } else {
        // tratando duracao de s para m
        duracao = duracao / 60;

        // transformando avaliacoes em array
        avaliacoes = avaliacoes.split(",");

        // tirando os espaços
        for (let i = 0; i < avaliacoes.length; i++) {
            avaliacoes[i] = avaliacoes[i].trim();
        }

        // transformando integrantes em array
        integrantes = integrantes.split(",");

        // tirando os espaços
        for (let i = 0; i < integrantes.length; i++) {
            integrantes[i] = integrantes[i].trim();
        }

        let lista_add = {
            "titulo": titulo,
            "banda": banda,
            "duracao": duracao.toFixed(2),
            "anoLancamento": ano,
            "avaliacoes": avaliacoes,
            "integrantes": integrantes
        }

        lista_musicas.push(lista_add);

        resultado_adicionar.innerHTML =
            `
            Sua música foi adicionada! <br>
            Título: ${titulo}, <br>
            Banda: ${banda}, <br>
            Duração: ${duracao.toFixed(2)} Minutos, <br>
            Ano de Lançamento: ${ano}, <br>
            Avaliações: ${avaliacoes}, <br>
            Integrantes: ${integrantes}.
        `;
    }
}

function listar_musicas() {
    resultado_listar.innerHTML = ``;
    let frases = "";


    for (let i = 0; i < lista_musicas.length; i++) {

        frases +=
            `
            Música ${i + 1}: <br>
            Título: ${lista_musicas[i].titulo} | Banda: ${lista_musicas[i].banda} | Duração: ${lista_musicas[i].duracao} Minutos | Ano de Lançamento: ${lista_musicas[i].anoLancamento} | Avaliações: ${lista_musicas[i].avaliacoes} |  Integrantes: ${lista_musicas[i].integrantes}. <br> <br>
        `;
    }

    resultado_listar.innerHTML = `${frases}`;
}

function remover_musica(nome_musica) {
    resultado_remover.innerHTML = ``;
    let contador = 0;
    let index_musica_encontrada = 0;

    for (let i = 0; i < lista_musicas.length; i++) {
        if (lista_musicas[i].titulo == nome_musica) {
            contador++;
            index_musica_encontrada = i;
        }
    }

    if (contador > 0) {
        resultado_remover.innerHTML =
            `
            A música de título : "${lista_musicas[index_musica_encontrada].titulo}" Foi removida!
        `;
        lista_musicas.splice(index_musica_encontrada, 1);

    } else {
        resultado_remover.innerHTML =
            `
            Música não encontrada!
        `;
    }
}

function atualizar_ano(nome_musica, novo_ano) {
    resultado_atualizar_ano.innerHTML = ``;
    let contador = 0;
    let index_musica_encontrada = 0;

    for (let i = 0; i < lista_musicas.length; i++) {
        if (lista_musicas[i].titulo.toUpperCase() == nome_musica.toUpperCase()) {
            contador++;
            index_musica_encontrada = i;
        }
    }

    if (contador > 0) {
        resultado_atualizar_ano.innerHTML =
            `
            A música de título : "${lista_musicas[index_musica_encontrada].titulo}" teve seu ano de lançamento trocado! <br>
            Antigo: ${lista_musicas[index_musica_encontrada].anoLancamento}. <br>
            Novo: ${novo_ano}.
        `;
        lista_musicas[index_musica_encontrada].anoLancamento = novo_ano;
    }
    else {
        resultado_atualizar_ano.innerHTML =
            `
            Música não encontrada!
        `;
    }
}

function calc_media(nome_musica) {
    resultado_media.innerHTML = ``;

    let soma = 0;
    let media = 0;
    let contador = 0;
    let frase = "";

    for (let i = 0; i < lista_musicas.length; i++) {
        if (lista_musicas[i].titulo.toUpperCase() == nome_musica.toUpperCase()) {
            contador++;
            for (let n = 0; n < lista_musicas[i].avaliacoes.length; n++) {
                soma += Number(lista_musicas[i].avaliacoes[n]);
            }
            console.log(soma)
            console.log(media)
            console.log(lista_musicas[i].avaliacoes.length)
            media = soma / lista_musicas[i].avaliacoes.length;
        }
    }

    if(contador <= 0){
        frase = `Música não encontrada`;
    }else{
        frase = `
                A média de avaliação do filme "${nome_musica}" é: ${media}.
            `;
    }

    resultado_media.innerHTML = frase;
}

function buscar_banda(nome_integrante) {
    resultado_banda.innerHTML = ``;

    let bandas = [];

    for (let i = 0; i < lista_musicas.length; i++) {
        let musica_integrantes = lista_musicas[i].integrantes;

        for (let j = 0; j < musica_integrantes.length; j++) {
            let integrante = musica_integrantes[j];

            if (integrante.toUpperCase() == nome_integrante.toUpperCase()) {

                if (!bandas.includes(lista_musicas[i].banda)) {
                    bandas.push(lista_musicas[i].banda);
                }
            }
        }
    }

    if (bandas.length > 0) {
        resultado_banda.innerHTML =
            `
            O integrante "${nome_integrante}" participa da(s) banda(s): <br>
            ${bandas.join(", ")}
        `;
    } else {
        resultado_banda.innerHTML =
            `
            Nenhuma banda encontrada para o integrante "${nome_integrante}".
        `;
    }
}