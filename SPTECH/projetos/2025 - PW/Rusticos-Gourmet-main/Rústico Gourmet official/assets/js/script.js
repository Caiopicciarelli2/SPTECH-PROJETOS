// Var

var totalfinalizar = document.getElementById('totalfinalizar');
var btnfechar = document.getElementById('btn-fechar');
var carrinhodiv = document.getElementById('carrinho-div');
var fecharcarrinho = document.getElementById('fechar-carrinho');
var carrinho = document.getElementById('carrinho');
var contador = 0;
var btnFC = document.getElementById('btnfinalizarcompra')
var pedidocarrinho = document.getElementById('pedido');
var sempedidos = document.getElementById('sempedidos');
var btncartBT = document.getElementById('btncartBT');
var btncartBL = document.getElementById('btncartBL');
var btncartTA = document.getElementById('btncartTA');
var btncartRN = document.getElementById('btncartRN');
var btncartLA = document.getElementById('btncartLA');
var btncartAL = document.getElementById('btncartAL');
var btncartBC = document.getElementById('btncartBC');
var btncartBE = document.getElementById('btncartBE');
var btncartBR = document.getElementById('btncartBR');
var btncartCH = document.getElementById('btncartCH');
var btncartSO = document.getElementById('btncartSO');
var btncartAÇ = document.getElementById('btncartAÇ');
var btncancelsp = document.getElementById('btncancel-sp')
var btnvsCF = document.getElementById('btnVS-cf')

// const

const modalBT = document.getElementById('dialog-1');
const modalBL = document.getElementById('dialog-2');
const modalTA = document.getElementById('dialog-3');
const modalRN = document.getElementById('dialog-4');
const modalLA = document.getElementById('dialog-5');
const modalAL = document.getElementById('dialog-6');
const modalBC = document.getElementById('dialog-7');
const modalBE = document.getElementById('dialog-8');
const modalBR = document.getElementById('dialog-9');
const modalCH = document.getElementById('dialog-10');
const modalSO = document.getElementById('dialog-11');
const modalAÇ = document.getElementById('dialog-12');
const spmodal = document.getElementById('sem-pedidos');
const cfmodal = document.getElementById('compra-finalizada');

// CARRINHO


fecharcarrinho.addEventListener('click', function() {
  carrinhodiv.style.display = 'none';
});

btnfechar.addEventListener('click', function() {
  pedidocarrinho.style.display = 'none';
  btnfechar.style.display = 'none'; 
});
  
//Modal Finalizar Compra

btnFC.addEventListener('click', function () {
  if (totalpricecarrinho > 0) {
    cfmodal.showModal()
  } else {
    alert('Coloque itens no carrinho.')
  }
});

btnvsCF.addEventListener('click', function () {
  location.reload();
})

//Modal Finalizar Compraend

// CARRINHOend





// MODALsp


carrinho.addEventListener('click', function() {
  if (totalpricecarrinho == 0) {
    spmodal.show(); 
    carrinhodiv.style.display = 'none'
    contador =+ 2
  }
});

carrinho.addEventListener('click', function(){
  if(contador % 2 == 0 ) {
    carrinhodiv.style.display = 'none'
  }
  else{
    carrinhodiv.style.display = 'block'
  }
  contador ++
})



btncancelsp.addEventListener('click', function() {
    spmodal.close();
});




// MODALspend



// BT

btncartBT.onclick = function () {
  modalBT.showModal();
  carrinhodiv.style.display = 'none';
  contador =+ 2
}

var btncancelBT = document.getElementById('btncancel-1').addEventListener('click', function () {
  modalBT.close();
  document.getElementById("quantidade-1").textContent = "1";
  document.querySelector(".pricemodal-1").textContent = "R$27,00";
});

function adicionarItemAoCarrinho(nome, preco, quantidade) {
  var carrinho = document.getElementById('pedido');
  var itensCarrinho = carrinho.getElementsByClassName('pedido-item');
  var itemExistente = null;

  for (var i = 0; i < itensCarrinho.length; i++) {
    var item = itensCarrinho[i];
    var nomeItem = item.getElementsByClassName('pedido-nome')[0].textContent;

    if (nomeItem === nome) {
      itemExistente = item;
      break;
    }
  }

  
 if (itemExistente) {
  var quantidadeElement = itemExistente.getElementsByClassName('quantpedidocart')[0];
  var precoElement = itemExistente.getElementsByClassName('pedido-valor')[0];

  var quantidadeAtual = quantidade;
  quantidadeElement.textContent = quantidadeAtual + 'x';

  var novoPreco = preco.toFixed(2);
  precoElement.textContent = 'R$' + novoPreco;
  } 
  else {
      var quantpedidocart = document.createElement('div');
      quantpedidocart.classList.add('quantpedidocart');
      quantpedidocart.textContent = quantidade + 'x';
  
      var nomeLancheCarrinho = document.createElement('div');
      nomeLancheCarrinho.classList.add('pedido-nome');
      nomeLancheCarrinho.textContent = nome;
  
      var precoLancheCarrinho = document.createElement('div');
      precoLancheCarrinho.classList.add('pedido-valor');

      var precoLancheCarrinho = document.createElement('div');
      precoLancheCarrinho.classList.add('pedido-valor');
      precoLancheCarrinho.textContent = 'R$' + preco.toFixed(2);
      precoLancheCarrinho.setAttribute('data-preco', preco);
  
      var btnRemover = document.createElement('button');
      btnRemover.classList.add('btnremover');
      btnRemover.innerHTML = '<i class="fa-solid fa-x"></i>';
  
      btnRemover.addEventListener('click', function() {
        var itemParaRemover = this.parentElement;
        itemParaRemover.remove();
    
        document.getElementById("quantidade-1").textContent = "1";
        document.querySelector(".pricemodal-1").textContent = "R$27,00";
        if (carrinho.getElementsByClassName('pedido-item').length === 0) {
          pedidocarrinho.style.display = 'none';
          btnfechar.style.display = 'none';
    
      }
    });

    var pedidoItem = document.createElement('div');
    pedidoItem.classList.add('pedido-item');
    pedidoItem.appendChild(quantpedidocart);
    pedidoItem.appendChild(nomeLancheCarrinho);
    pedidoItem.appendChild(precoLancheCarrinho);
    pedidoItem.appendChild(btnRemover);

    carrinho.appendChild(pedidoItem);
  }
}

var btnaddBT = document.getElementById('btnadd-1').addEventListener('click', function () {
  var nomeLancheModal = document.querySelector('.h1modal-1').textContent;
  var precoLancheModal = document.querySelector('.pricemodal-1').textContent;
  var quantidadeLancheModal = parseInt(document.getElementById('quantidade-1').textContent);
  sempedidos.style.display = 'none'
  
  adicionarItemAoCarrinho(nomeLancheModal, parseFloat(precoLancheModal.replace("R$", "").trim()), quantidadeLancheModal);

  modalBT.close();

  pedidocarrinho.style.display = 'block';
  btnfechar.style.display = 'block';
  carrinhodiv.style.display = 'block';
  
  
});

// BTend


// quantidadeBT

document.addEventListener("DOMContentLoaded", function() {
  const quantidadeElement = document.getElementById("quantidade-1");
  const precoElement = document.querySelector(".pricemodal-1");
  const botaoMais = document.querySelector(".qtmais-1");
  const botaoMenos = document.querySelector(".qtmenos-1");
  const precoUnitario = parseFloat(precoElement.textContent.replace("R$", "").trim()); 

  botaoMais.addEventListener("click", function() {
    let quantidade = parseInt(quantidadeElement.textContent);
    quantidade += 1;
    quantidadeElement.textContent = quantidade;
    atualizarPrecoTotal(quantidade, precoUnitario, precoElement); 
  });

  botaoMenos.addEventListener("click", function() {
    let quantidade = parseInt(quantidadeElement.textContent);
    if (quantidade > 1) {
      quantidade -= 1;
      quantidadeElement.textContent = quantidade;
      atualizarPrecoTotal(quantidade, precoUnitario, precoElement);
    }
  });

  function atualizarPrecoTotal(quantidade, precoUnitario, precoElement) {
    const precoTotal = quantidade * precoUnitario;
    precoElement.textContent = `R$${precoTotal.toFixed(2)}`;
  }

  
});


// quantidadeBTend



// BL

btncartBL.onclick = function () {
  modalBL.showModal()
  carrinhodiv.style.display = 'none';
  contador =+ 2
}

var btncancelBL = document.getElementById('btncancel-2').addEventListener('click', function () {
  modalBL.close();
  document.getElementById("quantidade-2").textContent = "1";
  document.querySelector(".pricemodal-2").textContent =  "R$24,00"
});

function adicionarItemAoCarrinho(nome, preco, quantidade) {
  var carrinho = document.getElementById('pedido');
  var itensCarrinho = carrinho.getElementsByClassName('pedido-item');
  var itemExistente = null;

  
  for (var i = 0; i < itensCarrinho.length; i++) {
    var item = itensCarrinho[i];
    var nomeItem = item.getElementsByClassName('pedido-nome')[0].textContent;
    if (nomeItem === nome) {
      itemExistente = item;
      break;
    }
  }


  if (itemExistente) {
    var quantidadeElement = itemExistente.getElementsByClassName('quantpedidocart')[0];
    var precoElement = itemExistente.getElementsByClassName('pedido-valor')[0];
  
    var quantidadeAtual = quantidade;
    quantidadeElement.textContent = quantidadeAtual + 'x';
  
    var novoPreco = preco.toFixed(2);
    precoElement.textContent = 'R$' + novoPreco;
    } 
    else {
    var quantpedidocart = document.createElement('div');
    quantpedidocart.classList.add('quantpedidocart');
    quantpedidocart.textContent = quantidade + 'x';

    var nomeLancheCarrinho = document.createElement('div');
    nomeLancheCarrinho.classList.add('pedido-nome');
    nomeLancheCarrinho.textContent = nome;

    var precoLancheCarrinho = document.createElement('div');
    precoLancheCarrinho.classList.add('pedido-valor');
    precoLancheCarrinho.textContent = 'R$' + preco.toFixed(2);
    precoLancheCarrinho.setAttribute('data-preco', preco);

    var btnRemover = document.createElement('button');
    btnRemover.classList.add('btnremover');
    btnRemover.innerHTML = '<i class="fa-solid fa-x"></i>';

    btnRemover.addEventListener('click', function() {
      var itemParaRemover = this.parentElement; 
      itemParaRemover.remove();
  
      document.getElementById("quantidade-2").textContent = "1";
      document.querySelector(".pricemodal-2").textContent = "R$24,00";
      if (carrinho.getElementsByClassName('pedido-item').length === 0) {
        pedidocarrinho.style.display = 'none';
        btnfechar.style.display = 'none';
    
      }
    });

    var pedidoItem = document.createElement('div');
    pedidoItem.classList.add('pedido-item');
    pedidoItem.appendChild(quantpedidocart);
    pedidoItem.appendChild(nomeLancheCarrinho);
    pedidoItem.appendChild(precoLancheCarrinho);
    pedidoItem.appendChild(btnRemover);

    carrinho.appendChild(pedidoItem);
  }
}

var btnaddBL = document.getElementById('btnadd-2').addEventListener('click', function () {
  var nomeLancheModal = document.querySelector('.h1modal-2').textContent;
  var precoLancheModal = document.querySelector('.pricemodal-2').textContent;
  var quantidadeLancheModal = parseInt(document.getElementById('quantidade-2').textContent);
  sempedidos.style.display = 'none'
  
  adicionarItemAoCarrinho(nomeLancheModal, parseFloat(precoLancheModal.replace("R$", "").trim()), quantidadeLancheModal);

  modalBL.close();
  pedidocarrinho.style.display = 'block';
  btnfechar.style.display = 'block';
  carrinhodiv.style.display = 'block';
  
});

// BLend



// quantidadeBL

document.addEventListener("DOMContentLoaded", function() {
  const quantidadeElement = document.getElementById("quantidade-2");
  const precoElement = document.querySelector(".pricemodal-2");
  const botaoMais = document.querySelector(".qtmais-2");
  const botaoMenos = document.querySelector(".qtmenos-2");
  const precoUnitario = parseFloat(precoElement.textContent.replace("R$", "").trim()); 

  botaoMais.addEventListener("click", function() {
    let quantidade = parseInt(quantidadeElement.textContent);
    quantidade += 1;
    quantidadeElement.textContent = quantidade;
    atualizarPrecoTotal(quantidade, precoUnitario, precoElement); 
  });

  botaoMenos.addEventListener("click", function() {
    let quantidade = parseInt(quantidadeElement.textContent);
    if (quantidade > 1) {
      quantidade -= 1;
      quantidadeElement.textContent = quantidade;
      atualizarPrecoTotal(quantidade, precoUnitario, precoElement);
    }
  });

  function atualizarPrecoTotal(quantidade, precoUnitario, precoElement) {
    const precoTotal = quantidade * precoUnitario;
    precoElement.textContent = `R$${precoTotal.toFixed(2)}`;
  }
});

// quantidadeBLend



// TA

btncartTA.onclick = function () {
  modalTA.showModal()
  carrinhodiv.style.display = 'none';
  contador =+ 2
}

var btncancelTA = document.getElementById('btncancel-3').addEventListener('click', function () {
  modalTA.close();
  document.getElementById("quantidade-3").textContent = "1";
  document.querySelector(".pricemodal-3").textContent =  "R$28,00"
});

function adicionarItemAoCarrinho(nome, preco, quantidade) {
  var carrinho = document.getElementById('pedido');
  var itensCarrinho = carrinho.getElementsByClassName('pedido-item');
  var itemExistente = null;

  for (var i = 0; i < itensCarrinho.length; i++) {
    var item = itensCarrinho[i];
    var nomeItem = item.getElementsByClassName('pedido-nome')[0].textContent;

    if (nomeItem === nome) {
      itemExistente = item;
      break;
    }
  }


  if (itemExistente) {
    var quantidadeElement = itemExistente.getElementsByClassName('quantpedidocart')[0];
    var precoElement = itemExistente.getElementsByClassName('pedido-valor')[0];
  
    var quantidadeAtual = quantidade;
    quantidadeElement.textContent = quantidadeAtual + 'x';
  
    var novoPreco = preco.toFixed(2);
    precoElement.textContent = 'R$' + novoPreco;
    } 
    else{
    var quantpedidocart = document.createElement('div');
    quantpedidocart.classList.add('quantpedidocart');
    quantpedidocart.textContent = quantidade + 'x';

    var nomeLancheCarrinho = document.createElement('div');
    nomeLancheCarrinho.classList.add('pedido-nome');
    nomeLancheCarrinho.textContent = nome;

    var precoLancheCarrinho = document.createElement('div');
    precoLancheCarrinho.classList.add('pedido-valor');
    precoLancheCarrinho.textContent = 'R$' + preco.toFixed(2);
    precoLancheCarrinho.setAttribute('data-preco', preco);

    var btnRemover = document.createElement('button');
    btnRemover.classList.add('btnremover');
    btnRemover.innerHTML = '<i class="fa-solid fa-x"></i>';

    btnRemover.addEventListener('click', function() {
      var itemParaRemover = this.parentElement;
      itemParaRemover.remove();
  
      document.getElementById("quantidade-3").textContent = "1";
      document.querySelector(".pricemodal-3").textContent = "R$28,00";
      if (carrinho.getElementsByClassName('pedido-item').length === 0) {
        pedidocarrinho.style.display = 'none';
        btnfechar.style.display = 'none';
    
      }
    });

    var pedidoItem = document.createElement('div');
    pedidoItem.classList.add('pedido-item');
    pedidoItem.appendChild(quantpedidocart);
    pedidoItem.appendChild(nomeLancheCarrinho);
    pedidoItem.appendChild(precoLancheCarrinho);
    pedidoItem.appendChild(btnRemover);
    carrinho.appendChild(pedidoItem);
  }
}

var btnaddTA = document.getElementById('btnadd-3').addEventListener('click', function () {
  var nomeLancheModal = document.querySelector('.h1modal-3').textContent;
  var precoLancheModal = document.querySelector('.pricemodal-3').textContent;
  var quantidadeLancheModal = parseInt(document.getElementById('quantidade-3').textContent);
  sempedidos.style.display = 'none'
  
  adicionarItemAoCarrinho(nomeLancheModal, parseFloat(precoLancheModal.replace("R$", "").trim()), quantidadeLancheModal);

  modalTA.close();
  pedidocarrinho.style.display = 'block';
  btnfechar.style.display = 'block';
  carrinhodiv.style.display = 'block';
  
});

// TAend



// quantidadeTA

document.addEventListener("DOMContentLoaded", function() {
  const quantidadeElement = document.getElementById("quantidade-3");
  const precoElement = document.querySelector(".pricemodal-3");
  const botaoMais = document.querySelector(".qtmais-3");
  const botaoMenos = document.querySelector(".qtmenos-3");
  const precoUnitario = parseFloat(precoElement.textContent.replace("R$", "").trim()); 

  botaoMais.addEventListener("click", function() {
    let quantidade = parseInt(quantidadeElement.textContent);
    quantidade += 1;
    quantidadeElement.textContent = quantidade;
    atualizarPrecoTotal(quantidade, precoUnitario, precoElement); 
  });

  botaoMenos.addEventListener("click", function() {
    let quantidade = parseInt(quantidadeElement.textContent);
    if (quantidade > 1) {
      quantidade -= 1;
      quantidadeElement.textContent = quantidade;
      atualizarPrecoTotal(quantidade, precoUnitario, precoElement);
    }
  });

  function atualizarPrecoTotal(quantidade, precoUnitario, precoElement) {
    const precoTotal = quantidade * precoUnitario;
    precoElement.textContent = `R$${precoTotal.toFixed(2)}`;
  }
});

// quantidadeTAend



// RN

btncartRN.onclick = function () {
  modalRN.showModal()
  carrinhodiv.style.display = 'none';
  contador =+ 2
}

var btncancelRN = document.getElementById('btncancel-4').addEventListener('click', function () {
  modalRN.close();
  document.getElementById("quantidade-4").textContent = "1";
  document.querySelector(".pricemodal-4").textContent =  "R$25,00"
});

function adicionarItemAoCarrinho(nome, preco, quantidade) {
  var carrinho = document.getElementById('pedido');
  var itensCarrinho = carrinho.getElementsByClassName('pedido-item');
  var itemExistente = null;

  
  for (var i = 0; i < itensCarrinho.length; i++) {
    var item = itensCarrinho[i];
    var nomeItem = item.getElementsByClassName('pedido-nome')[0].textContent;

    if (nomeItem === nome) {
      itemExistente = item;
      break;
    }
  }


  if (itemExistente) {
    var quantidadeElement = itemExistente.getElementsByClassName('quantpedidocart')[0];
    var precoElement = itemExistente.getElementsByClassName('pedido-valor')[0];
  
    var quantidadeAtual = quantidade;
    quantidadeElement.textContent = quantidadeAtual + 'x';
  
    var novoPreco = preco.toFixed(2);
    precoElement.textContent = 'R$' + novoPreco;
    } 
    else{
    var quantpedidocart = document.createElement('div');
    quantpedidocart.classList.add('quantpedidocart');
    quantpedidocart.textContent = quantidade + 'x';

    var nomeLancheCarrinho = document.createElement('div');
    nomeLancheCarrinho.classList.add('pedido-nome');
    nomeLancheCarrinho.textContent = nome;

    var precoLancheCarrinho = document.createElement('div');
    precoLancheCarrinho.classList.add('pedido-valor');
    precoLancheCarrinho.textContent = 'R$' + preco.toFixed(2);
    precoLancheCarrinho.setAttribute('data-preco', preco);

    var btnRemover = document.createElement('button');
    btnRemover.classList.add('btnremover');
    btnRemover.innerHTML = '<i class="fa-solid fa-x"></i>';

    btnRemover.addEventListener('click', function() {
      var itemParaRemover = this.parentElement; 
      itemParaRemover.remove();
  
      document.getElementById("quantidade-4").textContent = "1";
      document.querySelector(".pricemodal-4").textContent = "R$25,00";
      if (carrinho.getElementsByClassName('pedido-item').length === 0) {
        pedidocarrinho.style.display = 'none';
        btnfechar.style.display = 'none';
    
      }
    });

    var pedidoItem = document.createElement('div');
    pedidoItem.classList.add('pedido-item');
    pedidoItem.appendChild(quantpedidocart);
    pedidoItem.appendChild(nomeLancheCarrinho);
    pedidoItem.appendChild(precoLancheCarrinho);
    pedidoItem.appendChild(btnRemover);

    carrinho.appendChild(pedidoItem);
  }
}

var btnaddRN = document.getElementById('btnadd-4').addEventListener('click', function () {
  var nomeLancheModal = document.querySelector('.h1modal-4').textContent;
  var precoLancheModal = document.querySelector('.pricemodal-4').textContent;
  var quantidadeLancheModal = parseInt(document.getElementById('quantidade-4').textContent);
  sempedidos.style.display = 'none'
  
  adicionarItemAoCarrinho(nomeLancheModal, parseFloat(precoLancheModal.replace("R$", "").trim()), quantidadeLancheModal);


  modalRN.close();
  pedidocarrinho.style.display = 'block';
  btnfechar.style.display = 'block';
  carrinhodiv.style.display = 'block';
  
})

// RNend


// quantidadeRN

document.addEventListener("DOMContentLoaded", function() {
  const quantidadeElement = document.getElementById("quantidade-4");
  const precoElement = document.querySelector(".pricemodal-4");
  const botaoMais = document.querySelector(".qtmais-4");
  const botaoMenos = document.querySelector(".qtmenos-4");
  const precoUnitario = parseFloat(precoElement.textContent.replace("R$", "").trim()); 

  botaoMais.addEventListener("click", function() {
    let quantidade = parseInt(quantidadeElement.textContent);
    quantidade += 1;
    quantidadeElement.textContent = quantidade;
    atualizarPrecoTotal(quantidade, precoUnitario, precoElement); 
  });

  botaoMenos.addEventListener("click", function() {
    let quantidade = parseInt(quantidadeElement.textContent);
    if (quantidade > 1) {
      quantidade -= 1;
      quantidadeElement.textContent = quantidade;
      atualizarPrecoTotal(quantidade, precoUnitario, precoElement);
    }
  });

  function atualizarPrecoTotal(quantidade, precoUnitario, precoElement) {
    const precoTotal = quantidade * precoUnitario;
    precoElement.textContent = `R$${precoTotal.toFixed(2)}`;
  }
});

// quantidadeRNend



// LA

btncartLA.onclick = function () {
  modalLA.showModal()
  carrinhodiv.style.display = 'none';
  contador =+ 2
}

var btncancelLA = document.getElementById('btncancel-5').addEventListener('click', function () {
  modalLA.close();
  document.getElementById("quantidade-5").textContent = "1";
  document.querySelector(".pricemodal-5").textContent =  "R$26,00"
});

function adicionarItemAoCarrinho(nome, preco, quantidade) {
  var carrinho = document.getElementById('pedido');
  var itensCarrinho = carrinho.getElementsByClassName('pedido-item');
  var itemExistente = null;

  
  for (var i = 0; i < itensCarrinho.length; i++) {
    var item = itensCarrinho[i];
    var nomeItem = item.getElementsByClassName('pedido-nome')[0].textContent;

    if (nomeItem === nome) {
      itemExistente = item;
      break;
    }
  }


  if (itemExistente) {
    var quantidadeElement = itemExistente.getElementsByClassName('quantpedidocart')[0];
    var precoElement = itemExistente.getElementsByClassName('pedido-valor')[0];
  
    var quantidadeAtual = quantidade;
    quantidadeElement.textContent = quantidadeAtual + 'x';
  
    var novoPreco = preco.toFixed(2);
    precoElement.textContent = 'R$' + novoPreco;
    } 
    else{
    var quantpedidocart = document.createElement('div');
    quantpedidocart.classList.add('quantpedidocart');
    quantpedidocart.textContent = quantidade + 'x';

    var nomeLancheCarrinho = document.createElement('div');
    nomeLancheCarrinho.classList.add('pedido-nome');
    nomeLancheCarrinho.textContent = nome;

    var precoLancheCarrinho = document.createElement('div');
    precoLancheCarrinho.classList.add('pedido-valor');
    precoLancheCarrinho.textContent = 'R$' + preco.toFixed(2);
    precoLancheCarrinho.setAttribute('data-preco', preco);

    var btnRemover = document.createElement('button');
    btnRemover.classList.add('btnremover');
    btnRemover.innerHTML = '<i class="fa-solid fa-x"></i>';

    btnRemover.addEventListener('click', function() {
      var itemParaRemover = this.parentElement; 
      itemParaRemover.remove();
  
      document.getElementById("quantidade-5").textContent = "1";
      document.querySelector(".pricemodal-5").textContent = "R$26,00";
      if (carrinho.getElementsByClassName('pedido-item').length === 0) {
        pedidocarrinho.style.display = 'none';
        btnfechar.style.display = 'none';
    
      }
    });

    var pedidoItem = document.createElement('div');
    pedidoItem.classList.add('pedido-item');
    pedidoItem.appendChild(quantpedidocart);
    pedidoItem.appendChild(nomeLancheCarrinho);
    pedidoItem.appendChild(precoLancheCarrinho);
    pedidoItem.appendChild(btnRemover);

    carrinho.appendChild(pedidoItem);
  }
}

var btnaddLA = document.getElementById('btnadd-5').addEventListener('click', function () {
  var nomeLancheModal = document.querySelector('.h1modal-5').textContent;
  var precoLancheModal = document.querySelector('.pricemodal-5').textContent;
  var quantidadeLancheModal = parseInt(document.getElementById('quantidade-5').textContent);
  sempedidos.style.display = 'none'
  
  adicionarItemAoCarrinho(nomeLancheModal, parseFloat(precoLancheModal.replace("R$", "").trim()), quantidadeLancheModal);


  
  modalLA.close();
  carrinhodiv.style.display = "block";
  pedidocarrinho.style.display = 'block';
  btnfechar.style.display = 'block';
  
})

// LAend


// quantidadeLA

document.addEventListener("DOMContentLoaded", function() {
  const quantidadeElement = document.getElementById("quantidade-5");
  const precoElement = document.querySelector(".pricemodal-5");
  const botaoMais = document.querySelector(".qtmais-5");
  const botaoMenos = document.querySelector(".qtmenos-5");
  const precoUnitario = parseFloat(precoElement.textContent.replace("R$", "").trim()); 

  botaoMais.addEventListener("click", function() {
    let quantidade = parseInt(quantidadeElement.textContent);
    quantidade += 1;
    quantidadeElement.textContent = quantidade;
    atualizarPrecoTotal(quantidade, precoUnitario, precoElement); 
  });

  botaoMenos.addEventListener("click", function() {
    let quantidade = parseInt(quantidadeElement.textContent);
    if (quantidade > 1) {
      quantidade -= 1;
      quantidadeElement.textContent = quantidade;
      atualizarPrecoTotal(quantidade, precoUnitario, precoElement);
    }
  });

  function atualizarPrecoTotal(quantidade, precoUnitario, precoElement) {
    const precoTotal = quantidade * precoUnitario;
    precoElement.textContent = `R$${precoTotal.toFixed(2)}`;
  }
});

// quantidadeLAend



// AL

btncartAL.onclick = function () {
  modalAL.showModal()
  carrinhodiv.style.display = 'none';
  contador =+ 2
}

var btncancelAL = document.getElementById('btncancel-6').addEventListener('click', function () {
  modalAL.close();
  document.getElementById("quantidade-6").textContent = "1";
  document.querySelector(".pricemodal-6").textContent =  "R$28,00"
});
function adicionarItemAoCarrinho(nome, preco, quantidade) {
  var carrinho = document.getElementById('pedido');
  var itensCarrinho = carrinho.getElementsByClassName('pedido-item');
  var itemExistente = null;

  
  for (var i = 0; i < itensCarrinho.length; i++) {
    var item = itensCarrinho[i];
    var nomeItem = item.getElementsByClassName('pedido-nome')[0].textContent;

    if (nomeItem === nome) {
      itemExistente = item;
      break;
    }
  }


  if (itemExistente) {
    var quantidadeElement = itemExistente.getElementsByClassName('quantpedidocart')[0];
    var precoElement = itemExistente.getElementsByClassName('pedido-valor')[0];
  
    var quantidadeAtual = quantidade;
    quantidadeElement.textContent = quantidadeAtual + 'x';

    var novoPreco = preco.toFixed(2);
    precoElement.textContent = 'R$' + novoPreco;
    } 
    else{
    var quantpedidocart = document.createElement('div');
    quantpedidocart.classList.add('quantpedidocart');
    quantpedidocart.textContent = quantidade + 'x';

    var nomeLancheCarrinho = document.createElement('div');
    nomeLancheCarrinho.classList.add('pedido-nome');
    nomeLancheCarrinho.textContent = nome;

    var precoLancheCarrinho = document.createElement('div');
    precoLancheCarrinho.classList.add('pedido-valor');
    precoLancheCarrinho.textContent = 'R$' + preco.toFixed(2);
    precoLancheCarrinho.setAttribute('data-preco', preco);

    var btnRemover = document.createElement('button');
    btnRemover.classList.add('btnremover');
    btnRemover.innerHTML = '<i class="fa-solid fa-x"></i>';

    btnRemover.addEventListener('click', function() {
      var itemParaRemover = this.parentElement; 
      itemParaRemover.remove();
  
      document.getElementById("quantidade-6").textContent = "1";
      document.querySelector(".pricemodal-6").textContent = "R$28,00";
      if (carrinho.getElementsByClassName('pedido-item').length === 0) {
        pedidocarrinho.style.display = 'none';
        btnfechar.style.display = 'none';
    
      }
    });

    var pedidoItem = document.createElement('div');
    pedidoItem.classList.add('pedido-item');
    pedidoItem.appendChild(quantpedidocart);
    pedidoItem.appendChild(nomeLancheCarrinho);
    pedidoItem.appendChild(precoLancheCarrinho);
    pedidoItem.appendChild(btnRemover);

    carrinho.appendChild(pedidoItem);
  }
}

var btnaddAL = document.getElementById('btnadd-6').addEventListener('click', function () {
  var nomeLancheModal = document.querySelector('.h1modal-6').textContent;
  var precoLancheModal = document.querySelector('.pricemodal-6').textContent;
  var quantidadeLancheModal = parseInt(document.getElementById('quantidade-6').textContent);
  sempedidos.style.display = 'none'
  
  adicionarItemAoCarrinho(nomeLancheModal, parseFloat(precoLancheModal.replace("R$", "").trim()), quantidadeLancheModal);

  
  
  modalAL.close();
  carrinhodiv.style.display="block";
  pedidocarrinho.style.display = 'block';
  btnfechar.style.display = 'block';
  
});

// ALend


// quantidadeAL

document.addEventListener("DOMContentLoaded", function() {
  const quantidadeElement = document.getElementById("quantidade-6");
  const precoElement = document.querySelector(".pricemodal-6");
  const botaoMais = document.querySelector(".qtmais-6");
  const botaoMenos = document.querySelector(".qtmenos-6");
  const precoUnitario = parseFloat(precoElement.textContent.replace("R$", "").trim()); 

  botaoMais.addEventListener("click", function() {
    let quantidade = parseInt(quantidadeElement.textContent);
    quantidade += 1;
    quantidadeElement.textContent = quantidade;
    atualizarPrecoTotal(quantidade, precoUnitario, precoElement); 
  });

  botaoMenos.addEventListener("click", function() {
    let quantidade = parseInt(quantidadeElement.textContent);
    if (quantidade > 1) {
      quantidade -= 1;
      quantidadeElement.textContent = quantidade;
      atualizarPrecoTotal(quantidade, precoUnitario, precoElement);
    }
  });

  function atualizarPrecoTotal(quantidade, precoUnitario, precoElement) {
    const precoTotal = quantidade * precoUnitario;
    precoElement.textContent = `R$${precoTotal.toFixed(2)}`;
  }
});

// quantidadeAL



// BC

btncartBC.onclick = function () {
  modalBC.showModal()
  carrinhodiv.style.display = 'none';
  contador =+ 2
}

var btncancelBC = document.getElementById('btncancel-7').addEventListener('click', function () {
  modalBC.close();
  document.getElementById("quantidade-7").textContent = "1";
  document.querySelector(".pricemodal-7").textContent =  "R$18,00"
});

function adicionarItemAoCarrinho(nome, preco,  quantidade) {
  var carrinho = document.getElementById('pedido');
  var itensCarrinho = carrinho.getElementsByClassName('pedido-item');
  var itemExistente = null;

  
  for (var i = 0; i < itensCarrinho.length; i++) {
    var item = itensCarrinho[i];
    var nomeItem = item.getElementsByClassName('pedido-nome')[0].textContent;

    if (nomeItem === nome) {
      itemExistente = item;
      break;
    }
  }

  if (itemExistente) {
    var quantidadeElement = itemExistente.getElementsByClassName('quantpedidocart')[0];
    var precoElement = itemExistente.getElementsByClassName('pedido-valor')[0];
  
    var quantidadeAtual = quantidade;
    quantidadeElement.textContent = quantidadeAtual + 'x';
  
    var novoPreco = preco.toFixed(2);
    precoElement.textContent = 'R$' + novoPreco;
    } 
    else{
    var quantpedidocart = document.createElement('div');
    quantpedidocart.classList.add('quantpedidocart');
    quantpedidocart.textContent = quantidade + 'x';

    var nomeLancheCarrinho = document.createElement('div');
    nomeLancheCarrinho.classList.add('pedido-nome');
    nomeLancheCarrinho.textContent = nome;

    var precoLancheCarrinho = document.createElement('div');
    precoLancheCarrinho.classList.add('pedido-valor');
    precoLancheCarrinho.textContent = 'R$' + preco.toFixed(2);
    precoLancheCarrinho.setAttribute('data-preco', preco);

    var btnRemover = document.createElement('button');
    btnRemover.classList.add('btnremover');
    btnRemover.innerHTML = '<i class="fa-solid fa-x"></i>';

    btnRemover.addEventListener('click', function() {
      var itemParaRemover = this.parentElement; 
      itemParaRemover.remove();
  
      document.getElementById("quantidade-7").textContent = "1";
      document.querySelector(".pricemodal-7").textContent = "R$18,00";
      if (carrinho.getElementsByClassName('pedido-item').length === 0) {
        pedidocarrinho.style.display = 'none';
        btnfechar.style.display = 'none';
    
      }
    });

    var pedidoItem = document.createElement('div');
    pedidoItem.classList.add('pedido-item');
    pedidoItem.appendChild(quantpedidocart);
    pedidoItem.appendChild(nomeLancheCarrinho);
    pedidoItem.appendChild(precoLancheCarrinho);
    pedidoItem.appendChild(btnRemover);

    carrinho.appendChild(pedidoItem);
  }
}

var btnaddBC = document.getElementById('btnadd-7').addEventListener('click', function () {
  var nomeLancheModal = document.querySelector('.h1modal-7').textContent;
  var precoLancheModal = document.querySelector('.pricemodal-7').textContent;
  var quantidadeLancheModal = parseInt(document.getElementById('quantidade-7').textContent);
  sempedidos.style.display = 'none'
  
  adicionarItemAoCarrinho(nomeLancheModal, parseFloat(precoLancheModal.replace("R$", "").trim()), quantidadeLancheModal);
  
  
  modalBC.close();
  carrinhodiv.style.display = 'block';
  pedidocarrinho.style.display = 'block';
  btnfechar.style.display = 'block';
  
})

// BCend


// quantidadeBC

document.addEventListener("DOMContentLoaded", function() {
  const quantidadeElement = document.getElementById("quantidade-7");
  const precoElement = document.querySelector(".pricemodal-7");
  const botaoMais = document.querySelector(".qtmais-7");
  const botaoMenos = document.querySelector(".qtmenos-7");
  const precoUnitario = parseFloat(precoElement.textContent.replace("R$", "").trim());  

  botaoMais.addEventListener("click", function() {
    let quantidade = parseInt(quantidadeElement.textContent);
    quantidade += 1;
    quantidadeElement.textContent = quantidade;
    atualizarPrecoTotal(quantidade, precoUnitario, precoElement); 
  });

  botaoMenos.addEventListener("click", function() {
    let quantidade = parseInt(quantidadeElement.textContent);
    if (quantidade > 1) {
      quantidade -= 1;
      quantidadeElement.textContent = quantidade;
      atualizarPrecoTotal(quantidade, precoUnitario, precoElement);
    }
  });


  function atualizarPrecoTotal(quantidade, precoUnitario, precoElement) {
    const precoTotal = quantidade * precoUnitario;
    precoElement.textContent = `R$${precoTotal.toFixed(2)}`;
  }
});

// quantidadeBC



// Use suas variáveis
var cocap = 10;
var spritp = 10;
var aguap = 5;

// Função para atualizar o preço total
function atualizarPrecoTotal() {
  const quantidadeCoca = parseInt(document.getElementById("quantidade-8").textContent);
  const quantidadeSprite = parseInt(document.getElementById("quantidade-8-2").textContent);
  const quantidadeAgua = parseInt(document.getElementById("quantidade-8-3").textContent);

  const precoTotalCoca = cocap * quantidadeCoca;
  const precoTotalSprite = spritp * quantidadeSprite;
  const precoTotalAgua = aguap * quantidadeAgua;

  const precoTotalTotal = precoTotalCoca + precoTotalSprite + precoTotalAgua;

  document.getElementById("totalpm-8").textContent = `R$${precoTotalTotal.toFixed(2)}`;
}


// BE
document.getElementById('btncartBE').onclick = function () {
  modalBE.showModal()
  carrinhodiv.style.display = 'none';
  contador =+ 2
}

document.getElementById('btncancel-8').addEventListener('click', function () {
  modalBE.close();
  document.getElementById("quantidade-8").textContent = "0";
  document.getElementById("quantidade-8-2").textContent = "0";
  document.getElementById("quantidade-8-3").textContent = "0";
  document.querySelector(".pricemodal-8").textContent = "R$0.00";
  document.querySelector(".pricemodal-8-2").textContent = "R$0.00";
  document.querySelector(".pricemodal-8-3").textContent = "R$0.00";
  document.querySelector(".totalpm-8").textContent = "R$0.00";
});

function adicionarItemAoCarrinho(nome, preco, quantidade) {
  var carrinho = document.getElementById('pedido');
  var itensCarrinho = carrinho.getElementsByClassName('pedido-item');
  var itemExistente = null;

  
  for (var i = 0; i < itensCarrinho.length; i++) {
    var item = itensCarrinho[i];
    var nomeItem = item.getElementsByClassName('pedido-nome')[0].textContent;

    if (nomeItem === nome) {
      itemExistente = item;
      break;
    }
  }


  if (itemExistente) {
    var quantidadeElement = itemExistente.getElementsByClassName('quantpedidocart')[0];
    var precoElement = itemExistente.getElementsByClassName('pedido-valor')[0];
  
    var quantidadeAtual = quantidade;
    quantidadeElement.textContent = quantidadeAtual + 'x';
  
    var novoPreco = preco.toFixed(2);
    precoElement.textContent = 'R$' + novoPreco;
    } 
    else {
    var quantpedidocart = document.createElement('div');
    quantpedidocart.classList.add('quantpedidocart');
    quantpedidocart.textContent = quantidade + 'x';

    var nomeLancheCarrinho = document.createElement('div');
    nomeLancheCarrinho.classList.add('pedido-nome');
    nomeLancheCarrinho.textContent = nome;

    var precoLancheCarrinho = document.createElement('div');
    precoLancheCarrinho.classList.add('pedido-valor');
    precoLancheCarrinho.textContent = 'R$' + preco.toFixed(2);
    precoLancheCarrinho.setAttribute('data-preco', preco);

    atualizarPrecoTotal();

    var btnRemover = document.createElement('button');
    btnRemover.classList.add('btnremover');
    btnRemover.innerHTML = '<i class="fa-solid fa-x"></i>';

    btnRemover.addEventListener('click', function() {
      var itemParaRemover = this.parentElement; 
      itemParaRemover.remove();
  
      document.getElementById("quantidade-8").textContent = "0";
      document.getElementById("quantidade-8-2").textContent = "0";
      document.getElementById("quantidade-8-3").textContent = "0";
      document.querySelector(".pricemodal-8").textContent = "R$0.00";
      document.querySelector(".pricemodal-8-2").textContent = "R$0.00";
      document.querySelector(".pricemodal-8-3").textContent = "R$0.00";
      document.querySelector(".totalpm-8").textContent = "R$0.00";
      if (carrinho.getElementsByClassName('pedido-item').length === 0) {
        pedidocarrinho.style.display = 'none';
        btnfechar.style.display = 'none';
    
      }
    });

    var pedidoItem = document.createElement('div');
    pedidoItem.classList.add('pedido-item');
    pedidoItem.appendChild(nomeLancheCarrinho);
    pedidoItem.appendChild(precoLancheCarrinho);
    pedidoItem.appendChild(btnRemover);

    carrinho.appendChild(pedidoItem);
  }
}

var btnaddBE = document.getElementById('btnadd-8').addEventListener('click', function () {
  var nomeLancheModal = document.querySelector('.h1modal-8').textContent;
  var precoLancheModal = document.querySelector('.totalpm-8').textContent;
  var quant1BE= parseInt(document.getElementById('quantidade-8').textContent);
  var quant2BE= parseInt(document.getElementById('quantidade-8-2').textContent);
  var quant3BE= parseInt(document.getElementById('quantidade-8-3').textContent);
  var quantidadeLancheModal = quant1BE + quant2BE + quant3BE;
  sempedidos.style.display = 'none'

  if (precoLancheModal == "R$0.00") {
    alert("Nenhum bebida selecionada.")
  } else {
    adicionarItemAoCarrinho(nomeLancheModal, parseFloat(precoLancheModal.replace("R$", "").trim()), quantidadeLancheModal);
    modalBE.close();
    carrinhodiv.style.display = "block";
    pedidocarrinho.style.display = 'block';
    btnfechar.style.display = 'block';
    atualizarPrecoTotal();
  }
});

// BEend


document.addEventListener("DOMContentLoaded", function () {
  // Para a Coca
  const quantidadeElementCoca = document.getElementById("quantidade-8");
  const precoElementCoca = document.getElementById("pricemodal-8");
  const botaoMaisCoca = document.querySelector(".qtmais-8");
  const botaoMenosCoca = document.querySelector(".qtmenos-8");

  botaoMaisCoca.addEventListener("click", function () {
    let quantidade = parseInt(quantidadeElementCoca.textContent);
    quantidade += 1;
    quantidadeElementCoca.textContent = quantidade;
    atualizarPrecoTotal();
    atualizarprecococa(quantidade, cocap, precoElementCoca);
  });

  botaoMenosCoca.addEventListener("click", function () {
    let quantidade = parseInt(quantidadeElementCoca.textContent);
    if (quantidade > 0) {
      quantidade -= 1;
      quantidadeElementCoca.textContent = quantidade;
      atualizarPrecoTotal();
      atualizarprecococa(quantidade, cocap, precoElementCoca);
    }
  });

  function atualizarprecococa(quantidade, cocap, precoElementCoca) {
    const precoTotalcoca = quantidade * cocap;
    precoElementCoca.textContent = `R$${precoTotalcoca.toFixed(2)}`;
  }

  // Para a Sprite
  const quantidadeElementSprite = document.getElementById("quantidade-8-2");
  const precoElementSprite = document.querySelector(".pricemodal-8-2");
  const botaoMaisSprite = document.querySelector(".qtmais-8-2");
  const botaoMenosSprite = document.querySelector(".qtmenos-8-2");

  botaoMaisSprite.addEventListener("click", function () {
    let quantidade = parseInt(quantidadeElementSprite.textContent);
    quantidade += 1;
    quantidadeElementSprite.textContent = quantidade;
    atualizarPrecoTotal();
    atualizarprecosprite(quantidade, spritp, precoElementSprite);
  });

  botaoMenosSprite.addEventListener("click", function () {
    let quantidade = parseInt(quantidadeElementSprite.textContent);
    if (quantidade > 0) {
      quantidade -= 1;
      quantidadeElementSprite.textContent = quantidade;
      atualizarPrecoTotal();
      atualizarprecosprite(quantidade, spritp, precoElementSprite);
    }
  });

  function atualizarprecosprite(quantidade, spritp, precoElementSprite) {
    const precoTotalsprite = quantidade * spritp;
    precoElementSprite.textContent = `R$${precoTotalsprite.toFixed(2)}`;
  }

  // Para a Água
  const quantidadeElementAgua = document.getElementById("quantidade-8-3");
  const precoElementAgua = document.querySelector(".pricemodal-8-3");
  const botaoMaisAgua = document.querySelector(".qtmais-8-3");
  const botaoMenosAgua = document.querySelector(".qtmenos-8-3");

  botaoMaisAgua.addEventListener("click", function () {
    let quantidade = parseInt(quantidadeElementAgua.textContent);
    quantidade += 1;
    quantidadeElementAgua.textContent = quantidade;
    atualizarPrecoTotal();
    atualizarprecoagua(quantidade, aguap, precoElementAgua);
  });

  botaoMenosAgua.addEventListener("click", function () {
    let quantidade = parseInt(quantidadeElementAgua.textContent);
    if (quantidade > 0) {
      quantidade -= 1;
      quantidadeElementAgua.textContent = quantidade;
      atualizarPrecoTotal();
      atualizarprecoagua(quantidade, aguap, precoElementAgua);
    }
  });

  function atualizarprecoagua(quantidade, aguap, precoElementAgua) {
    const precoTotalagua = quantidade * aguap;
    precoElementAgua.textContent = `R$${precoTotalagua.toFixed(2)}`;
  }

});

atualizarPrecoTotal();


// BR

btncartBR.onclick = function () {
  modalBR.showModal()
  carrinhodiv.style.display = 'none';
  contador =+ 2
}

var btncancelBR = document.getElementById('btncancel-9').addEventListener('click', function () {
  modalBR.close();
  document.getElementById("quantidade-9").textContent = "1";
  document.querySelector(".pricemodal-9").textContent =  "R$21,00"

});

function adicionarItemAoCarrinho(nome, preco, quantidade) {
  var carrinho = document.getElementById('pedido');
  var itensCarrinho = carrinho.getElementsByClassName('pedido-item');
  var itemExistente = null;

  
  for (var i = 0; i < itensCarrinho.length; i++) {
    var item = itensCarrinho[i];
    var nomeItem = item.getElementsByClassName('pedido-nome')[0].textContent;
    if (nomeItem === nome) {
      itemExistente = item;
      break;
    }
  }


  if (itemExistente) {
    var quantidadeElement = itemExistente.getElementsByClassName('quantpedidocart')[0];
    var precoElement = itemExistente.getElementsByClassName('pedido-valor')[0];
  
    var quantidadeAtual = quantidade;
    quantidadeElement.textContent = quantidadeAtual + 'x';
  
    var novoPreco = preco.toFixed(2);
    precoElement.textContent = 'R$' + novoPreco;
    } 
    else{
    var quantpedidocart = document.createElement('div');
    quantpedidocart.classList.add('quantpedidocart');
    quantpedidocart.textContent = quantidade + 'x';

    var nomeLancheCarrinho = document.createElement('div');
    nomeLancheCarrinho.classList.add('pedido-nome');
    nomeLancheCarrinho.textContent = nome;

    var precoLancheCarrinho = document.createElement('div');
    precoLancheCarrinho.classList.add('pedido-valor');
    precoLancheCarrinho.textContent = 'R$' + preco.toFixed(2);
    precoLancheCarrinho.setAttribute('data-preco', preco);

    var btnRemover = document.createElement('button');
    btnRemover.classList.add('btnremover');
    btnRemover.innerHTML = '<i class="fa-solid fa-x"></i>';

    btnRemover.addEventListener('click', function() {
      var itemParaRemover = this.parentElement; 
      itemParaRemover.remove();
  
      document.getElementById("quantidade-9").textContent = "1";
      document.querySelector(".pricemodal-9").textContent = "R$21,00";
      if (carrinho.getElementsByClassName('pedido-item').length === 0) {
        pedidocarrinho.style.display = 'none';
        btnfechar.style.display = 'none';
    
      }
    });

    var pedidoItem = document.createElement('div');
    pedidoItem.classList.add('pedido-item');
    pedidoItem.appendChild(quantpedidocart);
    pedidoItem.appendChild(nomeLancheCarrinho);
    pedidoItem.appendChild(precoLancheCarrinho);
    pedidoItem.appendChild(btnRemover);

    carrinho.appendChild(pedidoItem);
  }
}

var btnaddBR = document.getElementById('btnadd-9').addEventListener('click', function () {
  var nomeLancheModal = document.querySelector('.h1modal-9').textContent;
  var precoLancheModal = document.querySelector('.pricemodal-9').textContent;
  var quantidadeLancheModal = parseInt(document.getElementById('quantidade-9').textContent);
  sempedidos.style.display = 'none'
  
  adicionarItemAoCarrinho(nomeLancheModal, parseFloat(precoLancheModal.replace("R$", "").trim()), quantidadeLancheModal);
  
  
  modalBR.close();
  carrinhodiv.style.display = "block";
  pedidocarrinho.style.display = 'block';
  btnfechar.style.display = 'block';
  
});

// BRend

// quantidadeBR

document.addEventListener("DOMContentLoaded", function() {
  const quantidadeElement = document.getElementById("quantidade-9");
  const precoElement = document.querySelector(".pricemodal-9");
  const botaoMais = document.querySelector(".qtmais-9");
  const botaoMenos = document.querySelector(".qtmenos-9");
  const precoUnitario = parseFloat(precoElement.textContent.replace("R$", "").trim()); 

  botaoMais.addEventListener("click", function() {
    let quantidade = parseInt(quantidadeElement.textContent);
    quantidade += 1;
    quantidadeElement.textContent = quantidade;
    atualizarPrecoTotal(quantidade, precoUnitario, precoElement); 
  });

  botaoMenos.addEventListener("click", function() {
    let quantidade = parseInt(quantidadeElement.textContent);
    if (quantidade > 1) {
      quantidade -= 1;
      quantidadeElement.textContent = quantidade;
      atualizarPrecoTotal(quantidade, precoUnitario, precoElement);
    }
  });


  function atualizarPrecoTotal(quantidade, precoUnitario, precoElement) {
    const precoTotal = quantidade * precoUnitario;
    precoElement.textContent = `R$${precoTotal.toFixed(2)}`;
  }
});

// quantidadeBRend



// CH

btncartCH.onclick = function () {
  modalCH.showModal()
  carrinhodiv.style.display = 'none';
  contador =+ 2
}

var btncancelCH = document.getElementById('btncancel-10').addEventListener('click', function () {
  modalCH.close();
  document.getElementById("quantidade-10").textContent = "1";
  document.querySelector(".pricemodal-10").textContent =  "R$7,00"
});

function adicionarItemAoCarrinho(nome, preco, quantidade) {
  var carrinho = document.getElementById('pedido');
  var itensCarrinho = carrinho.getElementsByClassName('pedido-item');
  var itemExistente = null;

  
  for (var i = 0; i < itensCarrinho.length; i++) {
    var item = itensCarrinho[i];
    var nomeItem = item.getElementsByClassName('pedido-nome')[0].textContent;

    if (nomeItem === nome) {
      itemExistente = item;
      break;
    }
  }


  if (itemExistente) {
    var quantidadeElement = itemExistente.getElementsByClassName('quantpedidocart')[0];
    var precoElement = itemExistente.getElementsByClassName('pedido-valor')[0];
  
    var quantidadeAtual = quantidade;
    quantidadeElement.textContent = quantidadeAtual + 'x';
  
    var novoPreco = preco.toFixed(2);
    precoElement.textContent = 'R$' + novoPreco;
    } 
    else{
    var quantpedidocart = document.createElement('div');
    quantpedidocart.classList.add('quantpedidocart');
    quantpedidocart.textContent = quantidade + 'x';

    var nomeLancheCarrinho = document.createElement('div');
    nomeLancheCarrinho.classList.add('pedido-nome');
    nomeLancheCarrinho.textContent = nome;

    var precoLancheCarrinho = document.createElement('div');
    precoLancheCarrinho.classList.add('pedido-valor');
    precoLancheCarrinho.textContent = 'R$' + preco.toFixed(2);
    precoLancheCarrinho.setAttribute('data-preco', preco);

    var btnRemover = document.createElement('button');
    btnRemover.classList.add('btnremover');
    btnRemover.innerHTML = '<i class="fa-solid fa-x"></i>';

    btnRemover.addEventListener('click', function() {
      var itemParaRemover = this.parentElement; 
      itemParaRemover.remove();
  
      document.getElementById("quantidade-10").textContent = "1";
      document.querySelector(".pricemodal-10").textContent = "R$7,00";
      if (carrinho.getElementsByClassName('pedido-item').length === 0) {
        pedidocarrinho.style.display = 'none';
        btnfechar.style.display = 'none';
    
      }
    });

    var pedidoItem = document.createElement('div');
    pedidoItem.classList.add('pedido-item');
    pedidoItem.appendChild(quantpedidocart);
    pedidoItem.appendChild(nomeLancheCarrinho);
    pedidoItem.appendChild(precoLancheCarrinho);
    pedidoItem.appendChild(btnRemover);

    carrinho.appendChild(pedidoItem);
  }
}

var btnaddCH = document.getElementById('btnadd-10').addEventListener('click', function () {
  var nomeLancheModal = document.querySelector('.h1modal-10').textContent;
  var precoLancheModal = document.querySelector('.pricemodal-10').textContent;
  var quantidadeLancheModal = parseInt(document.getElementById('quantidade-10').textContent);
  sempedidos.style.display = 'none'
  
  adicionarItemAoCarrinho(nomeLancheModal, parseFloat(precoLancheModal.replace("R$", "").trim()), quantidadeLancheModal);

  
  modalCH.close();
  carrinhodiv.style.display = "block";
  pedidocarrinho.style.display = 'block';
  btnfechar.style.display = 'block';
});

// CHend


// quantidadeCH

document.addEventListener("DOMContentLoaded", function() {
  const quantidadeElement = document.getElementById("quantidade-10");
  const precoElement = document.querySelector(".pricemodal-10");
  const botaoMais = document.querySelector(".qtmais-10");
  const botaoMenos = document.querySelector(".qtmenos-10");
  const precoUnitario = parseFloat(precoElement.textContent.replace("R$", "").trim()); 

  botaoMais.addEventListener("click", function() {
    let quantidade = parseInt(quantidadeElement.textContent);
    quantidade += 1;
    quantidadeElement.textContent = quantidade;
    atualizarPrecoTotal(quantidade, precoUnitario, precoElement); 
  });

  botaoMenos.addEventListener("click", function() {
    let quantidade = parseInt(quantidadeElement.textContent);
    if (quantidade > 1) {
      quantidade -= 1;
      quantidadeElement.textContent = quantidade;
      atualizarPrecoTotal(quantidade, precoUnitario, precoElement);
    }
  });

  function atualizarPrecoTotal(quantidade, precoUnitario, precoElement) {
    const precoTotal = quantidade * precoUnitario;
    precoElement.textContent = `R$${precoTotal.toFixed(2)}`;
  }
});

// quantidadeCHend



// SO

btncartSO.onclick = function () {
  modalSO.showModal()
  carrinhodiv.style.display = 'none';
  contador =+ 2
}

var btncancelSO = document.getElementById('btncancel-11').addEventListener('click', function () {
  modalSO.close();
  document.getElementById("quantidade-11").textContent = "1";
  document.querySelector(".pricemodal-11").textContent =  "R$13,00"
});


function adicionarItemAoCarrinho(nome, preco, quantidade) {
  var carrinho = document.getElementById('pedido');
  var itensCarrinho = carrinho.getElementsByClassName('pedido-item');
  var itemExistente = null;

  
  for (var i = 0; i < itensCarrinho.length; i++) {
    var item = itensCarrinho[i];
    var nomeItem = item.getElementsByClassName('pedido-nome')[0].textContent;

    if (nomeItem === nome) {
      itemExistente = item;
      break;
    }
  }


  if (itemExistente) {
    var quantidadeElement = itemExistente.getElementsByClassName('quantpedidocart')[0];
    var precoElement = itemExistente.getElementsByClassName('pedido-valor')[0];
  
    var quantidadeAtual = quantidade;
    quantidadeElement.textContent = quantidadeAtual + 'x';
  
    
    var novoPreco = preco.toFixed(2);
    precoElement.textContent = 'R$' + novoPreco;
    } 
    else{
    var quantpedidocart = document.createElement('div');
    quantpedidocart.classList.add('quantpedidocart');
    quantpedidocart.textContent = quantidade + 'x';

    var nomeLancheCarrinho = document.createElement('div');
    nomeLancheCarrinho.classList.add('pedido-nome');
    nomeLancheCarrinho.textContent = nome;

    var precoLancheCarrinho = document.createElement('div');
    precoLancheCarrinho.classList.add('pedido-valor');
    precoLancheCarrinho.textContent = 'R$' + preco.toFixed(2);
    precoLancheCarrinho.setAttribute('data-preco', preco);

    var btnRemover = document.createElement('button');
    btnRemover.classList.add('btnremover');
    btnRemover.innerHTML = '<i class="fa-solid fa-x"></i>';

    btnRemover.addEventListener('click', function() {
      var itemParaRemover = this.parentElement; 
      itemParaRemover.remove();
      document.getElementById("quantidade-11").textContent = "1";
      document.querySelector(".pricemodal-11").textContent = "R$13,00";
    });

    var pedidoItem = document.createElement('div');
    pedidoItem.classList.add('pedido-item');
    pedidoItem.appendChild(quantpedidocart);
    pedidoItem.appendChild(nomeLancheCarrinho);
    pedidoItem.appendChild(precoLancheCarrinho);
    pedidoItem.appendChild(btnRemover);

    carrinho.appendChild(pedidoItem);

  }
}

var btnaddSO = document.getElementById('btnadd-11').addEventListener('click', function () {
  var nomeLancheModal = document.querySelector('.h1modal-11').textContent;
  var precoLancheModal = document.querySelector('.pricemodal-11').textContent;
  var quantidadeLancheModal = parseInt(document.getElementById('quantidade-11').textContent);
  sempedidos.style.display = 'none'
  
  adicionarItemAoCarrinho(nomeLancheModal, parseFloat(precoLancheModal.replace("R$", "").trim()), quantidadeLancheModal);


  modalSO.close();
  carrinhodiv.style.display = "block";
  pedidocarrinho.style.display = 'block';
  btnfechar.style.display = 'block';
});

// SOend


//quantidadeSO

document.addEventListener("DOMContentLoaded", function() {
  const quantidadeElement = document.getElementById("quantidade-11");
  const precoElement = document.querySelector(".pricemodal-11");
  const botaoMais = document.querySelector(".qtmais-11");
  const botaoMenos = document.querySelector(".qtmenos-11");
  const precoUnitario = parseFloat(precoElement.textContent.replace("R$", "").trim()); 

  botaoMais.addEventListener("click", function() {
    let quantidade = parseInt(quantidadeElement.textContent);
    quantidade += 1;
    quantidadeElement.textContent = quantidade;
    atualizarPrecoTotal(quantidade, precoUnitario, precoElement); 
  });

  botaoMenos.addEventListener("click", function() {
    let quantidade = parseInt(quantidadeElement.textContent);
    if (quantidade > 1) {
      quantidade -= 1;
      quantidadeElement.textContent = quantidade;
      atualizarPrecoTotal(quantidade, precoUnitario, precoElement);
    }
  });

  function atualizarPrecoTotal(quantidade, precoUnitario, precoElement) {
    const precoTotal = quantidade * precoUnitario;
    precoElement.textContent = `R$${precoTotal.toFixed(2)}`;
  }
});

//quantidadeSOend



//AÇ

btncartAÇ.onclick = function () {
  modalAÇ.showModal()
  carrinhodiv.style.display = 'none';
  contador =+ 2
}

var btncancelAÇ = document.getElementById('btncancel-12').addEventListener('click', function () {
  modalAÇ.close();
  document.getElementById("quantidade-12").textContent = "1";
  document.querySelector(".pricemodal-12").textContent =  "R$15,00"
});


var totalpricecarrinho = 0;
var precodescartado = 0;

function adicionarItemAoCarrinho(nome, preco, quantidade) {
  var carrinho = document.getElementById('pedido');
  var itensCarrinho = carrinho.getElementsByClassName('pedido-item');
  var itemExistente = null;
  
  
  for (var i = 0; i < itensCarrinho.length; i++) {
    var item = itensCarrinho[i];
    var nomeItem = item.getElementsByClassName('pedido-nome')[0].textContent;
    

    if (nomeItem === nome) {
      itemExistente = item;
      break;
    }
  }

  if (itemExistente) {
    var quantidadeElement = itemExistente.getElementsByClassName('quantpedidocart')[0];
    var precoElement = itemExistente.getElementsByClassName('pedido-valor')[0];
  
    var quantidadeAtual = quantidade;
    quantidadeElement.textContent = quantidadeAtual + 'x';
  
    precodescartado = parseFloat(precoElement.getAttribute('data-preco'));


    totalpricecarrinho -= precodescartado  
    precoElement.textContent = 'R$' + preco.toFixed(2);;
  
    totalpricecarrinho += preco;

    
    } 
    else{
    var quantpedidocart = document.createElement('div');
    quantpedidocart.classList.add('quantpedidocart');
    quantpedidocart.textContent = quantidade + 'x';

    var nomeLancheCarrinho = document.createElement('div');
    nomeLancheCarrinho.classList.add('pedido-nome');
    nomeLancheCarrinho.textContent = nome;

    var precoLancheCarrinho = document.createElement('div');
    precoLancheCarrinho.classList.add('pedido-valor');
    precoLancheCarrinho.textContent = 'R$' + preco.toFixed(2);
    precoLancheCarrinho.setAttribute('data-preco', preco);

    var btnRemover = document.createElement('button');
    btnRemover.classList.add('btnremover');
    btnRemover.innerHTML = '<i class="fa-solid fa-x"></i>';

    btnRemover.addEventListener('click', function() {
      var itemParaRemover = this.parentElement;
      var precoItemRemovido = parseFloat(itemParaRemover.querySelector('.pedido-valor').getAttribute('data-preco')); 
      var precoIRoficial = (precoItemRemovido + precodescartado)
      itemParaRemover.remove();
      totalpricecarrinho -= parseFloat(precoIRoficial)
      document.getElementById("quantidade-12").textContent = "1";
      document.querySelector(".pricemodal-12").textContent = "R$15,00";
      document.getElementById('pricep').textContent =  'R$' + totalpricecarrinho.toFixed(2);
      if (totalpricecarrinho == 0) {
        sempedidos.style.display = 'block'
        contador += 1;
      }
    });

  

    var pedidoItem = document.createElement('div');
    pedidoItem.classList.add('pedido-item');
    pedidoItem.appendChild(quantpedidocart);
    pedidoItem.appendChild(nomeLancheCarrinho);
    pedidoItem.appendChild(precoLancheCarrinho);
    pedidoItem.appendChild(btnRemover);
    carrinho.appendChild(pedidoItem);

    totalpricecarrinho += preco;
  }

  document.getElementById("pricep").textContent = `R$${totalpricecarrinho.toFixed(2)}`;

}

var btnaddAÇ = document.getElementById('btnadd-12').addEventListener('click', function () {
  var nomeLancheModal = document.querySelector('.h1modal-12').textContent;
  var precoLancheModal = document.querySelector('.pricemodal-12').textContent;
  var quantidadeLancheModal = parseInt(document.getElementById('quantidade-12').textContent);
  sempedidos.style.display = 'none'

  
  adicionarItemAoCarrinho(nomeLancheModal, parseFloat(precoLancheModal.replace("R$", "").trim()), quantidadeLancheModal);


  modalAÇ.close();
  carrinhodiv.style.display = "block";
  pedidocarrinho.style.display = 'block';
  btnfechar.style.display = 'block';
});

//AÇend


// quantidadeAÇ

document.addEventListener("DOMContentLoaded", function() {
  const quantidadeElement = document.getElementById("quantidade-12");
  const precoElement = document.querySelector(".pricemodal-12");
  const botaoMais = document.querySelector(".qtmais-12");
  const botaoMenos = document.querySelector(".qtmenos-12");
  const precoUnitario = parseFloat(precoElement.textContent.replace("R$", "").trim()); 

  botaoMais.addEventListener("click", function() {
    let quantidade = parseInt(quantidadeElement.textContent);
    quantidade += 1;
    quantidadeElement.textContent = quantidade;
    atualizarPrecoTotal(quantidade, precoUnitario, precoElement); 
  });

  botaoMenos.addEventListener("click", function() {
    let quantidade = parseInt(quantidadeElement.textContent);
    if (quantidade > 1) {
      quantidade -= 1;
      quantidadeElement.textContent = quantidade;
      atualizarPrecoTotal(quantidade, precoUnitario, precoElement);
    }
  });

  function atualizarPrecoTotal(quantidade, precoUnitario, precoElement) {
    const precoTotal = quantidade * precoUnitario;
    precoElement.textContent = `R$${precoTotal.toFixed(2)}`;
  }
});

console.log(contador)

//quantidadeAÇend

//Modalend



