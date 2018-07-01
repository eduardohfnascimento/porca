# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

Professor.create(name: 'Anderson Maciel')
Professor.create(name: 'Alberto Egon')
Professor.create(name: 'Taisy Weber')
Professor.create(name: 'Karin Becker')

Course.create(name: 'Interação Humano-Computador', alias: 'IHC', semester: '6')
Course.create(name: 'Sistemas Operacionais II', alias: 'Sisop2', semester: '6')
Course.create(name: 'Fundamentos de Tolerância a Falhas', alias: 'FTF', semester: '6')
Course.create(name: 'Métodos Ágeis', alias: 'Ageis', semester: 'Eletiva')

Post.create(name: 'P1 IHC', link: 'google.com', semester: '2018/1', professor_id: 1, course_id: 1)