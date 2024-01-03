def load_file(folder, file)
  return YAML.load_file(File.join(__dir__, folder, file))
end
