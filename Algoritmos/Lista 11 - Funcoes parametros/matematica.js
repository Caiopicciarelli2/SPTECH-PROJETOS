function is_nulo(numero1, numero2) {
    if (numero1 == '' || numero2 == '') {
        return true;
    } else {
        return false;
    }
}

function is_number(numero1, numero2) {

    if (typeof numero1 == 'number') {
        return true;
    } else if (typeof numero2 == 'number') {
        return true;
    } else {
        return false;
    }
}

function is_undefined(numero1, numero2) {

    if (isNaN(numero1)) {
        return true;
    } else if (isNaN(numero2)) {
        return true;
    } else {
        return false;
    }
}

function somar(numero1, numero2) {
    // frase do resultado da soma
    let frase_resultado = '';

    // verifica se há algum valor nulo
    let verif_nulo = is_nulo(numero1, numero2);

    if (verif_nulo) {
        frase_resultado = `Um valor ou mais são nulos!`;
    } else {
        // se não houver um valor nulo, transforma os valores em números.
        numero1 = Number(numero1);
        numero2 = Number(numero2);

        // verifica se há algum valor sem ser number ou indefinido
        let verif_number = is_number(numero1, numero2);
        let verif_NaN = is_undefined(numero1, numero2);

        let soma = 0;

        if (verif_number && !verif_NaN) {
            soma += numero1 + numero2;

            frase_resultado = `O resultado da soma do número: ${numero1} + ${numero2} = ${soma}`;
        } else if (!verif_number) {
            frase_resultado = `O valor não é um número e não pode ser somado.`;
        } else if (verif_NaN) {
            frase_resultado = `O valor é undefined/Nan!`;
        }
    }

    resultado_soma.innerHTML = `${frase_resultado}`;
}

function calcularDistancia(x1, x2, y1, y2){
    // frase do resultado da soma
    let frase_resultado = '';

    // verifica se há algum valor nulo
    let verif_nulo_1 = is_nulo(x1, x2);
    let verif_nulo_2 = is_nulo(y1, y2);

    if (verif_nulo_1 || verif_nulo_2) {
        frase_resultado = `Um valor ou mais são nulos!`;
    } else {
        // se não houver um valor nulo, transforma os valores em números.
        ponto_x1 = Number(x1);
        ponto_x2 = Number(x2);
        ponto_y1 = Number(y1);
        ponto_y2 = Number(y2);

        // verifica se há algum valor sem ser number ou indefinido
        let verif_number_1 = is_number(ponto_x1, ponto_x2);
        let verif_NaN_1 = is_undefined(ponto_x1, ponto_x2);
        let verif_number_2 = is_number(ponto_y1, ponto_y2);
        let verif_NaN_2 = is_undefined(ponto_y1, ponto_y2);

        let distancia = 0;

        if ((verif_number_1 && verif_number_2) && (!verif_NaN_1 && !verif_NaN_2)) {
            distancia = Math.sqrt((x2 - x1)**2 + (y2 - y1)**2)

            frase_resultado = `Distância: ${distancia}`;
        } else if (!verif_number_1 || !verif_number_2) {
            frase_resultado = `O valor não é um número e não pode ser calculado`;
        } else if (verif_NaN_1 || verif_NaN_2) {
            frase_resultado = `Um valor ou mais são indefinidos.`;
        }
    }

    resultado_distancia.innerHTML = `${frase_resultado}`;


}