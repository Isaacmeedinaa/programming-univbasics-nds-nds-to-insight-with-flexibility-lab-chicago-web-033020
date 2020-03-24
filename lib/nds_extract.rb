# Provided, don't edit
require 'directors_database'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end


# Your code after this point

def movies_with_director_key(name, movies_collection)
  
  new_array = []
  i = 0
  
  while i < movies_collection.length do
    
    new_array << movie_with_director_name(name, movies_collection[i])
    
    i += 1
  end
  
  new_array
end


def gross_per_studio(collection)
  
  new_hash = {}
  i = 0
  
  while i < collection.length do
    
    movie_gross = collection[i][:worldwide_gross]
    studio_name = collection[i][:studio]
    
    if new_hash.has_key?(studio_name)
      new_hash[studio_name] += movie_gross
    else
      new_hash[studio_name] = movie_gross
    end
      
    i += 1
  end
  
  new_hash
end

def movies_with_directors_set(source)
  
end

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
