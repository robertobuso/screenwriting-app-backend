Project.create(title:"Best Script Ever", protagonist: "Scarlett")

Project.create(title:"Worst Script Ever", protagonist: "Roberto")

Structure.create(saved: false, order: [{1 => 1},{2 => 2},{3 => 3},{4 => 4},{5 => 5},{6 => 6},{7 => 7},{8 => 8},{9 => 9},{10 => 10}], project_id: 1)

# Structure.create(title:"Second Traditional", saved: true, order: [{1 => 10},{2 => 8},{3 => 5},{4 => 9},{5 => 7},{6 => 4},{7 => 2},{8 => 1},{9 => 3},{10 => 6}], project_id: 1)
#
# Structure.create(title:"Third Traditional", saved: true, order: [{1 => 3},{2 => 8},{3 => 2},{4 => 4},{5 => 1},{6 => 6},{7 => 7},{8 => 5},{9 => 10},{10 => 9}], project_id: 1)

Idea.create(content: "They Meet", title: "uno", act: 1, project_id: 1, description: "Character", conflict: "Scene")
Idea.create(content: "They like Each Other", title: "dos", turn: "Inciting Incident", project_id: 1, miscellaneous: "Sample Dialogue")
Idea.create(content: "Airplane Crashes and Uncle Dies", title: "tres", begins: "+", ends: "---", project_id: 1, miscellaneous: "Action")
Idea.create(content: "They Make Up", title: "cuatro", turn: "Denouement", project_id: 1)
Idea.create(content: "A Day At The Park", title: "cinco", act: 2, project_id: 1, description: "Location")
Idea.create(content: "Will She???", title: "seis", turn: "Crisis Decision", project_id: 1, conflict: "Act")
Idea.create(content: "The Altoids Are Found", title: "siete", begins:"-", ends:"+", project_id: 1, inspiration: "Visual")
Idea.create(content: "Too Much Fun in the Sun", title: "ocho", act: 3, project_id: 1)
Idea.create(content: "Musical Interlude", title: "nueve", act: 2, project_id: 1, inspiration: "Aural")
Idea.create(content: "Abstract Dream Sequence", title: "diez", project_id: 1, research: "Theme")
