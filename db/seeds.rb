# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
for i in 0..50
Gist.create(snippet:'#include <stdio.h>
int main()
{
int a = 22;
int b = 12;

printf("%i",a*b);

return 0;
}', lang:'c',description:'C')
end

for i in 0..50
Post.create(content:'Projekt zespolowy w Ruby :)',
date:'13.05.2014',description:'Post')
end
