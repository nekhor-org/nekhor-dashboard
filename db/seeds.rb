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


en = Language.find(1)
ch = Language.find(2)

intros = [
  { json: "intro_guru_detail", image: "images/buddha-lumbini.jpg" },
  { json: "intro/practicalities", image: "images/intro-pratic.jpg"},
  { json: "intro/thepath", image: "images/intro-the-path.jpg"},
  { json: "intro/tips", image: "images/intro-tips.jpg"},
]

buddha_india = [
  { json: "buddha/bodh_gaya", image: "images/buddha-bodh-gaya.jpg" },
  { json: "buddha/intro_buddha", image: "images/buddha-intro.jpg" },
  { json: "buddha/kushinagar", image: "images/buddha-kushinagar.jpg" },
  { json: "buddha/sarnath", image: "images/buddha-sarnath.jpg" },
  { json: "buddha/vaishali", image: "images/buddha-vaishali.jpg" },
  { json: "buddha/rajgir", image: "images/buddha-rajgir.jpg" },
  { json: "buddha/shravasti", image: "images/buddha-shravasti.jpg" },
  { json: "buddha/samkashya", image: "images/buddha-samkashya.jpg" },
]

buddha_nepal = [
  { json: "buddha/lumbini", image: "images/buddha-lumbini.jpg" }
]

guru_nepal = [
  { json: "guru/asura", image: "images/guru-asura.jpg" },
  { json: "guru/avalokiteshvara", image: "images/guru-avalokiteshvara.jpg" },
  { json: "guru/bhaktapur", image: "images/guru-bhaktapur.jpg" },
  { json: "guru/boudha", image: "images/guru-boudha.jpg" },
  { json: "guru/chumik", image: "images/guru-chumik.jpg" },
  { json: "guru/evihara", image: "images/guru-evihara.jpg" },
  { json: "guru/lhundrup", image: "images/guru-lhundrup.jpg" },
  { json: "guru/maratika", image: "images/guru-maratika.jpg" },
  { json: "guru/ngatupchen", image: "images/guru-ngatupchen.jpg" },
  { json: "guru/swayambhu", image: "images/guru-swayambhu.jpg" },
  { json: "guru/tsawarong", image: "images/guru-tsawarong.jpg" },
  { json: "guru/yarinak", image: "images/guru-yarinak.jpg" },
]

guru_india = [
  { json: "india/bodhgaya_india", image: "images/india-bodhgaya.jpg" },
  { json: "india/dechen", image: "images/india-dechen.jpg" },
  { json: "india/dhanakosha", image: "images/india-dhanakosha.jpg" },
  { json: "india/haha", image: "images/india-haha.jpg" },
  { json: "india/jikten", image: "images/india-jikten.jpg" },
  { json: "india/kukkutapada", image: "images/india-kukkutapada.jpg" },
  { json: "india/kula", image: "images/india-kula.jpg" },
  { json: "india/kusumapura", image: "images/india-kusumapura.jpg" },
  { json: "india/lanka", image: "images/india-lanka.jpg" },
  { json: "india/lhundrup_india", image: "images/india-lhundrup.jpg" },
  { json: "india/malaya", image: "images/india-malaya.jpg" },
  { json: "india/nalanda", image: "images/india-nalanda.jpg" },
  { json: "india/pema", image: "images/india-pema.jpg" },
  { json: "india/sangchen", image: "images/india-sangchen.jpg" },
  { json: "india/sitavana", image: "images/india-sitavana.jpg" },
  { json: "india/tamradvipa", image: "images/india-tamradvipa.jpg" },
  { json: "india/uddiyana", image: "images/india-uddiyana.jpg" },
  { json: "india/varanasi", image: "images/india-varanasi.jpg" },
  { json: "india/vedali", image: "images/india-vedali.jpg" },
  { json: "india/zahor", image: "images/india-zahor.jpg" },
]

intro = Local.create(name: "Introduction")
LocalName.create(local_id: intro.id, language_id: en.id, name: "Introduction")
LocalName.create(local_id: intro.id, language_id: ch.id, name: "Introduction")

country_intro = Country.create(name: "Introduction", local_id: intro.id)
CountryName.create(name: "Introduction", country_id: country_intro.id, language_id: en.id)
CountryName.create(name: "Introduction", country_id: country_intro.id, language_id: ch.id)

intros.each do |data_intro|
  p "#{data_intro}"
  data = get_data("#{data_intro.dig(:json)}/en.json")
  post = Post.create!(
    country_id: country_intro.id,
    local_id: intro.id,
    title: data.dig(:title),
    subtitle: data.dig(:subtitle),
    content: data.dig(:content),
  )

  post.image.attach(io: File.open(Rails.root.join('db', data_intro.dig(:image))), filename: 'my_image.png', content_type: 'image/png')
  
  data = get_data("#{data_intro.dig(:json)}/ch.json")

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
  data = get_data("#{data_intro.dig(:json)}/en.json")
  post = Post.create!(
    country_id: country_india_guru.id,
    local_id: guru.id,
    title: data.dig(:title),
    subtitle: data.dig(:subtitle),
    content: data.dig(:content),
  )

  post.image.attach(io: File.open(Rails.root.join('db', data_intro.dig(:image))), filename: 'my_image.png', content_type: 'image/png')
  
  
  data = get_data("#{data_intro.dig(:json)}/ch.json")

  post_content = post.post_contents.where(language_id: ch.id)
  post_content.update(title: data.dig(:title), subtitle: data.dig(:subtitle),content: data.dig(:content))
end

guru_nepal.each do |data_intro|
  p "#{data_intro}"
  data = get_data("#{data_intro.dig(:json)}/en.json")
  post = Post.create!(
    country_id: country_nepal_guru.id,
    local_id: guru.id,
    title: data.dig(:title),
    subtitle: data.dig(:subtitle),
    content: data.dig(:content),
  )
  
  post.image.attach(io: File.open(Rails.root.join('db', data_intro.dig(:image))), filename: 'my_image.png', content_type: 'image/png')
  

  data = get_data("#{data_intro.dig(:json)}/ch.json")

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
  data = get_data("#{data_intro.dig(:json)}/en.json")
  post = Post.create!(
    country_id: country_india_buddha.id,
    local_id: buddha.id,
    title: data.dig(:title),
    subtitle: data.dig(:subtitle),
    content: data.dig(:content),
  )
  
  post.image.attach(io: File.open(Rails.root.join('db', data_intro.dig(:image))), filename: 'my_image.png', content_type: 'image/png')
  

  data = get_data("#{data_intro.dig(:json)}/ch.json")

  post_content = post.post_contents.where(language_id: ch.id)
  post_content.update(title: data.dig(:title), subtitle: data.dig(:subtitle),content: data.dig(:content))
end

buddha_nepal.each do |data_intro|
  p "#{data_intro}"
  data = get_data("#{data_intro.dig(:json)}/en.json")
  post = Post.create!(
    country_id: country_nepal_buddha.id,
    local_id: guru.id,
    title: data.dig(:title),
    subtitle: data.dig(:subtitle),
    content: data.dig(:content),
  )

  post.image.attach(io: File.open(Rails.root.join('db', data_intro.dig(:image))), filename: 'my_image.png', content_type: 'image/png')
  
  
  data = get_data("#{data_intro.dig(:json)}/ch.json")

  post_content = post.post_contents.where(language_id: ch.id)
  post_content.update(title: data.dig(:title), subtitle: data.dig(:subtitle),content: data.dig(:content))
end







