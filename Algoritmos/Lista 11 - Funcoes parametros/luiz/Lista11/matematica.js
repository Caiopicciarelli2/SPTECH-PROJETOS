function isInvalid(num, nomeDaVariavel) {
    let invalid = false

    if (num == undefined || num == null) {
        console.log(`Parâmetro ${nomeDaVariavel} não pode ser nulo ou indefinido`)
        invalid = true
    }

    return invalid
}

function isNotNumber(num, nomeDaVariavel) {
    let notNumber = false

    if (isNaN(Number(num))) {
        console.log(`tipo inválido para o argumento ${nomeDaVariavel}`)
        notNumber = true
    }

    return notNumber
}

function somar(num1, num2) {
    if (isInvalid(num1, "num1")) return
    if (isInvalid(num2, "num2")) return
    
    if (isNotNumber(num1, "num1")) return
    if (isNotNumber(num2, "num2")) return

    const soma = num1 + num2

    return soma
}

function calcularDistancia(x1, y1, x2, y2) {
    if (isInvalid(x1, "x1")) return
    if (isInvalid(y1, "y1")) return
    if (isInvalid(x2, "x2")) return
    if (isInvalid(y2, "y2")) return

    if (isNotNumber(x1, "x1")) return
    if (isNotNumber(y1, "y1")) return
    if (isNotNumber(x2, "x2")) return
    if (isNotNumber(y2, "y2")) return
    
    const distancia = Math.sqrt((x2 - x1)**2 + (y2 - y1)**2)

    return distancia
}

function converterParaHoraMinutoSegundo(numero) {
    if (isInvalid(numero, "numero")) return
    if (isNotNumber(numero, "numero")) return

    const horas = Math.floor(numero / 3600)
    const minutos = Math.floor((numero % 3600) / 60)
    const segundos = Math.floor(numero % 60)

    // Formatar horário
    const hrsFormatado = String(horas).padStart(2, '0')
    const minFormatado = String(minutos).padStart(2, '0')
    const segFormatado = String(segundos).padStart(2, '0')

    const horario = `${hrsFormatado}:${minFormatado}:${segFormatado}`

    return horario
}

function ePrimo(numero) {
    if (isInvalid(numero, "numero")) return
    if (isNotNumber(numero, "numero")) return
    
    if (numero <= 1) return false
    
    for (let i = 2; i <= Math.sqrt(numero); i++) {
        if (numero % i === 0) return false
    }
    
    return true
}

function calcularFatorial(numero) {
    if (isInvalid(numero, "numero")) return
    if (isNotNumber(numero, "numero")) return

    if (numero === 0 || numero === 1) return 1
    let resultado = 1
    for (let i = numero; i > 1; i--) {
        resultado *= i
    }

    return resultado
}

function calcularMedia(vetor) {
    if (isInvalid(vetor, "vetor")) return
    
    let soma = 0
    
    for (let i = 0; i < vetor.length; i++) {
        const num = vetor[i];

        if (isInvalid(num, "vetor")) return
        if (isNotNumber(num, "vetor")) return

        soma += num
    }

    let media = soma / vetor.length

    return media
}

function calcularMediaPonderada(vetorMedias, vetorPesos) {
    if (isInvalid(vetorMedias, "vetorMedias")) return
    if (isInvalid(vetorPesos, "vetorPesos")) return

    if (vetorMedias.length != vetorPesos.length) {
        console.log("Vetores 'vetorMedias' e 'vetorPesos' têm que ter o mesmo tamanho")
        return
    }

    let somaPesos = 0

    for (let i = 0; i < vetorPesos.length; i++) {
        const peso = vetorPesos[i];
        somaPesos += peso
    }

    if (somaPesos != 1) {
        console.log("A soma dos pesos do vetor 'vetorPesos' tem que resultar em 1")
        return
    }
    
    let somaTotal = 0
    
    for (let i = 0; i < vetorMedias.length; i++) {
        const num = vetorMedias[i];
        const peso = vetorPesos[i]

        if (isInvalid(num, "vetorMedias")) return
        if (isNotNumber(num, "vetorMedias")) return

        somaTotal += num * peso
    }

    return somaTotal
}
