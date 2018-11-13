# jbuilder is just ruby code with more methods available

# json.array!(@twists, :id, :body)
# json.array! @twists, :id, :body, :created_at, :updated_at, :author_id

# To define attribute and structure names dynamically, use the set! method:
# json.[thing] without the bang! creates a key of [thing]
json.twists do
  @twists.each do |twist|
    # create an object with dynamically-set keys
    # (twist.id gets evaluated and set as key)
    json.set! twist.id do
      # json.extract! twist, :id, :body # not DRY 🙅
      json.partial! 'api/twists/twist', twist: twist #😊

      json.author do
        json.extract! twist.author, :id, :username
      end
      # DONT want to pass the entire user object here because then we're starting to nest our data
      # users should live in their own slice, here we just have a reference to them
    end
  end
end

json.users do
  @users.each do |user|
    json.set! user.id do
      json.extract! user, :id, :username
    end
  end
end
