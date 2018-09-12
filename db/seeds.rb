Project.create(title:"Best Script Ever", protagonist: "Scarlett")

Structure.create(title:"First Traditional", saved: true, order: [{1 => 4},{2 => 2},{3 => 10},{4 => 8},{5 => 1},{6 => 7},{7 => 5},{8 => 9},{9 => 3},{10 => 6}], project_id: 1)

Structure.create(title:"Second Traditional", saved: true, order: [{1 => 10},{2 => 8},{3 => 5},{4 => 9},{5 => 7},{6 => 4},{7 => 2},{8 => 1},{9 => 3},{10 => 6}], project_id: 1)

Structure.create(title:"Third Traditional", saved: true, order: [{1 => 3},{2 => 8},{3 => 2},{4 => 4},{5 => 1},{6 => 6},{7 => 7},{8 => 5},{9 => 10},{10 => 9}], project_id: 1)

Idea.create(content: "They Meet", title: "uno", act: 1, project_id: 1)
Idea.create(content: "They like Each Other", title: "dos", turn: "Inciting Incident", project_id: 1)
Idea.create(content: "Airplane Crashes and Uncle Dies", title: "tres", begins: "+", ends: "---", project_id: 1)
Idea.create(content: "They Make Up", title: "cuatro", turn: "Denouement", project_id: 1)
Idea.create(content: "A Day At The Park", title: "cinco", act: 2, project_id: 1)
Idea.create(content: "Will She???", title: "seis", turn: "Crisis Decision", project_id: 1)
Idea.create(content: "The Altoids Are Found", title: "siete", begins:"-", ends:"+", project_id: 1)
Idea.create(content: "Too Much Fun in the Sun", title: "ocho", act: 3, project_id: 1)
Idea.create(content: "Musical Interlude", title: "nueve", act: 2, project_id: 1)
Idea.create(content: "Abstract Dream Sequence", title: "diez", project_id: 1)
