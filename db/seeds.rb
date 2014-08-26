View.destroy_all
countries = ["Australia", "Brazil", "Cameroon", "Canada", "China", "Egypt",
  "France", "Germany", "Italia", "Japan", "Korea", "Russia", "South Africa",
  "Spain", "Thailand", "United Kingdom", "United States", "Vietnam"]
oses = ["Android", "iOS", "Mac", "Linux", "Windows"]
browsers = ["Firefox", "Google Chrome", "Opera", "Safari"]
(0..6).each do |n|
  num = rand(10..300)
  num.times do
    View.create(country: countries.sample, created_at: DateTime.now - n.days,
      duration: rand(10..(3.hours)), os: oses.sample, browser: browsers.sample)
  end
end