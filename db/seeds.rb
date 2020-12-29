categories = Category.create([
  {title:'Programming'},
  {title: 'Cooking'},
  {title:'Music Knowledge'}
  ])

tests = Test.create([
  {title: 'Ruby test', level: 3, category_id: 1},
  {title: 'Pasta test', level: 3, category_id: 2},
  {title: 'Prodigy test', level: 2, category_id: 3},
  {title: 'JS test', level: 2, category_id: 1},
  {title: 'SOAD test', level: 1, category_id: 3}
  ])

users = User.create([
  {username: 'diablo', password_digest: 'longpassword',
  tests: [tests[0], tests[1]]},
  {username: '-\_ XyЛ|/|rAH _/-', password_digest: 'verysecurepassword',
  tests: [tests[0], tests[4]]},
  ])

questions = Question.create([
  {body:'Что такое блок?', test_id: 1},
  {body:'Что такое модуль?', test_id: 1},
  {body:'Кратко, что такое объект, класс?', test_id: 1},
  {body:'Преимущества символов над строками', test_id: 1},
  {body:'Отличие приватного метода от публичного', test_id: 1},
  {body:'Если я знаю JS, то Java тем более', test_id: 4},
  {body:'Есть платиновые альбомы?', test_id: 5},
  {body:'Prodigy question', test_id: 3}
  ])

answers = Answer.create([
  {body:'Код исполняющийся в методе', question_id: 1, correct: true},
  {body:'Кусок кода, предотвращает дублирование', question_id: 2, correct: true},
  {body:'Класс - чертеж, объект - машина', question_id: 3, correct: true},
  {body:'Занимаемая память', question_id: 4, correct: true},
  {body:'Приватный используется только в классе', question_id: 5, correct: true},
  {body:'Абсолютно да', question_id: 6, correct: true},
  {body:'Есть!', question_id: 7, correct: true},
  {body:'Prodigy answer', question_id: 8, correct: true}
  ])
