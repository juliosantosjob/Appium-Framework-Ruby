def random_contacts(path, file, key)
  contacts_path = File.join(path, file)
  contacts_data = YAML.load_file(contacts_path)

  all_contacts = contacts_data[key].values

  random = rand(all_contacts.length)
  all_contacts[random]
end
