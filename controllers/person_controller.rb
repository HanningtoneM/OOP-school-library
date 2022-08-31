require 'json'
require './core/student'
require './core/teacher'
module PersonsController
  def fetch_persons
    store = []
    file = open('./storage/persons.json')
    if File.exist?(file) and File.read(file) != ''
      person_data = file.read
      JSON.parse(person_data).each do |person|
        store << if person['className'] == 'Student'
                   Student.new(person['id'], nil, person['age'],
                               person['name'], parent_permission: person['parent_permission'])
                 else
                   Teacher.new(person['id'], person['specialuzation'],
                               person['age'], person['name'])
                 end
      end
    else
      File.write(file, '[]')
    end
    store
  end

  def save_persons
    store = []
    @people.each do |person|
      if person.is_a?(Student)
        store << { id: person.id, className: person.class,
                   age: person.age, name: person.name,
                   parent_permission: person.parent_permission }
      end
      next unless person.is_a?(Teacher)

      store << { id: person.id, specialization: person.specialization,
                 age: person.age, name: person.name,
                 parent_permission: person.parent_permission, className: person.class }
    end
    File.write('./storage/persons.json', store.to_json)
  end
end
