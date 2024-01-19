require "json"
User.create(name: "Admin", email: "admin@admin.com", password: "nekhor@2023", has_admin: true)

en = Language.create(name: "English")

ch = Language.create(name: "Mandarim")

def get_data(path)
  file = File.open Rails.root.join('db', 'jsons', path)
  data = JSON.load file

  title = data["title_page"]
  subtitle = data["subtitle_page"]

  data.delete("title_page")
  data.delete("subtitle_page")
  paragraph = ""
  data.each do |content|
    if content[0].include?("content_") && !content[0].include?("link_content")
      paragraph += "\n\n#{content[1]}"
    else
      paragraph += "\n#{content[1]}"
    end
  end

  return { title: title, subtitle: subtitle, content: paragraph }
end


# en = Language.find(1)
# ch = Language.find(2)

intros = [
  "intro_guru_detail",
  "intro/practicalities",
  "intro/thepath",
  "intro/tips"
]

buddha_india = [
  "buddha/lumbini"
]

buddha_nepal = [
  "buddha/bodh_gaya",
  "buddha/intro_buddha",
  "buddha/kushinagar",
  "buddha/sarnath",
  "buddha/vaishali",
  "buddha/rajgir",
  "buddha/shravasti",
  "buddha/samkashya",
]

guru_nepal = [
  "guru/asura",
  "guru/avalokiteshvara",
  "guru/bhaktapur",
  "guru/boudha",
  "guru/chumik",
  "guru/evihara",
  "guru/lhundrup",
  "guru/maratika",
  "guru/ngatupchen",
  "guru/swayambhu",
  "guru/tsawarong",
  "guru/yarinak",
]

guru_india = [
  "india/bodhgaya_india",
  "india/dechen",
  "india/dhanakosha",
  "india/haha",
  "india/jikten",
  "india/kukkutapada",
  "india/kula",
  "india/kusumapura",
  "india/lanka",
  "india/lhundrup_india",
  "india/malaya",
  "india/nalanda",
  "india/pema",
  "india/sangchen",
  "india/sitavana",
  "india/tamradvipa",
  "india/uddiyana",
  "india/varanasi",
  "india/vedali",
  "india/zahor",
]

intro = Local.create(name: "Introduction")
LocalName.create(local_id: intro.id, language_id: en.id, name: "Introduction")
LocalName.create(local_id: intro.id, language_id: ch.id, name: "Introduction")

country_intro = Country.create(name: "Introduction", local_id: intro.id)
CountryName.create(name: "Introduction", country_id: country_intro.id, language_id: en.id)
CountryName.create(name: "Introduction", country_id: country_intro.id, language_id: ch.id)

intros.each do |data_intro|
  p "#{data_intro}"
  data = get_data("#{data_intro}/en.json")
  post = Post.create!(
    country_id: country_intro.id,
    local_id: intro.id,
    title: data.dig(:title),
    subtitle: data.dig(:subtitle),
    content: data.dig(:content),
  )
  
  data = get_data("#{data_intro}/ch.json")

  post_content = post.post_contents.where(language_id: ch.id)
  post_content.update(title: data.dig(:title), subtitle: data.dig(:subtitle),content: data.dig(:content))
end

guru = Local.create(name: "Guru")
LocalName.create(local_id: intro.id, language_id: en.id, name: "Guru")
LocalName.create(local_id: intro.id, language_id: ch.id, name: "Guru")

country_nepal_guru = Country.create(name: "Nepal", local_id: intro.id)
CountryName.create(name: "Nepal", country_id: country_nepal_guru.id, language_id: en.id)
CountryName.create(name: "Nepal", country_id: country_nepal_guru.id, language_id: ch.id)

country_india_guru = Country.create(name: "India", local_id: intro.id)
CountryName.create(name: "India", country_id: country_india_guru.id, language_id: en.id)
CountryName.create(name: "India", country_id: country_india_guru.id, language_id: ch.id)

guru_india.each do |data_intro|
  p "#{data_intro}"
  data = get_data("#{data_intro}/en.json")
  post = Post.create!(
    country_id: country_india_guru.id,
    local_id: guru.id,
    title: data.dig(:title),
    subtitle: data.dig(:subtitle),
    content: data.dig(:content),
  )
  
  data = get_data("#{data_intro}/ch.json")

  post_content = post.post_contents.where(language_id: ch.id)
  post_content.update(title: data.dig(:title), subtitle: data.dig(:subtitle),content: data.dig(:content))
end

guru_nepal.each do |data_intro|
  p "#{data_intro}"
  data = get_data("#{data_intro}/en.json")
  post = Post.create!(
    country_id: country_nepal_guru.id,
    local_id: guru.id,
    title: data.dig(:title),
    subtitle: data.dig(:subtitle),
    content: data.dig(:content),
  )
  
  data = get_data("#{data_intro}/ch.json")

  post_content = post.post_contents.where(language_id: ch.id)
  post_content.update(title: data.dig(:title), subtitle: data.dig(:subtitle),content: data.dig(:content))
end

buddha = Local.create(name: "The Buddha")
LocalName.create(local_id: intro.id, language_id: en.id, name: "Guru")
LocalName.create(local_id: intro.id, language_id: ch.id, name: "The Buddha")

country_nepal_buddha = Country.create(name: "Nepal", local_id: intro.id)
CountryName.create(name: "Nepal", country_id: country_nepal_buddha.id, language_id: en.id)
CountryName.create(name: "Nepal", country_id: country_nepal_buddha.id, language_id: ch.id)

country_india_buddha = Country.create(name: "India", local_id: intro.id)
CountryName.create(name: "India", country_id: country_india_buddha.id, language_id: en.id)
CountryName.create(name: "India", country_id: country_india_buddha.id, language_id: ch.id)



buddha_india.each do |data_intro|
  p "#{data_intro}"
  data = get_data("#{data_intro}/en.json")
  post = Post.create!(
    country_id: country_india_buddha.id,
    local_id: buddha.id,
    title: data.dig(:title),
    subtitle: data.dig(:subtitle),
    content: data.dig(:content),
  )
  
  data = get_data("#{data_intro}/ch.json")

  post_content = post.post_contents.where(language_id: ch.id)
  post_content.update(title: data.dig(:title), subtitle: data.dig(:subtitle),content: data.dig(:content))
end

buddha_nepal.each do |data_intro|
  p "#{data_intro}"
  data = get_data("#{data_intro}/en.json")
  post = Post.create!(
    country_id: country_nepal_buddha.id,
    local_id: guru.id,
    title: data.dig(:title),
    subtitle: data.dig(:subtitle),
    content: data.dig(:content),
  )
  
  data = get_data("#{data_intro}/ch.json")

  post_content = post.post_contents.where(language_id: ch.id)
  post_content.update(title: data.dig(:title), subtitle: data.dig(:subtitle),content: data.dig(:content))
end







