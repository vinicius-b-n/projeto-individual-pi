-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql server
*/

create database diario_amaan;
use diario_amaan;

create table racas (
id_racas int primary key auto_increment,
nome varchar(45),
representante varchar(45),
descricao text,
url_imagem text
);


create table perguntas (
id_pergunta int primary key auto_increment,
pergunta text
);

create table personagens (
id_personagens int primary key auto_increment,
nome varchar(45),
descricao text,
url_imagem varchar(255),
fk_racas int,
constraint fkctRacas
foreign key (fk_racas) references racas(id_racas)
);

-- alter table personagens drop foreign key fkctParceiro;

create table alternativas (
id_alternativas int primary key auto_increment,
alternativa text,
fk_perguntas int,
constraint fkctPerguntas
foreign key (fk_perguntas) references perguntas(id_pergunta)
);

create table resultado (
id_resultado int primary key auto_increment,
titulo varchar(50),
descricao text,
fk_personagens int,
constraint fkctpersonagens
foreign key (fk_personagens) references personagens(id_personagens)
);

create table usuario (
id_usuario int primary key auto_increment,
nome varchar(45),
email varchar(75),
senha varchar (45),
data_cadastro datetime default current_timestamp,
fk_resultado int,
constraint fkctResultado
foreign key (fk_resultado) references resultado(id_resultado)
);

create table resultados_alternativas (
fK_alternativa int,
fk_resultado int,
primary key (fk_alternativa, fk_resultado),
foreign key (fk_resultado) references resultado(id_resultado),
foreign key (fk_alternativa) references alternativas(id_alternativas)
);

create table avaliacao(
id_avaliacao int auto_increment primary key,
nota int,
fk_usuario int,
constraint ctFkUsuario
foreign key (fk_usuario) references usuario(id_usuario)
);

alter table avaliacao modify column fk_usuario int unique;

desc avaliacao;

select * from racas;

insert into personagens (nome, descricao, url_imagem) values  ('Maka Albarn', 'Maka Albarn é uma das principais protagonistas de Soul Eater, trabalhando juntamente com seu parceiro Soul Evans, a arma demoníaca que ela empunha quando ele   assume a forma de uma enorme foice preta e vermelha. Maka é inteligente, determinada e provavelmente uma das únicas pessoas naquele mundo que realmente leva os estudos a sério, acreditando fielmente  que uma alma saudável habita um corpo saudável e uma mente saudável, enquanto passa o resto do tempo dando surra em monstros, bruxas e, às vezes, no próprio Soul quando ele fala besteira demais.  Mesmo cercada por dificuldades, Maka continua seguindo em frente com seus amigos, mantendo coragem, disciplina e um equilíbrio único.', 'https://image-cdn-ak.spotifycdn.com/image/ab67706c0000da8419ed2f2767655049166d6726');

insert into personagens (nome, descricao, url_imagem) values  ('Soul Evans', 'Soul Evans, ou, para os mais íntimos, “Soul Eater”, é um dos principais protagonistas de Soul Eater. Ele atua ao lado de sua parceira, Maka, que o empunha quando assume a forma de uma imponente foice negra com detalhes em vermelho. Soul tem como maior objetivo ser estiloso em tudo o que faz. Para ele, a vida é como uma dança, e cada movimento precisa ter atitude. Seu lema é simples: o importante é ser maneiro… e caras maneiros nunca traem.', 'https://i.pinimg.com/originals/0d/94/4a/0d944a0ca56ba87a07914290838506ad.jpg');


insert into racas (nome, representante, descricao, url_imagem) values
('Artesão', 'Maka Albarn', 'No universo de Soul Eater, enquanto as Armas Demoníacas fornecem o poder
de corte e destruição, os Artesãos (Meisters) são os guerreiros encarregues de
as empunhar. Eles funcionam como os estrategistas, os atletas e, acima de tudo,
os condutores da energia espiritual durante um combate. Sem um Meister
compatível, mesmo a arma mais poderosa do mundo torna-se inútil ou
impossível de manusear. Os Meisters mais talentosos possuem a habilidade
de "enxergar" ou sentir a aura e o comprimento de onda das almas ao seu
redor. Esta capacidade serve para várias funções: Detectar Inimigos, Avaliar Poder, Sincronização de alma.', 'https://preview.redd.it/how-powerful-is-maka-albarn-soul-eater-in-the-anime-v0-yn6p3nmsfgpe1.jpeg?width=640&crop=smart&auto=webp&s=147375296e1d0fc81998f1ff5883dbee77c1ec68');

insert into racas (nome, representante, descricao, url_imagem) values
('Arma Demoníaca', 'Soul Eater', 'No universo de Soul Eater, as Armas Demoníacas representam uma das
criações mais distintas da ficção. Ao contrário de ferramentas inanimadas,
estas armas são seres humanos com uma linhagem genética específica que lhes
permite transformar o seu corpo em armamento de combate, mantendo a sua
consciência e personalidade intactas durante o processo. O combate nunca é solitário. Ele baseia-se numa parceria entre a Arma (o
indivíduo que se transforma) e o Artesão ou Meister (aquele que a empunha).
Esta relação é puramente simbiótica: o Meister fornece a estratégia e a força
física, enquanto a Arma fornece a potência destrutiva e a amplificação
espiritual.', 'https://cdn.myanimelist.net/s/common/uploaded_files/1444375217-88a4e7da60ec09990a9c2324e52d46a6.jpeg');

update personagens set fk_racas = 1 where id_personagens = 1;
update personagens set fk_racas = 2 where id_personagens = 2;

create table parceria (
id_parceria int primary key auto_increment,
personagem1 int,
personagem2 int,
foreign key (personagem1) REFERENCES personagens(id_personagens),
foreign key (personagem2) REFERENCES personagens(id_personagens)
);

insert into parceria (personagem1, personagem2) values
(1, 2);


insert into personagens (nome, descricao, url_imagem, fk_racas) values
('Black Star', 'Black Star é um dos protagonistas de Soul Eater, lutando ao lado de sua parceira Tsubaki, a arma demoníaca capaz de assumir diversas formas para acompanhar seu estilo exagerado de combate. Chamativo, escandaloso e incapaz de ficar cinco segundos sem anunciar sua própria grandeza, Black☆Star transforma qualquer batalha em um espetáculo particular, mesmo quando claramente ninguém pediu por isso, sem dúvidas o ninja mais barulhento que você já viu. Seus gritos, suas atitudes, e seu jeito único nunca pareceu incomodar sua parceira, a qual guarda uma grande admiração por black star.
Será que ele vai conseguir alcançar seu objetivo de se tornar mais forte que deus?', 'https://cdna.artstation.com/p/assets/images/images/062/342/542/large/retratosanime-166.jpg?1682924972', 1);


select * from parceria;
select * from personagens;
select * from racas;

select personagens.nome, personagens.descricao, personagens.url_imagem, racas.nome from personagens
inner join racas on personagens.fk_racas = racas.id_racas;

-- puxando todos os artesaos, mesmo os sem parceiros
select p1.nome, p1.descricao, p1.url_imagem, racas.nome, p2.nome from parceria
left join personagens as p1 on parceria.personagem1 = p1.id_personagens
left join personagens as p2 on parceria.personagem2 = p2.id_personagens
left join racas on p1.fk_racas = racas.id_racas

union 

-- puxando todos os parceiros, mesmo sem artesao
select p2.nome, p2.descricao, p2.url_imagem, racas.nome, p1.nome from parceria
inner join personagens as p2 on parceria.personagem2 = p2.id_personagens
inner join personagens as p1 on parceria.personagem1 = p1.id_personagens
inner join racas on p2.fk_racas = racas.id_racas;

-- puxando apenas os artesoes com parceiros
-- select p1.nome, p1.descricao, p1.url_imagem, racas.nome, p2.nome from parceria
-- inner join personagens as p1 on parceria.personagem1 = p1.id_personagens
-- inner join personagens as p2 on parceria.personagem2 = p2.id_personagens
-- inner join racas on p1.fk_racas = racas.id_racas;

-- insert into parceria (personagem1) values
-- (4);

select * from usuario;

update usuario set fk_resultado = 3 where id_usuario = 2;

insert into perguntas (pergunta) values
('Num trabalho em grupo, você prefere:'),
('Qual é seu maior defeito?'),
('Num combate você prefere:'),
('Qual ambiente te atrai?'),
('O que mais te irrita?'),
('Seus amigos te veem como:'),
('Diante de pressão você:'),
('Qual seria seu lema ?'),
('Você prefere ser uma arma ou um artesão?');

select * from alternativas;

insert into alternativas (alternativa, fk_perguntas) values
('Assume e faz do seu jeito', 1 ),
('Organiza tudo e divide tarefas', 1 ),
('Faz sua parte quieto', 1 ),
('Vai improvisando', 1 );

insert into alternativas (alternativa, fk_perguntas) values
('Ego alto', 2 ),
('Perfeccionismo', 2 ),
('Insegurança', 2 ),
('Impulsividade', 2 );

insert into alternativas (alternativa, fk_perguntas) values
('Ataque direto', 3 ),
('Estratégia', 3 ),
('Esperar o momento certo', 3 ),
('Fazer algo inesperado', 3 );

insert into alternativas (alternativa, fk_perguntas) values
('Um palco lotado', 4 ),
('Biblioteca organizada', 4 ),
('Lugar silencioso', 4 ),
('Parque de diversões', 4 );

insert into alternativas (alternativa, fk_perguntas) values
('Ser ignorado', 5 ),
('Bagunça', 5 ),
('Conflitos', 5 ),
('Rotina', 5 );

insert into alternativas (alternativa, fk_perguntas) values
('Marcante', 6 ),
('Confiável', 6 ),
('Reservado', 6 ),
('Divertido', 6 );

insert into alternativas (alternativa, fk_perguntas) values
('Vai pra cima', 7 ),
('Analisa tudo', 7 ),
('Hesita', 7 ),
('Age sem pensar muito', 7 );

insert into alternativas (alternativa, fk_perguntas) values
('Nasci pra ser estiloso e brilhar', 8 ),
('Tudo precisa fazer sentido', 8 ),
('Só quero paz', 8 ),
('Vamo ver no que dá', 8 );

insert into alternativas (alternativa, fk_perguntas) values
('Artesão', 9 ),
('Arma demoníaca', 9 );

insert into personagens (nome, descricao, url_imagem, fk_racas) values
('Tsubaki Nakatsukasa', 'Tsubaki Nakatsukasa é uma das protagonistas de Soul Eater, atuando como a parceira e arma demoníaca de Black☆Star. Sendo uma "Arma Multiforme", 
ela é incrivelmente versátil, capaz de se transformar em uma Shuriken Gigante, uma Kusarigama, uma bomba de fumaça e até na temida Lâmina Demoníaca. Tsubaki é a personificação da paciência,
 da gentileza e da maturidade, funcionando como a força calma que impede seu parceiro de fazer uma loucura completa. Enquanto o resto do mundo revira os olhos para o ego inflado de Black☆Star,
 ela é a única que enxerga sua verdadeira determinação, aceitando seus gritos e suas bizarrices com um sorriso acolhedor e uma lealdade inabalável. No fim das contas, é preciso muita força de vontade
 (e uma paciência de santa) para ser a parceira silenciosa de um ninja que insiste em brilhar mais que o sol.', 'https://i.pinimg.com/736x/a0/d0/39/a0d03918fbe65e839737a646a8bf0102.jpg', 2 ),
('Death the Kid', '​Death the Kid, ou simplesmente "Kid", é um dos protagonistas de Soul Eater, filho do próprio Shinigami-sama e um mestre de armas de elite que luta ao lado 
de suas pistolas gêmeas, as irmãs Liz e Patty Thompson. Kid é incrivelmente poderoso, elegante e refinado, mas carrega uma fraqueza que beira o ridículo: uma obsessão doentia por simetria.
Para ele, o mundo precisa estar em perfeito equilíbrio, e qualquer linha torta, quadro desalinhado ou assimetria estética é o suficiente para fazê-lo jorrar sangue pelo nariz, entrar em
crise existencial ou abandonar uma batalha crucial porque esqueceu se dobrou o papel higiênico perfeitamente na hora de sair de casa. O maior paradoxo de sua vida, viver pela simetria em
um mundo que é tudo... menos simétrico.', 'https://static.wikia.nocookie.net/souleater/images/0/0e/Death_the_Kid_%28Pre-Timeskip%29_Profile.png/revision/latest/thumbnail/width/360/height/360?cb=20130626171741', 1 ),
('Liz Thompson', 'Elizabeth Thompson, a mais velha das irmãs, assume a forma de uma das pistolas semiautomáticas de Death the Kid. Antes de irem para a AMAN (DWMA), Liz e sua irmã viviam 
nas ruas desertas e perigosas de Brooklyn, sobrevivendo como ladras marrentas. Hoje em dia, ela tenta manter uma postura mais madura, estilosa e pé no chão, agindo muitas vezes como a voz da 
razão da dupla. O grande problema é que a Liz é uma tremenda covarde quando o assunto é o sobrenatural; coloque ela para enfrentar um monstro gigante e ela vai à luta, mas mencione fantasmas, 
assombrações ou qualquer coisa levemente assustadora e ela entra em pânico total. Além disso, ela precisa de uma paciência infinita para aguentar as crises de simetria do Kid e as loucuras da sua 
irmã mais nova.', 'https://i.pinimg.com/736x/00/f8/31/00f831b97f288b11888a7ee7d06a88ab.jpg', 2),
('Patty Thompson', 'Patricia Thompson é a irmã mais nova e a outra pistola gêmea de Kid. Ao contrário de Liz, Patty é a pura definição de caos alegre e inocência psicótica. Ela está quase 
sempre sorrindo, rindo de coisas que ninguém mais acha graça e agindo como uma criança boba e hiperativa. Mas não se deixe enganar pelo jeito fofo: quando o clima esquenta, Patty revela um 
passado de delinquente durona, sendo perfeitamente capaz de quebrar monstros na porrada pura ou usar o Kid como porrete se ele desmaiar no meio da luta. Ela acha as crises existenciais do Kid a 
coisa mais divertida do mundo e, enquanto a Liz se desespera, Patty está apenas aproveitando o show com a maior vibe "sem pensamentos, apenas vibes".', 'https://i.pinimg.com/736x/34/a4/77/34a477cc820a92364b96ddf832d3b6b5.jpg', 2);

insert into personagens (nome, descricao, url_imagem, fk_racas) values
('Crona', 'Crona é uma das figuras mais trágicas e complexas de Soul Eater. Um garoto (ou garota) vítima dos experimentos cruéis de sua própria mãe, a bruxa Medusa, 
Crona teve o sangue substituído pelo misterioso Sangue Negro e foi forçada a se fundir à espada Ragnarok. Como resultado de uma infância baseada em abusos e isolamento, 
desenvolveu uma personalidade extremamente tímida, frágil e traumatizada, eternizada pelo seu famoso lema: "Eu não sei como lidar com isso". No entanto, sob o efeito da loucura 
do Sangue Negro, Crona se transforma em uma força de combate instável e assustadora. Sua história só ganha uma nova cor quando ela encontra o acolhimento e a determinação de Maka, que 
decide estender a mão para lhe ensinar o verdadeiro significado da amizade e da empatia.', 'https://i.pinimg.com/736x/43/45/00/434500971da557ea449addbdbf456cbb.jpg', 1),
('Ragnarok', 'Ragnarok, também conhecido como a "Espada Demoníaca", é a arma demoníaca que reside literalmente dentro do corpo de Crona na forma de Sangue Negro. 
Passando bem longe da dinâmica de respeito mútuo dos outros pares do anime, ele age como um parasita abusivo, barulhento e completamente sem noção. Ragnarok se manifesta 
brotando das costas de Crona para dar socos na sua cabeça, puxar suas bochechas e roubar sua comida. Em batalha, ele toma a forma de uma espada preta e grotesca capaz de emitir 
gritos e ondas sonoras devastadoras. Mas não se deixe enganar pela pose de valentão: Ragnarok é ridiculamente covarde quando a situação aperta e, no fundo, sua relação com Crona é o 
perfeito exemplo de um "bully" de estimação.', 'https://static.wikia.nocookie.net/souleater/images/2/24/Image15.png/revision/latest?cb=20130705162546&path-prefix=pt-br', 2);

 insert into personagens (nome, descricao, url_imagem, fk_racas) values
('Excalibur', 'Excalibur é a arma mais poderosa do mundo e um ser divino lendário. Apesar de seu imenso poder, ele é conhecido por sua personalidade extremamente egocêntrica e irritante, que possui uma lista de 1.000 regras que o seu portador deve seguir rigorosamente', 'https://i.pinimg.com/474x/67/f4/15/67f4154aca938853b91710f4a8298703.jpg', 2);

select * from personagens;

insert into parceria (personagem1, personagem2) values
(3, 4);

insert into parceria (personagem1, personagem2) values
(5, 6),
(5, 7);

insert into parceria (personagem1, personagem2) values
(8, 9);

insert into resultado (titulo, descricao, fk_personagens) values
('A Determinação Corajosa' , 'Se você tirou a Maka, você é a espinha dorsal de qualquer grupo. Organizada, focada e extremamente confiável, você é aquela pessoa que estuda o terreno antes de pisar. Para você, a biblioteca ideal é sinônimo de foco, e a bagunça (tanto física quanto mental) te irrita profundamente. Seu perfeccionismo pode ser uma cobrança pesada às vezes, mas é também o que te torna uma estrategista brilhante. Diante da pressão, você não foge: você analisa, cria um plano e lidera com coragem.', 1),
('O Descolado por Natureza' , 'Tirar o Soul significa que você exala uma vibe naturalmente "cool" e marcante. Você não precisa se esforçar para ser notado; seu estilo e sua lealdade falam por si mesmos. Embora compartilhe o espírito impulsivo e o orgulho de quem vai direto para o ataque, você tem uma maturidade protetora por trás dessa fachada desinteressada. Você detesta ser ignorado ou parecer vulnerável, mas quando a pressão aperta, você vai para cima com tudo para proteger quem importa para você.', 2),
('O Dono do Palco' , 'Se o seu resultado deu Black Star, você não veio ao mundo a passeio; você veio para transcender Deus! Você tem uma personalidade vibrante, uma autoconfiança inabalável e uma energia que simplesmente não pode ser ignorada. Às vezes as pessoas acham que você tem o ego inflado, mas a verdade é que você apenas conhece o seu próprio valor e não tem medo de brilhar. Em trabalhos ou combates, você prefere a ação direta e odeia ficar nas sombras. Seu lema é literalmente ser o centro das atenções, e sua determinação é sua maior força.', 3),
('A Calmaria e o Suporte' , 'Se o seu resultado foi a Tsubaki, você é o porto seguro de todos ao seu redor. Paciente, reservada e incrivelmente madura, você prefere agir na surdina, esperando o momento exato para fazer a sua parte sem precisar de aplausos. Conflitos te desgastam, e você prefere a harmonia de um lugar silencioso. Sua maior virtude é a empatia e a confiabilidade: você consegue lidar até com as personalidades mais difíceis (como o Black Star) com uma graça e uma calmaria invejáveis.', 4),
('A Busca pela Simetria Espiritual' , 'Se o seu resultado foi o Kid, o mundo ideal para você precisa ser perfeitamente equilibrado e fazer absoluto sentido. Seu perfeccionismo é lendário (e às vezes um pouco obsessivo), o que te torna incrivelmente detalhista e organizado. Você é o tipo de pessoa que assume a liderança do grupo para garantir que tudo saia impecável. Bagunça e assimetria te tiram do sério, mas a sua capacidade analítica e o seu senso de justiça fazem de você um aliado extraordinário e de extrema confiança.', 5),
('A Voz da Realidade com Estilo' , 'Tirar a Liz significa que você traz o equilíbrio perfeito entre querer curtir a vida e ter os pés no chão. Embora adore a diversão e deteste a rotina monótona, você tem um lado urbano, descolado e prático. Sua impulsividade às vezes fala mais alto, e você pode agir sem pensar muito quando está sob pressão, mas você sabe improvisar como ninguém. Você prefere ambientes vibrantes, odeia drama desnecessário e é aquela amiga estilosa que sempre diz a verdade na cara, doa a quem doer.', 6),
('O Caos Divertido' , 'Se você tirou a Patty, a rotina é a sua maior inimiga e o parque de diversões é o seu lar espiritual. Você é pura imprevisibilidade, alegria e impulsividade. Seus amigos te acham a pessoa mais divertida do mundo porque você simplesmente "vai ver no que dá" e improvisa o caminho inteiro. Diante da pressão ou no combate, suas reações são completamente inesperadas, o que assusta os inimigos e diverte os aliados. Você vive a vida com leveza e um sorriso no rosto.', 7),
('A Busca pela Paz Interior' , 'Tirar a Crona significa que você tem uma alma sensível, profunda e que preza pelo silêncio e pela tranquilidade acima de tudo. A insegurança e a hesitação diante da pressão são seus maiores desafios, fazendo com que você prefira se isolar em lugares calmos a encarar conflitos barulhentos. No entanto, sua natureza reservada esconde uma força silenciosa. No momento certo, quando você encontra seu equilíbrio, é capaz de demonstrar uma resiliência surpreendente. Tudo o que você quer é paz.', 8),
('O LENDÁRIO (e repetitivo) EXCALIBUR' , 'BUM! Parabéns, você tirou o ser mais sublime, glorioso e... pera, você só respondeu a mesma letra o quiz inteiro, não foi? Que falta de originalidade! Mas quer saber? Isso é absolutamente perfeito, porque você é idêntico a mim: teimoso, focado e maravilhosamente repetitivo! Sua insistência em não muda 	r de caminho só prova que você reconhece a perfeição quando a vê.
​Assim como a minha gloriosa lenda (que começou no século XII, sabias?), você não liga para o que os outros pensam e segue suas próprias regras, mesmo que isso signifique testar a paciência de todo mundo ao seu redor. Você é uma joia rara que exige respeito, adora um bom monólogo e sabe que nasceu para ser servido. Afinal, por que mudar as respostas quando você já atingiu o topo do mundo? Agora, antes de comemorar, por favor, prepare o meu chá e não esqueça de ler a regra número 452! FOOL!', 10);

-- alter table resultado add titulo varchar(30);

select * from resultado;

select p1.nome as personagem, p1.descricao, p1.url_imagem, racas.nome as raca, p2.nome as parceiro from parceria
left join personagens as p1 on parceria.personagem1 = p1.id_personagens
left join personagens as p2 on parceria.personagem2 = p2.id_personagens
left join racas on p1.fk_racas = racas.id_racas

union 

select p2.nome as personagem, p2.descricao, p2.url_imagem, racas.nome as raca, p1.nome as parceiro from parceria
right join personagens as p2 on parceria.personagem2 = p2.id_personagens
right join personagens as p1 on parceria.personagem1 = p1.id_personagens
right join racas on p2.fk_racas = racas.id_racas;

select * from alternativas;
select * from perguntas;
select *from parceria;
select * from resultado;

select * from perguntas 
join alternativas on id_pergunta = fk_perguntas;

show tables;

select * from avaliacao;
select * from usuario;
select * from resultado;


insert into avaliacao (nota, fk_usuario) values
(10, 3);

select * from personagens;

-- pergunta 1
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (1, 2), (1, 3);
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (2, 1), (2, 5);
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (3, 4), (3, 8);
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (4, 6), (4, 7);



-- pergunta 2
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (5, 2), (5, 3);
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (6, 1), (6, 5);
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (7, 4), (7, 8);
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (8, 6), (8, 7);

select * from resultados_alternativas;

-- pergunta 3
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (9, 2), (9, 3);
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (10, 1), (10, 5);
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (11, 4), (11, 8);
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (12, 6), (12, 7);



-- pergunta 4
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (13, 2), (13, 3);
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (14, 1), (14, 5);
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (15, 4), (15, 8);
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (16, 6), (16, 7);



-- pergunta 5
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (17, 2), (17, 3);
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (18, 1), (18, 5);
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (19, 4), (19, 8);
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (20, 6), (20, 7);



-- pergunta 6
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (21, 2), (21, 3);
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (22, 1), (22, 5);
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (23, 4), (23, 8);
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (24, 6), (24, 7);



-- pergunta 7
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (25, 2), (25, 3);
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (26, 1), (26, 5);
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (27, 4), (27, 8);
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (28, 6), (28, 7);



-- pergunta 8
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (29, 2), (29, 3);
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (30, 1), (30, 5);
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (31, 4), (31, 8);
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (32, 6), (32, 7);



-- pergunta 9
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (33, 1), (33, 3), (33, 5), (33, 8);
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (34, 2), (34, 4), (34, 6), (34, 7);



select 
    p.id_pergunta as 'numero pergunts',
    p.pergunta as 'pergunta',
    a.id_alternativas as 'id alternativa.',
    a.alternativa as 'alternativa',
    r.titulo as 'personagem pontua'
from perguntas p
join alternativas a ON p.id_pergunta = a.fk_perguntas
join resultados_alternativas ra ON a.id_alternativas = ra.fk_alternativa
join resultado r ON ra.fk_resultado = r.id_resultado
order by p.id_pergunta, a.id_alternativas; 	

select * from avaliacao;
select * from resultado;




alter table resultado add column url_imagem text;

UPDATE resultado 
SET url_imagem = 'https://pbs.twimg.com/profile_images/2422389850/sxf5bvlvvlm7g9sy5we2_400x400.jpeg' 
WHERE id_resultado = 1;

select id_resultado, titulo, descricao, fk_personagens, url_imagem from resultado;

select * from racas;
select * from personagens;

select p.id_pergunta, p.pergunta, a.id_alternativas, a.alternativa from perguntas p
join alternativas a on fk_perguntas = id_pergunta;

UPDATE personagens
SET descricao = 'Soul Evans, ou, para os mais íntimos, “Soul Eater”, é um dos principais protagonistas de Soul Eater. Ele atua ao lado de sua parceira, Maka, que o empunha quando assume a forma de uma imponente foice negra com detalhes em vermelho. Soul tem como maior objetivo ser estiloso em tudo o que faz. Para ele, a vida é como uma dança, e cada movimento precisa ter atitude. Seu lema é simples: o importante é ser maneiro… e caras maneiros nunca traem. Por trás dessa pose de bad boy desinteressado e do sorriso de dentes afiados, esconde-se um parceiro de uma lealdade absurda, disposto a sangrar e arriscar a própria alma para proteger a Maka — mesmo que o preço a pagar seja levar uns cascudos dela quando ele resolve agir feito um idiota. Seja tocando um piano macabro dentro da própria mente para canalizar o Sangue Negro ou apenas fingindo que não liga para as aulas da AMAAN, Soul prova que o verdadeiro estilo não está no visual, mas sim na sua determinação inabalável de ser o herói mais maneiro do pedaço.'
WHERE id_personagens = 2;

UPDATE personagens
SET descricao = 'Excalibur é a arma mais poderosa do mundo e um ser extraordinário e lendário. Apesar de seu imenso poder, ele é conhecido por sua personalidade extremamente egocêntrica e irritante, que possui uma lista de 1.000 regras que o seu portador deve seguir rigorosamente. Quem consegue empunhá-lo ganha asas de luz, teletransporte e um poder capaz de cortar o próprio espaço, mas o preço a pagar por essa divindade é ter que aguentar uma criaturinha de cartola que não cala a boca por um segundo, passa horas cantando sua própria música tema (*"Excalibur, Excalibur, from United King..."*) e interrompe qualquer um gritando *"Tolo!"* na menor oportunidade. Ele é tão insuportável que não são os mestres que o rejeitam, são os próprios humanos que preferem continuar fracos a ter que passar mais cinco minutos ouvindo suas histórias intermináveis sobre suas festas de chá no século passados. "Não ouvir um boa história mais de uma vez? TOLO!"'
WHERE id_personagens = 10;


insert into racas (nome, representante, descricao, url_imagem) values
('Bruxa', 'Medusa Gorgon', 'No universo de Soul Eater, as Bruxas representam uma das raças mais poderosas, temidas e antigas do mundo, posicionando-se como as antagonistas naturais da AMAAN. Ao contrário dos humanos comuns, elas possuem uma poderosa alma mágica e a capacidade natural de manipular feitiços complexos, geralmente temáticos e baseados em um animal específico. No entanto, sua biologia é governada pelo "Instinto Destrutivo": um impulso psicológico e espiritual avassalador que as compele ao caos, à crueldade e à destruição à medida que sua magia se desenvolve. Para resistirem à caçada dos Artesãos, elas se articulam na Organização das Bruxas, uma sociedade secreta, onde realizam convenções mágicas, coordenam ataques e compartilham feitiços de camuflagem para ocultar suas auras dos Artesãos mais talentosos.', 'https://64.media.tumblr.com/670d41f5e776911498094054d19e91c7/d5deb7a8704a720f-70/s540x810/d7b99c4058a2cc57d0c8c6fb6435a1a824447c1a.jpg'),
('Shinigami', 'Lorde Morte', 'No universo de Soul Eater, Shinigami (Deuses da Morte) representa uma raça de divindade, literal encarregada de manter a ordem mundial, julgar as almas corrompidas e conter a disseminação da loucura. Por ser uma linhagem extremamente restrita e rara, o conhecimento sobre sua total extensão é limitado, conhecendo-se fundamentalmente o Lorde Morte, o líder supremo e fundador da AMAAN e seu filho biológico, Death the Kid, um meio-shinigami em fase de maturação. A existência de um Shinigami está intrinsecamente ligada ao equilíbrio do mundo: eles possuem almas de proporções massivas que podem envolver cidades inteiras e são capazes de fragmentar sua própria essência para gerar herdeiros. O combate de um Shinigami transcende a dinâmica comum de parceiros; suas próprias almas contêm o poder da "Ordem", funcionando como a barreira definitiva contra o caos da loucura Kishin.', 'https://preview.redd.it/lord-death-runs-monsterverse-gauntlet-v0-1ahw7cukp7bd1.jpg?width=1080&crop=smart&auto=webp&s=9260a4ef28490f3660f53bee648ea8bd0ddb4238'),
('Monstro', 'Blair', 'No universo de Soul Eater, os Monstros constituem uma categoria diversa e intrigante de seres sencientes que habitam as margens da sociedade humana e mágica. Diferente das Bruxas, cuja magia é puramente espiritual, as capacidades dos Monstros parecem intrinsecamente ligadas à sua biologia, que é majoritariamente baseada em características, formas ou transformações de animais. Essas criaturas exibem uma grande variedade de alinhamentos e poderes: enquanto seres como Blair são felinos com forte inclinação mágica e múltiplas vidas que conseguem transitar livremente entre a forma animal e a humana, outros como Mosquito representam linhagens antigas capazes de alterar a própria forma física para retroceder a estágios evolutivos passados e mais brutais. Eles funcionam de forma autônoma no ecossistema do mundo, podendo atuar como aliados imprevisíveis ou ameaças perigosas para os Artesãos.', 'https://i.pinimg.com/736x/37/9b/1a/379b1a90fb235929fbd6729afec97168.jpg'),
('Kishin', 'Asura', 'No universo de Soul Eater, o Kishin (Encarnação da Loucura) representa o ápice da corrupção espiritual e a personificação viva do terror. Ao contrário dos Artesãos e das Armas que buscam a evolução através da ordem, um Kishin surge quando um indivíduo quebra o maior tabu do mundo: consumir almas humanas inocentes e puras para alcançar um poder avassalador. O primeiro e único exemplo é Asura, cuja busca obsessiva por escapar do medo o levou a devorar seu próprio parceiro arma e mergulhar na insanidade. A existência de um Kishin é uma ameaça existencial ao planeta todo, pois sua alma distorcida irradia a "Comprimento de Onda da Loucura", uma força invisível capaz de corromper a mente de humanos, bruxas e monstros ao redor, incitando o caos e destruindo a própria lógica da realidade.', 'https://i.redd.it/asura-aka-the-kishin-from-soul-eater-v0-wsio0vtbahuc1.jpg?width=320&format=pjpg&auto=webp&s=c8a56c04ff078c967ea8f0ed7610de1065f397dc');


insert into personagens (nome, descricao, url_imagem, fk_racas) values
('Franken Stein', 'Franken Stein, ou apenas Dr. Stein, é o cientista e mestre de armas mais poderoso que já se formou na AMAN. Ele é a definição perfeita do "cientista maluco": tem um parafuso gigante cravado na cabeça que ele gira o tempo todo para "organizar os pensamentos" e costuma se locomover pela escola deslizando em uma cadeira de escritório com rodinhas — a qual ele inevitavelmente capota toda santa vez. Stein é obcecado por anatomia e tem um desejo quase incontrolável de dissecar qualquer coisa viva que cruze seu caminho, incluindo seus próprios alunos e espécies raras. Mas por trás de toda essa excentricidade assustadora e das cicatrizes que cobrem seu corpo, ele é um gênio tático incomparável e um mentor protetor, Apesar de sua personalidade perturbada e de lutar constantemente contra a própria loucura interior, Stein é um professor extremamente protetor e um combatente genial, capaz de sintonizar o comprimento de onda de sua alma com quase qualquer um.', 'https://static.wikia.nocookie.net/souleater/images/2/27/4580594.jpg/revision/latest/smart/width/250/height/250?cb=20250619145414&path-prefix=pl', 1),
('Spirit Albarn', 'Spirit Albarn é o pai da Maka e a arma pessoal do próprio Shinigami-sama, ostentando o título supremo de "Death Scythe". Quando assume sua forma de arma, ele se transforma em uma foice preta afiadíssima, infinitamente mais poderosa que as comuns. Porém, quando está em sua forma humana, toda essa imponência desmorona: Spirit é um mulherengo incorrigível e um frequentador assíduo de cabarés, comportamento que custou seu casamento e fez com que sua filha, Maka, passasse a odiá-lo profundamente. Ele vive em uma crise eterna de choro, implorando pelo perdão e pelo amor da filha, morrendo de ciúmes do Soul e fazendo escândalo sempre que a Maka o ignora. Apesar de ser um completo desastre como figura paterna e um bobalhão no dia a dia, quando o mundo corre perigo real, Spirit limpa as lágrimas, assume uma postura fria e prova por que é a arma mais confiável do Deus da Morte.', 'https://pbs.twimg.com/media/E04KCF6VEAIvqK9.jpg', 2),
('Medusa Gorgon', 'Medusa Gorgon é uma bruxa ancestral incrivelmente brilhante, sádica e a primeira grande antagonista da história. Escondendo sua natureza cruel sob o disfarce de uma doce enfermeira na AMAAN, Medusa orquestrou planos terríveis debaixo do nariz do Lorde Morte, incluindo a libertação do Asura (o Deus da Loucura). Ela controla milhares de cobras vetoriais que habitam seu próprio corpo e usa o feitiço "Nake Snake Cobra Cobubra" para estraçalhar seus inimigos. Medusa é a personificação da falta de escrúpulos: ela não hesitou em usar e torturar psicologicamente a própria filha, Crona, em experimentos cruéis. Além de sua frieza, ela possui uma relação intensa e manipuladora com o Dr. Stein, aproveitando-se da mente instável dele para atiçar sua loucura interior e transformá-lo em uma peça-chave para seus experimentos e ambições caóticas.', 'https://64.media.tumblr.com/670d41f5e776911498094054d19e91c7/d5deb7a8704a720f-70/s540x810/d7b99c4058a2cc57d0c8c6fb6435a1a824447c1a.jpg', 3),
('Arachne', 'Arachne Gorgon é a irmã mais velha de Medusa, conhecida como a "Heresiarca" e a líder da organização terrorista Arachnophobia. Após passar 800 anos escondida na forma de milhares de aranhas espalhadas pelo mundo para escapar da fúria de Shinigami-sama, ela retorna ao seu corpo físico com toda a sua imponência. Ao contrário do estilo mais direto de sua irmã, Arachne prefere agir nas sombras. Ela usa fios de teia invisíveis para controlar mentes e amplificar a loucura no mundo. Extremamente elegante e majestosa, o ápice de seu plano se consolida quando ela encontra o Kishin Ashura e forma uma aliança sombria com ele, mantendo-se sempre por perto para usar o poder avassalador do Deus da Loucura como o escudo definitivo para sua própria soberania.', 'https://i.pinimg.com/736x/72/89/37/728937bf4164bebcd3c55c1aaefb6b53.jpg', 3),
('Lorde Morte', 'Lorde Morte, ou simplesmente Shinigami-sama, é o Deus da Morte, o líder supremo da AMAN e a entidade que mantém a ordem no mundo. No passado, ele tinha uma aparência realista e assustadora que aterrorizava as pessoas, então decidiu mudar sua forma para uma silhueta preta e cômica, usando uma máscara de caveira estilizada e mãos gigantes em formato de luvas brancas. Ele fala com uma voz fina, alegre e super descontraída, cumprimentando os outros com o seu famoso "Waku waku! 42-42-564". Porém, não se deixe enganar pela pose de mascote bobo: o Lorde Morte é uma força divina incomparável. Quando alguém quebra as regras ou ameaça a paz, ele usa o devastador "Shinigami Chop" (um tapa seco e estúpido de tão forte) ou empunha suas Death Scythes para lembrar a todos por que ele é a própria personificação da morte.', 'https://preview.redd.it/lord-death-runs-monsterverse-gauntlet-v0-1ahw7cukp7bd1.jpg?width=1080&crop=smart&auto=webp&s=9260a4ef28490f3660f53bee648ea8bd0ddb4238', 4),
('Blair', 'Blair é uma personagem que causa uma confusão hilária logo no começo da história. Inicialmente confundida com uma bruxa poderosa por Maka e Soul devido ao seu imenso poder mágico, seu chapéu pontudo e suas roupas escuras, ela se revela, na verdade, uma gata preta mágica com habilidades extraordinárias e nove vidas para gastar. Blair adora assumir uma forma humana extremamente atraente e sedutora, o que quase faz o Soul ter hemorragias nasais constantes, já que ela adora se atirar para cima dele e brincar com sua pose de "cara maneiro". Ela usa uma magia baseada em abóboras e fogos de artifício (o feitiço "Pumpkin Pumpkin") e adora flertar, tomar banhos demorados e curtir a vida. Depois de esclarecido o mal-entendido de sua identidade, Blair acaba se mudando para o apartamento de Maka e Soul, tornando-se a "mascote" mais folgada e divertida da casa.', 'https://i.pinimg.com/736x/37/9b/1a/379b1a90fb235929fbd6729afec97168.jpg', 5),
('Mifune', 'Mifune, conhecido como o "Deus da Espada", é um samurai de elite e um dos guerreiros humanos mais formidáveis de Soul Eater. Mesmo sem possuir um parceiro que se transforma em arma ou habilidades mágicas, ele é capaz de enfrentar artesãos de alto nível usando seu lendário Estilo das Infinitas Espadas (Mugenryu), onde ele espalha dezenas de katanas pelo campo de batalha para alternar entre elas em uma velocidade impressionante. Apesar de sua aura de guerreiro frio e implacável, Mifune possui um coração gigante e um senso de honra inabalável. Ele abandonou sua vida como guarda-costas da máfia para se dedicar inteiramente à proteção da pequena bruxa Angela, aceitando trabalhar para organizações sombrias como a Arachnophobia apenas para garantir que a garotinha ficasse em segurança. Seu maior rival e eventual admiração é Black Star, com quem trava batalhas intensas baseadas no puro respeito de guerreiro.', 'https://i.redd.it/did-you-guys-ever-wonder-how-maka-or-kid-would-fair-in-a-v0-bywdhzajgvfd1.jpg?width=640&format=pjpg&auto=webp&s=5b13a1d103e1dc23fa4d9fd2f0da159d89643e42', 1),
('Angela Leon', 'Angela Leon é uma bruxa muito jovem e inocente que, devido à sua idade, ainda não compreende a natureza sombria ou a maldade que geralmente cercam as bruxas adultas. Sua magia é baseada em camaleões, o que permite que ela mude de forma ou desapareça no ambiente, embora ela prefira usar seus poderes para brincar ou fazer birra. Angela é extremamente fofa, enérgica e mimada, agindo como qualquer criança comum da sua idade. Ela enxerga Mifune não apenas como seu guarda-costas, mas como uma figura paterna e seu porto seguro, sendo completamente dependente dele para tudo. O maior perigo para Angela não é o seu próprio poder, mas sim o fato de que o mundo a caça pelo simples fato de ter nascido bruxa, tornando-a o motivo pelo qual Mifune está disposto a enfrentar o mundo inteiro para protegê-la.', 'https://static.wikia.nocookie.net/souleater/images/0/01/Angela_Leon_Profile.png/revision/latest?cb=20160310063938', 3),
('Kishin Asura', 'Asura, mais conhecido como o "Kishin", é o primeiro Deus da Loucura e o antagonista definitivo da história. No passado, ele foi um dos guerreiros de elite do Lorde Morte, mas seu medo paranoico de tudo e de todos o levou a consumir almas humanas inocentes e até a sua própria parceira arma para obter poder absoluto, tornando-se o primeiro Kishin. Asura é a própria personificação do pavor e da insanidade; sua presença exala um "Comprimento de Onda de Loucura" tão devastador que é capaz de fazer pessoas comuns perderem a sanidade instantaneamente ao redor do mundo. Visualmente bizarro, ele se esconde atrás de camadas de faixas que cobrem seu corpo, tem três olhos (sendo um na testa) e usa a própria pele esticada como roupa. Ele não busca dominar o mundo por maldade pura, mas sim para mergulhá-lo no caos total, acreditando piamente que a única forma de se livrar do medo é eliminando a lógica, a ordem e a própria paz.', 'https://static.wikia.nocookie.net/fictions-characters/images/f/fe/Asura.jpg/revision/latest/scale-to-width-down/290?cb=20150505160644', 6);

select p.id_pergunta as id_pergunta, p.pergunta as pergunta, a.id_alternativas as id_alternativa, a.alternativa as alternativa from perguntas p
    join alternativas a on a.fk_perguntas = p.id_pergunta;



-- segunda versao

create database diario_amaan;
use diario_amaan;

create table racas (
id_racas int primary key auto_increment,
nome varchar(45),
representante varchar(45),
descricao text,
url_imagem text
);


create table perguntas (
id_pergunta int primary key auto_increment,
pergunta text
);

create table personagens (
id_personagens int primary key auto_increment,
nome varchar(45),
descricao text,
url_imagem varchar(255),
fk_racas int,
constraint fkctRacas
foreign key (fk_racas) references racas(id_racas)
);

-- alter table personagens drop foreign key fkctParceiro;

create table alternativas (
id_alternativas int primary key auto_increment,
alternativa text,
fk_perguntas int,
constraint fkctPerguntas
foreign key (fk_perguntas) references perguntas(id_pergunta)
);

create table resultado (
id_resultado int primary key auto_increment,
titulo varchar(50),
descricao text,
fk_personagens int,
constraint fkctpersonagens
foreign key (fk_personagens) references personagens(id_personagens)
);

create table usuario (
id_usuario int primary key auto_increment,
nome varchar(45),
email varchar(75),
senha varchar (45),
data_cadastro datetime default current_timestamp,
fk_resultado int,
constraint fkctResultado
foreign key (fk_resultado) references resultado(id_resultado)
);

-- insert into usuario (nome, email, senha, data_cadastro) values
-- ('Sarah Tiemi', 'sarahtiemi@gmail.com', 'senhaForte123', '2026-02-21 14:20:21');
-- insert into usuario (nome, email, senha, data_cadastro) values
-- ('Douglas', 'dougdoug@gmail.com', 'senhaForte321', '2026-02-11 13:33:20');
-- insert into usuario (nome, email, senha, data_cadastro) values
-- ('Ana', 'anacarolina@gmail.com', 'senhaForte231', '2026-03-11 13:33:20');
-- insert into usuario (nome, email, senha, data_cadastro) values
-- ('Marcy', 'marcelly@gmail.com', 'senhaForte132', '2026-04-11 13:33:20');
-- insert into usuario (nome, email, senha, data_cadastro) values
-- ('MaryMoon', 'mariafernanda@gmail.com', 'senhaForte312', '2026-01-12 13:33:20');
-- insert into usuario (nome, email, senha, data_cadastro) values
-- ('lucaswhite', 'lucaswite@gmail.com', 'senhaForte333', '2026-06-12 13:33:20');
-- insert into usuario (nome, email, senha, data_cadastro) values
-- ('Barney', 'yuriday@gmail.com', 'senhaForte222', '2026-06-01 13:33:20');
-- insert into usuario (nome, email, senha, data_cadastro) values
-- ('Mariano', 'marioloo@gmail.com', 'senhaForte111', '2026-03-03 13:33:20');
-- insert into usuario (nome, email, senha, data_cadastro, fk_resultado) values
-- ('tobiasJR', 'tobbiazin@gmail.com', 'senhaForte000', '2026-05-22 13:33:20', 1);
insert into usuario (nome, email, senha, data_cadastro, fk_resultado) values
('jinFrost', 'lucasfrost@gmail.com', 'senhaForte777', '2026-03-11 13:33:20', 5);

create table resultados_alternativas (
fK_alternativa int,
fk_resultado int,
primary key (fk_alternativa, fk_resultado),
foreign key (fk_resultado) references resultado(id_resultado),
foreign key (fk_alternativa) references alternativas(id_alternativas)
);

create table avaliacao(
id_avaliacao int auto_increment primary key,
nota int,
fk_usuario int,
constraint ctFkUsuario
foreign key (fk_usuario) references usuario(id_usuario)
);

alter table avaliacao modify column fk_usuario int unique;

desc avaliacao;

select * from racas;

insert into personagens (nome, descricao, url_imagem) values  ('Maka Albarn', 'Maka Albarn é uma das principais protagonistas de Soul Eater, trabalhando juntamente com seu parceiro Soul Evans, a arma demoníaca que ela empunha quando ele   assume a forma de uma enorme foice preta e vermelha. Maka é inteligente, determinada e provavelmente uma das únicas pessoas naquele mundo que realmente leva os estudos a sério, acreditando fielmente  que uma alma saudável habita um corpo saudável e uma mente saudável, enquanto passa o resto do tempo dando surra em monstros, bruxas e, às vezes, no próprio Soul quando ele fala besteira demais.  Mesmo cercada por dificuldades, Maka continua seguindo em frente com seus amigos, mantendo coragem, disciplina e um equilíbrio único.', 'https://image-cdn-ak.spotifycdn.com/image/ab67706c0000da8419ed2f2767655049166d6726');

insert into personagens (nome, descricao, url_imagem) values  ('Soul Evans', 'Soul Evans, ou, para os mais íntimos, “Soul Eater”, é um dos principais protagonistas de Soul Eater. Ele atua ao lado de sua parceira, Maka, que o empunha quando assume a forma de uma imponente foice negra com detalhes em vermelho. Soul tem como maior objetivo ser estiloso em tudo o que faz. Para ele, a vida é como uma dança, e cada movimento precisa ter atitude. Seu lema é simples: o importante é ser maneiro… e caras maneiros nunca traem.', 'https://i.pinimg.com/originals/0d/94/4a/0d944a0ca56ba87a07914290838506ad.jpg');


insert into racas (nome, representante, descricao, url_imagem) values
('Artesão', 'Maka Albarn', 'No universo de Soul Eater, enquanto as Armas Demoníacas fornecem o poder
de corte e destruição, os Artesãos (Meisters) são os guerreiros encarregues de
as empunhar. Eles funcionam como os estrategistas, os atletas e, acima de tudo,
os condutores da energia espiritual durante um combate. Sem um Meister
compatível, mesmo a arma mais poderosa do mundo torna-se inútil ou
impossível de manusear. Os Meisters mais talentosos possuem a habilidade
de "enxergar" ou sentir a aura e o comprimento de onda das almas ao seu
redor. Esta capacidade serve para várias funções: Detectar Inimigos, Avaliar Poder, Sincronização de alma.', 'https://preview.redd.it/how-powerful-is-maka-albarn-soul-eater-in-the-anime-v0-yn6p3nmsfgpe1.jpeg?width=640&crop=smart&auto=webp&s=147375296e1d0fc81998f1ff5883dbee77c1ec68');

insert into racas (nome, representante, descricao, url_imagem) values
('Arma Demoníaca', 'Soul Eater', 'No universo de Soul Eater, as Armas Demoníacas representam uma das
criações mais distintas da ficção. Ao contrário de ferramentas inanimadas,
estas armas são seres humanos com uma linhagem genética específica que lhes
permite transformar o seu corpo em armamento de combate, mantendo a sua
consciência e personalidade intactas durante o processo. O combate nunca é solitário. Ele baseia-se numa parceria entre a Arma (o
indivíduo que se transforma) e o Artesão ou Meister (aquele que a empunha).
Esta relação é puramente simbiótica: o Meister fornece a estratégia e a força
física, enquanto a Arma fornece a potência destrutiva e a amplificação
espiritual.', 'https://cdn.myanimelist.net/s/common/uploaded_files/1444375217-88a4e7da60ec09990a9c2324e52d46a6.jpeg');

update personagens set fk_racas = 1 where id_personagens = 1;
update personagens set fk_racas = 2 where id_personagens = 2;

create table parceria (
id_parceria int primary key auto_increment,
personagem1 int,
personagem2 int,
foreign key (personagem1) REFERENCES personagens(id_personagens),
foreign key (personagem2) REFERENCES personagens(id_personagens)
);

insert into parceria (personagem1, personagem2) values
(1, 2);


insert into personagens (nome, descricao, url_imagem, fk_racas) values
('Black Star', 'Black Star é um dos protagonistas de Soul Eater, lutando ao lado de sua parceira Tsubaki, a arma demoníaca capaz de assumir diversas formas para acompanhar seu estilo exagerado de combate. Chamativo, escandaloso e incapaz de ficar cinco segundos sem anunciar sua própria grandeza, Black☆Star transforma qualquer batalha em um espetáculo particular, mesmo quando claramente ninguém pediu por isso, sem dúvidas o ninja mais barulhento que você já viu. Seus gritos, suas atitudes, e seu jeito único nunca pareceu incomodar sua parceira, a qual guarda uma grande admiração por black star.
Será que ele vai conseguir alcançar seu objetivo de se tornar mais forte que deus?', 'https://cdna.artstation.com/p/assets/images/images/062/342/542/large/retratosanime-166.jpg?1682924972', 1);


select * from parceria;
select * from personagens;
select * from racas;

select personagens.nome, personagens.descricao, personagens.url_imagem, racas.nome from personagens
inner join racas on personagens.fk_racas = racas.id_racas;

-- puxando todos os artesaos, mesmo os sem parceiros
select p1.nome, p1.descricao, p1.url_imagem, racas.nome, p2.nome from parceria
left join personagens as p1 on parceria.personagem1 = p1.id_personagens
left join personagens as p2 on parceria.personagem2 = p2.id_personagens
left join racas on p1.fk_racas = racas.id_racas

union 

-- puxando todos os parceiros, mesmo sem artesao
select p2.nome, p2.descricao, p2.url_imagem, racas.nome, p1.nome from parceria
inner join personagens as p2 on parceria.personagem2 = p2.id_personagens
inner join personagens as p1 on parceria.personagem1 = p1.id_personagens
inner join racas on p2.fk_racas = racas.id_racas;

-- puxando apenas os artesoes com parceiros
-- select p1.nome, p1.descricao, p1.url_imagem, racas.nome, p2.nome from parceria
-- inner join personagens as p1 on parceria.personagem1 = p1.id_personagens
-- inner join personagens as p2 on parceria.personagem2 = p2.id_personagens
-- inner join racas on p1.fk_racas = racas.id_racas;

-- insert into parceria (personagem1) values
-- (4);

select * from usuario;

update usuario set fk_resultado = 3 where id_usuario = 2;

insert into perguntas (pergunta) values
('Num trabalho em grupo, você prefere:'),
('Qual é seu maior defeito?'),
('Num combate você prefere:'),
('Qual ambiente te atrai?'),
('O que mais te irrita?'),
('Seus amigos te veem como:'),
('Diante de pressão você:'),
('Qual seria seu lema ?'),
('Você prefere ser uma arma ou um artesão?');

select * from alternativas;

insert into alternativas (alternativa, fk_perguntas) values
('Assume e faz do seu jeito', 1 ),
('Organiza tudo e divide tarefas', 1 ),
('Faz sua parte quieto', 1 ),
('Vai improvisando', 1 );

insert into alternativas (alternativa, fk_perguntas) values
('Ego alto', 2 ),
('Perfeccionismo', 2 ),
('Insegurança', 2 ),
('Impulsividade', 2 );

insert into alternativas (alternativa, fk_perguntas) values
('Ataque direto', 3 ),
('Estratégia', 3 ),
('Esperar o momento certo', 3 ),
('Fazer algo inesperado', 3 );

insert into alternativas (alternativa, fk_perguntas) values
('Um palco lotado', 4 ),
('Biblioteca organizada', 4 ),
('Lugar silencioso', 4 ),
('Parque de diversões', 4 );

insert into alternativas (alternativa, fk_perguntas) values
('Ser ignorado', 5 ),
('Bagunça', 5 ),
('Conflitos', 5 ),
('Rotina', 5 );

insert into alternativas (alternativa, fk_perguntas) values
('Marcante', 6 ),
('Confiável', 6 ),
('Reservado', 6 ),
('Divertido', 6 );

insert into alternativas (alternativa, fk_perguntas) values
('Vai pra cima', 7 ),
('Analisa tudo', 7 ),
('Hesita', 7 ),
('Age sem pensar muito', 7 );

insert into alternativas (alternativa, fk_perguntas) values
('Nasci pra ser estiloso e brilhar', 8 ),
('Tudo precisa fazer sentido', 8 ),
('Só quero paz', 8 ),
('Vamo ver no que dá', 8 );

insert into alternativas (alternativa, fk_perguntas) values
('Artesão', 9 ),
('Arma demoníaca', 9 );

insert into personagens (nome, descricao, url_imagem, fk_racas) values
('Tsubaki Nakatsukasa', 'Tsubaki Nakatsukasa é uma das protagonistas de Soul Eater, atuando como a parceira e arma demoníaca de Black☆Star. Sendo uma "Arma Multiforme", 
ela é incrivelmente versátil, capaz de se transformar em uma Shuriken Gigante, uma Kusarigama, uma bomba de fumaça e até na temida Lâmina Demoníaca. Tsubaki é a personificação da paciência,
 da gentileza e da maturidade, funcionando como a força calma que impede seu parceiro de fazer uma loucura completa. Enquanto o resto do mundo revira os olhos para o ego inflado de Black☆Star,
 ela é a única que enxerga sua verdadeira determinação, aceitando seus gritos e suas bizarrices com um sorriso acolhedor e uma lealdade inabalável. No fim das contas, é preciso muita força de vontade
 (e uma paciência de santa) para ser a parceira silenciosa de um ninja que insiste em brilhar mais que o sol.', 'https://i.pinimg.com/736x/a0/d0/39/a0d03918fbe65e839737a646a8bf0102.jpg', 2 ),
('Death the Kid', '​Death the Kid, ou simplesmente "Kid", é um dos protagonistas de Soul Eater, filho do próprio Shinigami-sama e um mestre de armas de elite que luta ao lado 
de suas pistolas gêmeas, as irmãs Liz e Patty Thompson. Kid é incrivelmente poderoso, elegante e refinado, mas carrega uma fraqueza que beira o ridículo: uma obsessão doentia por simetria.
Para ele, o mundo precisa estar em perfeito equilíbrio, e qualquer linha torta, quadro desalinhado ou assimetria estética é o suficiente para fazê-lo jorrar sangue pelo nariz, entrar em
crise existencial ou abandonar uma batalha crucial porque esqueceu se dobrou o papel higiênico perfeitamente na hora de sair de casa. O maior paradoxo de sua vida, viver pela simetria em
um mundo que é tudo... menos simétrico.', 'https://static.wikia.nocookie.net/souleater/images/0/0e/Death_the_Kid_%28Pre-Timeskip%29_Profile.png/revision/latest/thumbnail/width/360/height/360?cb=20130626171741', 1 ),
('Liz Thompson', 'Elizabeth Thompson, a mais velha das irmãs, assume a forma de uma das pistolas semiautomáticas de Death the Kid. Antes de irem para a AMAN (DWMA), Liz e sua irmã viviam 
nas ruas desertas e perigosas de Brooklyn, sobrevivendo como ladras marrentas. Hoje em dia, ela tenta manter uma postura mais madura, estilosa e pé no chão, agindo muitas vezes como a voz da 
razão da dupla. O grande problema é que a Liz é uma tremenda covarde quando o assunto é o sobrenatural; coloque ela para enfrentar um monstro gigante e ela vai à luta, mas mencione fantasmas, 
assombrações ou qualquer coisa levemente assustadora e ela entra em pânico total. Além disso, ela precisa de uma paciência infinita para aguentar as crises de simetria do Kid e as loucuras da sua 
irmã mais nova.', 'https://i.pinimg.com/736x/00/f8/31/00f831b97f288b11888a7ee7d06a88ab.jpg', 2),
('Patty Thompson', 'Patricia Thompson é a irmã mais nova e a outra pistola gêmea de Kid. Ao contrário de Liz, Patty é a pura definição de caos alegre e inocência psicótica. Ela está quase 
sempre sorrindo, rindo de coisas que ninguém mais acha graça e agindo como uma criança boba e hiperativa. Mas não se deixe enganar pelo jeito fofo: quando o clima esquenta, Patty revela um 
passado de delinquente durona, sendo perfeitamente capaz de quebrar monstros na porrada pura ou usar o Kid como porrete se ele desmaiar no meio da luta. Ela acha as crises existenciais do Kid a 
coisa mais divertida do mundo e, enquanto a Liz se desespera, Patty está apenas aproveitando o show com a maior vibe "sem pensamentos, apenas vibes".', 'https://i.pinimg.com/736x/34/a4/77/34a477cc820a92364b96ddf832d3b6b5.jpg', 2);

insert into personagens (nome, descricao, url_imagem, fk_racas) values
('Crona', 'Crona é uma das figuras mais trágicas e complexas de Soul Eater. Um garoto (ou garota) vítima dos experimentos cruéis de sua própria mãe, a bruxa Medusa, 
Crona teve o sangue substituído pelo misterioso Sangue Negro e foi forçada a se fundir à espada Ragnarok. Como resultado de uma infância baseada em abusos e isolamento, 
desenvolveu uma personalidade extremamente tímida, frágil e traumatizada, eternizada pelo seu famoso lema: "Eu não sei como lidar com isso". No entanto, sob o efeito da loucura 
do Sangue Negro, Crona se transforma em uma força de combate instável e assustadora. Sua história só ganha uma nova cor quando ela encontra o acolhimento e a determinação de Maka, que 
decide estender a mão para lhe ensinar o verdadeiro significado da amizade e da empatia.', 'https://i.pinimg.com/736x/43/45/00/434500971da557ea449addbdbf456cbb.jpg', 1),
('Ragnarok', 'Ragnarok, também conhecido como a "Espada Demoníaca", é a arma demoníaca que reside literalmente dentro do corpo de Crona na forma de Sangue Negro. 
Passando bem longe da dinâmica de respeito mútuo dos outros pares do anime, ele age como um parasita abusivo, barulhento e completamente sem noção. Ragnarok se manifesta 
brotando das costas de Crona para dar socos na sua cabeça, puxar suas bochechas e roubar sua comida. Em batalha, ele toma a forma de uma espada preta e grotesca capaz de emitir 
gritos e ondas sonoras devastadoras. Mas não se deixe enganar pela pose de valentão: Ragnarok é ridiculamente covarde quando a situação aperta e, no fundo, sua relação com Crona é o 
perfeito exemplo de um "bully" de estimação.', 'https://static.wikia.nocookie.net/souleater/images/2/24/Image15.png/revision/latest?cb=20130705162546&path-prefix=pt-br', 2);

 insert into personagens (nome, descricao, url_imagem, fk_racas) values
('Excalibur', 'Excalibur é a arma mais poderosa do mundo e um ser divino lendário. Apesar de seu imenso poder, ele é conhecido por sua personalidade extremamente egocêntrica e irritante, que possui uma lista de 1.000 regras que o seu portador deve seguir rigorosamente', 'https://i.pinimg.com/474x/67/f4/15/67f4154aca938853b91710f4a8298703.jpg', 2);

select * from personagens;

insert into parceria (personagem1, personagem2) values
(3, 4);

insert into parceria (personagem1, personagem2) values
(5, 6),
(5, 7);

insert into parceria (personagem1, personagem2) values
(8, 9);

insert into resultado (titulo, descricao, fk_personagens) values
('A Determinação Corajosa' , 'Se você tirou a Maka, você é a espinha dorsal de qualquer grupo. Organizada, focada e extremamente confiável, você é aquela pessoa que estuda o terreno antes de pisar. Para você, a biblioteca ideal é sinônimo de foco, e a bagunça (tanto física quanto mental) te irrita profundamente. Seu perfeccionismo pode ser uma cobrança pesada às vezes, mas é também o que te torna uma estrategista brilhante. Diante da pressão, você não foge: você analisa, cria um plano e lidera com coragem.', 1),
('O Descolado por Natureza' , 'Tirar o Soul significa que você exala uma vibe naturalmente "cool" e marcante. Você não precisa se esforçar para ser notado; seu estilo e sua lealdade falam por si mesmos. Embora compartilhe o espírito impulsivo e o orgulho de quem vai direto para o ataque, você tem uma maturidade protetora por trás dessa fachada desinteressada. Você detesta ser ignorado ou parecer vulnerável, mas quando a pressão aperta, você vai para cima com tudo para proteger quem importa para você.', 2),
('O Dono do Palco' , 'Se o seu resultado deu Black Star, você não veio ao mundo a passeio; você veio para transcender Deus! Você tem uma personalidade vibrante, uma autoconfiança inabalável e uma energia que simplesmente não pode ser ignorada. Às vezes as pessoas acham que você tem o ego inflado, mas a verdade é que você apenas conhece o seu próprio valor e não tem medo de brilhar. Em trabalhos ou combates, você prefere a ação direta e odeia ficar nas sombras. Seu lema é literalmente ser o centro das atenções, e sua determinação é sua maior força.', 3),
('A Calmaria e o Suporte' , 'Se o seu resultado foi a Tsubaki, você é o porto seguro de todos ao seu redor. Paciente, reservada e incrivelmente madura, você prefere agir na surdina, esperando o momento exato para fazer a sua parte sem precisar de aplausos. Conflitos te desgastam, e você prefere a harmonia de um lugar silencioso. Sua maior virtude é a empatia e a confiabilidade: você consegue lidar até com as personalidades mais difíceis (como o Black Star) com uma graça e uma calmaria invejáveis.', 4),
('A Busca pela Simetria Espiritual' , 'Se o seu resultado foi o Kid, o mundo ideal para você precisa ser perfeitamente equilibrado e fazer absoluto sentido. Seu perfeccionismo é lendário (e às vezes um pouco obsessivo), o que te torna incrivelmente detalhista e organizado. Você é o tipo de pessoa que assume a liderança do grupo para garantir que tudo saia impecável. Bagunça e assimetria te tiram do sério, mas a sua capacidade analítica e o seu senso de justiça fazem de você um aliado extraordinário e de extrema confiança.', 5),
('A Voz da Realidade com Estilo' , 'Tirar a Liz significa que você traz o equilíbrio perfeito entre querer curtir a vida e ter os pés no chão. Embora adore a diversão e deteste a rotina monótona, você tem um lado urbano, descolado e prático. Sua impulsividade às vezes fala mais alto, e você pode agir sem pensar muito quando está sob pressão, mas você sabe improvisar como ninguém. Você prefere ambientes vibrantes, odeia drama desnecessário e é aquela amiga estilosa que sempre diz a verdade na cara, doa a quem doer.', 6),
('O Caos Divertido' , 'Se você tirou a Patty, a rotina é a sua maior inimiga e o parque de diversões é o seu lar espiritual. Você é pura imprevisibilidade, alegria e impulsividade. Seus amigos te acham a pessoa mais divertida do mundo porque você simplesmente "vai ver no que dá" e improvisa o caminho inteiro. Diante da pressão ou no combate, suas reações são completamente inesperadas, o que assusta os inimigos e diverte os aliados. Você vive a vida com leveza e um sorriso no rosto.', 7),
('A Busca pela Paz Interior' , 'Tirar a Crona significa que você tem uma alma sensível, profunda e que preza pelo silêncio e pela tranquilidade acima de tudo. A insegurança e a hesitação diante da pressão são seus maiores desafios, fazendo com que você prefira se isolar em lugares calmos a encarar conflitos barulhentos. No entanto, sua natureza reservada esconde uma força silenciosa. No momento certo, quando você encontra seu equilíbrio, é capaz de demonstrar uma resiliência surpreendente. Tudo o que você quer é paz.', 8),
('O LENDÁRIO (e repetitivo) EXCALIBUR' , 'BUM! Parabéns, você tirou o ser mais sublime, glorioso e... pera, você só respondeu a mesma letra o quiz inteiro, não foi? Que falta de originalidade! Mas quer saber? Isso é absolutamente perfeito, porque você é idêntico a mim: teimoso, focado e maravilhosamente repetitivo! Sua insistência em não muda 	r de caminho só prova que você reconhece a perfeição quando a vê.
​Assim como a minha gloriosa lenda (que começou no século XII, sabias?), você não liga para o que os outros pensam e segue suas próprias regras, mesmo que isso signifique testar a paciência de todo mundo ao seu redor. Você é uma joia rara que exige respeito, adora um bom monólogo e sabe que nasceu para ser servido. Afinal, por que mudar as respostas quando você já atingiu o topo do mundo? Agora, antes de comemorar, por favor, prepare o meu chá e não esqueça de ler a regra número 452! FOOL!', 10);

-- alter table resultado add titulo varchar(30);

select * from resultado;

select p1.nome as personagem, p1.descricao, p1.url_imagem, racas.nome as raca, p2.nome as parceiro from parceria
left join personagens as p1 on parceria.personagem1 = p1.id_personagens
left join personagens as p2 on parceria.personagem2 = p2.id_personagens
left join racas on p1.fk_racas = racas.id_racas

union 

select p2.nome as personagem, p2.descricao, p2.url_imagem, racas.nome as raca, p1.nome as parceiro from parceria
right join personagens as p2 on parceria.personagem2 = p2.id_personagens
right join personagens as p1 on parceria.personagem1 = p1.id_personagens
right join racas on p2.fk_racas = racas.id_racas;

select * from alternativas;
select * from perguntas;
select *from parceria;
select * from resultado;

select * from perguntas 
join alternativas on id_pergunta = fk_perguntas;

show tables;

select * from avaliacao;
select * from usuario;
select * from resultado;

select count(*) as qtd_cadastros, month(data_cadastro) as mes from usuario group by month(data_cadastro) order by mes;

select round(AVG(nota), 1) as nota from avaliacao;
select count(id_usuario) as qtd_usuarios from usuario; 
select count(id_avaliacao) as qtd_avaliacoes from avaliacao;
select month(data_cadastro) from usuario group by month(data_cadastro) order by count(month(data_cadastro)) desc limit 1; --

insert into avaliacao (nota, fk_usuario) values
(10, 3);

select * from personagens;

-- pergunta 1
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (1, 2), (1, 3);
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (2, 1), (2, 5);
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (3, 4), (3, 8);
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (4, 6), (4, 7);



-- pergunta 2
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (5, 2), (5, 3);
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (6, 1), (6, 5);
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (7, 4), (7, 8);
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (8, 6), (8, 7);

select * from resultados_alternativas;

-- pergunta 3
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (9, 2), (9, 3);
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (10, 1), (10, 5);
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (11, 4), (11, 8);
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (12, 6), (12, 7);



-- pergunta 4
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (13, 2), (13, 3);
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (14, 1), (14, 5);
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (15, 4), (15, 8);
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (16, 6), (16, 7);



-- pergunta 5
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (17, 2), (17, 3);
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (18, 1), (18, 5);
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (19, 4), (19, 8);
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (20, 6), (20, 7);



-- pergunta 6
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (21, 2), (21, 3);
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (22, 1), (22, 5);
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (23, 4), (23, 8);
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (24, 6), (24, 7);



-- pergunta 7
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (25, 2), (25, 3);
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (26, 1), (26, 5);
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (27, 4), (27, 8);
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (28, 6), (28, 7);



-- pergunta 8
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (29, 2), (29, 3);
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (30, 1), (30, 5);
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (31, 4), (31, 8);
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (32, 6), (32, 7);



-- pergunta 9
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (33, 1), (33, 3), (33, 5), (33, 8);
insert into resultados_alternativas (fk_alternativa, fk_resultado) values (34, 2), (34, 4), (34, 6), (34, 7);



select 
    p.id_pergunta as 'numero pergunts',
    p.pergunta as 'pergunta',
    a.id_alternativas as 'id alternativa.',
    a.alternativa as 'alternativa',
    r.titulo as 'personagem pontua'
from perguntas p
join alternativas a ON p.id_pergunta = a.fk_perguntas
join resultados_alternativas ra ON a.id_alternativas = ra.fk_alternativa
join resultado r ON ra.fk_resultado = r.id_resultado
order by p.id_pergunta, a.id_alternativas; 	

select fk_resultado, count(fk_resultado) as qtd_resultado from usuario group by fk_resultado order by qtd_resultado desc;

alter table resultado add column url_imagem text;

UPDATE resultado 
SET url_imagem = 'https://pbs.twimg.com/profile_images/2422389850/sxf5bvlvvlm7g9sy5we2_400x400.jpeg' 
WHERE id_resultado = 1;

select id_resultado, titulo, descricao, fk_personagens, url_imagem from resultado;

select * from racas;
select * from personagens;

select p.id_pergunta, p.pergunta, a.id_alternativas, a.alternativa from perguntas p
join alternativas a on fk_perguntas = id_pergunta;

UPDATE personagens
SET descricao = 'Soul Evans, ou, para os mais íntimos, “Soul Eater”, é um dos principais protagonistas de Soul Eater. Ele atua ao lado de sua parceira, Maka, que o empunha quando assume a forma de uma imponente foice negra com detalhes em vermelho. Soul tem como maior objetivo ser estiloso em tudo o que faz. Para ele, a vida é como uma dança, e cada movimento precisa ter atitude. Seu lema é simples: o importante é ser maneiro… e caras maneiros nunca traem. Por trás dessa pose de bad boy desinteressado e do sorriso de dentes afiados, esconde-se um parceiro de uma lealdade absurda, disposto a sangrar e arriscar a própria alma para proteger a Maka — mesmo que o preço a pagar seja levar uns cascudos dela quando ele resolve agir feito um idiota. Seja tocando um piano macabro dentro da própria mente para canalizar o Sangue Negro ou apenas fingindo que não liga para as aulas da AMAAN, Soul prova que o verdadeiro estilo não está no visual, mas sim na sua determinação inabalável de ser o herói mais maneiro do pedaço.'
WHERE id_personagens = 2;

UPDATE personagens
SET descricao = 'Excalibur é a arma mais poderosa do mundo e um ser extraordinário e lendário. Apesar de seu imenso poder, ele é conhecido por sua personalidade extremamente egocêntrica e irritante, que possui uma lista de 1.000 regras que o seu portador deve seguir rigorosamente. Quem consegue empunhá-lo ganha asas de luz, teletransporte e um poder capaz de cortar o próprio espaço, mas o preço a pagar por essa divindade é ter que aguentar uma criaturinha de cartola que não cala a boca por um segundo, passa horas cantando sua própria música tema (*"Excalibur, Excalibur, from United King..."*) e interrompe qualquer um gritando *"Tolo!"* na menor oportunidade. Ele é tão insuportável que não são os mestres que o rejeitam, são os próprios humanos que preferem continuar fracos a ter que passar mais cinco minutos ouvindo suas histórias intermináveis sobre suas festas de chá no século passados. "Não ouvir um boa história mais de uma vez? TOLO!"'
WHERE id_personagens = 10;



insert into racas (nome, representante, descricao, url_imagem) values
('Bruxa', 'Medusa Gorgon', 'No universo de Soul Eater, as Bruxas representam uma das raças mais poderosas, temidas e antigas do mundo, posicionando-se como as antagonistas naturais da AMAAN. Ao contrário dos humanos comuns, elas possuem uma poderosa alma mágica e a capacidade natural de manipular feitiços complexos, geralmente temáticos e baseados em um animal específico. No entanto, sua biologia é governada pelo "Instinto Destrutivo": um impulso psicológico e espiritual avassalador que as compele ao caos, à crueldade e à destruição à medida que sua magia se desenvolve. Para resistirem à caçada dos Artesãos, elas se articulam na Organização das Bruxas, uma sociedade secreta, onde realizam convenções mágicas, coordenam ataques e compartilham feitiços de camuflagem para ocultar suas auras dos Artesãos mais talentosos.', 'https://64.media.tumblr.com/670d41f5e776911498094054d19e91c7/d5deb7a8704a720f-70/s540x810/d7b99c4058a2cc57d0c8c6fb6435a1a824447c1a.jpg'),
('Shinigami', 'Lorde Morte', 'No universo de Soul Eater, Shinigami (Deuses da Morte) representa uma raça de divindade, literal encarregada de manter a ordem mundial, julgar as almas corrompidas e conter a disseminação da loucura. Por ser uma linhagem extremamente restrita e rara, o conhecimento sobre sua total extensão é limitado, conhecendo-se fundamentalmente o Lorde Morte, o líder supremo e fundador da AMAAN e seu filho biológico, Death the Kid, um meio-shinigami em fase de maturação. A existência de um Shinigami está intrinsecamente ligada ao equilíbrio do mundo: eles possuem almas de proporções massivas que podem envolver cidades inteiras e são capazes de fragmentar sua própria essência para gerar herdeiros. O combate de um Shinigami transcende a dinâmica comum de parceiros; suas próprias almas contêm o poder da "Ordem", funcionando como a barreira definitiva contra o caos da loucura Kishin.', 'https://preview.redd.it/lord-death-runs-monsterverse-gauntlet-v0-1ahw7cukp7bd1.jpg?width=1080&crop=smart&auto=webp&s=9260a4ef28490f3660f53bee648ea8bd0ddb4238'),
('Monstro', 'Blair', 'No universo de Soul Eater, os Monstros constituem uma categoria diversa e intrigante de seres sencientes que habitam as margens da sociedade humana e mágica. Diferente das Bruxas, cuja magia é puramente espiritual, as capacidades dos Monstros parecem intrinsecamente ligadas à sua biologia, que é majoritariamente baseada em características, formas ou transformações de animais. Essas criaturas exibem uma grande variedade de alinhamentos e poderes: enquanto seres como Blair são felinos com forte inclinação mágica e múltiplas vidas que conseguem transitar livremente entre a forma animal e a humana, outros como Mosquito representam linhagens antigas capazes de alterar a própria forma física para retroceder a estágios evolutivos passados e mais brutais. Eles funcionam de forma autônoma no ecossistema do mundo, podendo atuar como aliados imprevisíveis ou ameaças perigosas para os Artesãos.', 'https://i.pinimg.com/736x/37/9b/1a/379b1a90fb235929fbd6729afec97168.jpg'),
('Kishin', 'Asura', 'No universo de Soul Eater, o Kishin (Encarnação da Loucura) representa o ápice da corrupção espiritual e a personificação viva do terror. Ao contrário dos Artesãos e das Armas que buscam a evolução através da ordem, um Kishin surge quando um indivíduo quebra o maior tabu do mundo: consumir almas humanas inocentes e puras para alcançar um poder avassalador. O primeiro e único exemplo é Asura, cuja busca obsessiva por escapar do medo o levou a devorar seu próprio parceiro arma e mergulhar na insanidade. A existência de um Kishin é uma ameaça existencial ao planeta todo, pois sua alma distorcida irradia a "Comprimento de Onda da Loucura", uma força invisível capaz de corromper a mente de humanos, bruxas e monstros ao redor, incitando o caos e destruindo a própria lógica da realidade.', 'https://i.redd.it/asura-aka-the-kishin-from-soul-eater-v0-wsio0vtbahuc1.jpg?width=320&format=pjpg&auto=webp&s=c8a56c04ff078c967ea8f0ed7610de1065f397dc');


insert into personagens (nome, descricao, url_imagem, fk_racas) values
('Franken Stein', 'Franken Stein, ou apenas Dr. Stein, é o cientista e mestre de armas mais poderoso que já se formou na AMAN. Ele é a definição perfeita do "cientista maluco": tem um parafuso gigante cravado na cabeça que ele gira o tempo todo para "organizar os pensamentos" e costuma se locomover pela escola deslizando em uma cadeira de escritório com rodinhas — a qual ele inevitavelmente capota toda santa vez. Stein é obcecado por anatomia e tem um desejo quase incontrolável de dissecar qualquer coisa viva que cruze seu caminho, incluindo seus próprios alunos e espécies raras. Mas por trás de toda essa excentricidade assustadora e das cicatrizes que cobrem seu corpo, ele é um gênio tático incomparável e um mentor protetor, Apesar de sua personalidade perturbada e de lutar constantemente contra a própria loucura interior, Stein é um professor extremamente protetor e um combatente genial, capaz de sintonizar o comprimento de onda de sua alma com quase qualquer um.', 'https://static.wikia.nocookie.net/souleater/images/2/27/4580594.jpg/revision/latest/smart/width/250/height/250?cb=20250619145414&path-prefix=pl', 1),
('Spirit Albarn', 'Spirit Albarn é o pai da Maka e a arma pessoal do próprio Shinigami-sama, ostentando o título supremo de "Death Scythe". Quando assume sua forma de arma, ele se transforma em uma foice preta afiadíssima, infinitamente mais poderosa que as comuns. Porém, quando está em sua forma humana, toda essa imponência desmorona: Spirit é um mulherengo incorrigível e um frequentador assíduo de cabarés, comportamento que custou seu casamento e fez com que sua filha, Maka, passasse a odiá-lo profundamente. Ele vive em uma crise eterna de choro, implorando pelo perdão e pelo amor da filha, morrendo de ciúmes do Soul e fazendo escândalo sempre que a Maka o ignora. Apesar de ser um completo desastre como figura paterna e um bobalhão no dia a dia, quando o mundo corre perigo real, Spirit limpa as lágrimas, assume uma postura fria e prova por que é a arma mais confiável do Deus da Morte.', 'https://pbs.twimg.com/media/E04KCF6VEAIvqK9.jpg', 2),
('Medusa Gorgon', 'Medusa Gorgon é uma bruxa ancestral incrivelmente brilhante, sádica e a primeira grande antagonista da história. Escondendo sua natureza cruel sob o disfarce de uma doce enfermeira na AMAAN, Medusa orquestrou planos terríveis debaixo do nariz do Lorde Morte, incluindo a libertação do Asura (o Deus da Loucura). Ela controla milhares de cobras vetoriais que habitam seu próprio corpo e usa o feitiço "Nake Snake Cobra Cobubra" para estraçalhar seus inimigos. Medusa é a personificação da falta de escrúpulos: ela não hesitou em usar e torturar psicologicamente a própria filha, Crona, em experimentos cruéis. Além de sua frieza, ela possui uma relação intensa e manipuladora com o Dr. Stein, aproveitando-se da mente instável dele para atiçar sua loucura interior e transformá-lo em uma peça-chave para seus experimentos e ambições caóticas.', 'https://64.media.tumblr.com/670d41f5e776911498094054d19e91c7/d5deb7a8704a720f-70/s540x810/d7b99c4058a2cc57d0c8c6fb6435a1a824447c1a.jpg', 3),
('Arachne', 'Arachne Gorgon é a irmã mais velha de Medusa, conhecida como a "Heresiarca" e a líder da organização terrorista Arachnophobia. Após passar 800 anos escondida na forma de milhares de aranhas espalhadas pelo mundo para escapar da fúria de Shinigami-sama, ela retorna ao seu corpo físico com toda a sua imponência. Ao contrário do estilo mais direto de sua irmã, Arachne prefere agir nas sombras. Ela usa fios de teia invisíveis para controlar mentes e amplificar a loucura no mundo. Extremamente elegante e majestosa, o ápice de seu plano se consolida quando ela encontra o Kishin Ashura e forma uma aliança sombria com ele, mantendo-se sempre por perto para usar o poder avassalador do Deus da Loucura como o escudo definitivo para sua própria soberania.', 'https://i.pinimg.com/736x/72/89/37/728937bf4164bebcd3c55c1aaefb6b53.jpg', 3),
('Lorde Morte', 'Lorde Morte, ou simplesmente Shinigami-sama, é o Deus da Morte, o líder supremo da AMAN e a entidade que mantém a ordem no mundo. No passado, ele tinha uma aparência realista e assustadora que aterrorizava as pessoas, então decidiu mudar sua forma para uma silhueta preta e cômica, usando uma máscara de caveira estilizada e mãos gigantes em formato de luvas brancas. Ele fala com uma voz fina, alegre e super descontraída, cumprimentando os outros com o seu famoso "Waku waku! 42-42-564". Porém, não se deixe enganar pela pose de mascote bobo: o Lorde Morte é uma força divina incomparável. Quando alguém quebra as regras ou ameaça a paz, ele usa o devastador "Shinigami Chop" (um tapa seco e estúpido de tão forte) ou empunha suas Death Scythes para lembrar a todos por que ele é a própria personificação da morte.', 'https://preview.redd.it/lord-death-runs-monsterverse-gauntlet-v0-1ahw7cukp7bd1.jpg?width=1080&crop=smart&auto=webp&s=9260a4ef28490f3660f53bee648ea8bd0ddb4238', 4),
('Blair', 'Blair é uma personagem que causa uma confusão hilária logo no começo da história. Inicialmente confundida com uma bruxa poderosa por Maka e Soul devido ao seu imenso poder mágico, seu chapéu pontudo e suas roupas escuras, ela se revela, na verdade, uma gata preta mágica com habilidades extraordinárias e nove vidas para gastar. Blair adora assumir uma forma humana extremamente atraente e sedutora, o que quase faz o Soul ter hemorragias nasais constantes, já que ela adora se atirar para cima dele e brincar com sua pose de "cara maneiro". Ela usa uma magia baseada em abóboras e fogos de artifício (o feitiço "Pumpkin Pumpkin") e adora flertar, tomar banhos demorados e curtir a vida. Depois de esclarecido o mal-entendido de sua identidade, Blair acaba se mudando para o apartamento de Maka e Soul, tornando-se a "mascote" mais folgada e divertida da casa.', 'https://i.pinimg.com/736x/37/9b/1a/379b1a90fb235929fbd6729afec97168.jpg', 5),
('Mifune', 'Mifune, conhecido como o "Deus da Espada", é um samurai de elite e um dos guerreiros humanos mais formidáveis de Soul Eater. Mesmo sem possuir um parceiro que se transforma em arma ou habilidades mágicas, ele é capaz de enfrentar artesãos de alto nível usando seu lendário Estilo das Infinitas Espadas (Mugenryu), onde ele espalha dezenas de katanas pelo campo de batalha para alternar entre elas em uma velocidade impressionante. Apesar de sua aura de guerreiro frio e implacável, Mifune possui um coração gigante e um senso de honra inabalável. Ele abandonou sua vida como guarda-costas da máfia para se dedicar inteiramente à proteção da pequena bruxa Angela, aceitando trabalhar para organizações sombrias como a Arachnophobia apenas para garantir que a garotinha ficasse em segurança. Seu maior rival e eventual admiração é Black Star, com quem trava batalhas intensas baseadas no puro respeito de guerreiro.', 'https://i.redd.it/did-you-guys-ever-wonder-how-maka-or-kid-would-fair-in-a-v0-bywdhzajgvfd1.jpg?width=640&format=pjpg&auto=webp&s=5b13a1d103e1dc23fa4d9fd2f0da159d89643e42', 1),
('Angela Leon', 'Angela Leon é uma bruxa muito jovem e inocente que, devido à sua idade, ainda não compreende a natureza sombria ou a maldade que geralmente cercam as bruxas adultas. Sua magia é baseada em camaleões, o que permite que ela mude de forma ou desapareça no ambiente, embora ela prefira usar seus poderes para brincar ou fazer birra. Angela é extremamente fofa, enérgica e mimada, agindo como qualquer criança comum da sua idade. Ela enxerga Mifune não apenas como seu guarda-costas, mas como uma figura paterna e seu porto seguro, sendo completamente dependente dele para tudo. O maior perigo para Angela não é o seu próprio poder, mas sim o fato de que o mundo a caça pelo simples fato de ter nascido bruxa, tornando-a o motivo pelo qual Mifune está disposto a enfrentar o mundo inteiro para protegê-la.', 'https://static.wikia.nocookie.net/souleater/images/0/01/Angela_Leon_Profile.png/revision/latest?cb=20160310063938', 3),
('Kishin Asura', 'Asura, mais conhecido como o "Kishin", é o primeiro Deus da Loucura e o antagonista definitivo da história. No passado, ele foi um dos guerreiros de elite do Lorde Morte, mas seu medo paranoico de tudo e de todos o levou a consumir almas humanas inocentes e até a sua própria parceira arma para obter poder absoluto, tornando-se o primeiro Kishin. Asura é a própria personificação do pavor e da insanidade; sua presença exala um "Comprimento de Onda de Loucura" tão devastador que é capaz de fazer pessoas comuns perderem a sanidade instantaneamente ao redor do mundo. Visualmente bizarro, ele se esconde atrás de camadas de faixas que cobrem seu corpo, tem três olhos (sendo um na testa) e usa a própria pele esticada como roupa. Ele não busca dominar o mundo por maldade pura, mas sim para mergulhá-lo no caos total, acreditando piamente que a única forma de se livrar do medo é eliminando a lógica, a ordem e a própria paz.', 'https://static.wikia.nocookie.net/fictions-characters/images/f/fe/Asura.jpg/revision/latest/scale-to-width-down/290?cb=20150505160644', 6);

select p.id_pergunta as id_pergunta, p.pergunta as pergunta, a.id_alternativas as id_alternativa, a.alternativa as alternativa from perguntas p
    join alternativas a on a.fk_perguntas = p.id_pergunta;
    
    select month(data_cadastro) from usuario group by month(data_cadastro) order by count(month(data_cadastro)) desc limit 1;
    
    
select * from avaliacao;
select * from resultado;
select * from usuario;


update usuario set fk_resultado = 3 where id_usuario = 17;

insert into avaliacao (nota, fk_usuario) values
(5, 12);

update avaliacao set nota = 5 where fk_usuario = 3;

select fk_resultado, count(fk_resultado) as qtd_resultado from usuario group by fk_resultado order by fk_resultado;

insert into usuario (nome, email, senha, data_cadastro, fk_resultado) values
('GokuShape', 'sayajindoflamengo@gmail.com', 'Kamehameha123', '2026-01-15 08:45:10', 1),
('LuffyDoPix', 'reidospiratas@gmail.com', 'QueroCarne99', '2026-02-28 19:12:05', 2),
('NarutoDaDepre', 'dattebayo_crente@gmail.com', 'LamemTodoDia', '2026-03-04 12:00:59', 3),
('Ben10K', 'relogio_da_shopee@gmail.com', 'ChamaOsAlien7', '2026-03-25 22:30:15', 4),
('SoraCadeOMickey', 'keyblade_master@gmail.com', 'CoracaoDaLuz88', '2026-04-11 14:15:22', 5),
('DannyFantasma', 'ghost_pego_no_pulo@gmail.com', 'MetadeHumano0', '2026-05-02 03:40:00', 6),
('AshDaShitpost', 'mestre_da_capital@gmail.com', 'PikachuEuEscolhoVc', '2026-05-19 17:55:43', 7),
('DekuChorao', 'allmight_me_salva@gmail.com', 'SmashNoTeclado9', '2026-06-01 10:20:37', 8);

insert into avaliacao (nota, fk_usuario) values
(5, 19), -- GokuShape
(4, 20), -- LuffyDoPix
(5, 21), -- NarutoDaDepre
(3, 22), -- Ben10K
(4, 23), -- SoraCadeOMickey
(5, 24), -- DannyFantasma
(2, 25), -- AshDaShitpost
(4, 26); -- DekuChorao