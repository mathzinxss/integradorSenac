document.getElementById('start-button').addEventListener('click', function() {
    showSection('login'); // Mudar para a seção de login
});

function showSection(sectionId) {
    // Esconde todas as seções
    const sections = document.querySelectorAll('section');
    sections.forEach(section => {
        section.classList.add('hidden');
        section.classList.remove('active');
    });

    // Mostra a seção desejada
    const activeSection = document.getElementById(sectionId);
    activeSection.classList.remove('hidden');
    activeSection.classList.add('active');
}

const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const port = 3000;

// Middleware
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

// Rota para logar o usuário
app.post('/login', (req, res) => {
    const { email, senha } = req.body;
    // Aqui você vai verificar se o usuário existe no banco de dados
    // e retornar a resposta adequada.
});

// Inicie o servidor
app.listen(port, () => {
    console.log(`Servidor rodando em http://localhost:${port}`);
});
