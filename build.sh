#!/bin/sh

uploadarquivos()
{
	echo "" > _data/images.yml
	for FOTO in $(ls --sort=extension images/uploads/)
	do
		echo "-   nome: $FOTO" >> _data/images.yml
		echo "    link: /images/fotos-skate/$FOTO" >> _data/images.yml
		echo "" >> _data/images.yml
	done
}

updatedates()
{
	cur_date="$(date +%Y-%m-%d)"

	for file in $(ls _blog)
	do
		sed -i "s/^Atualizado em .*$/Atualizado em $cur_date/g" "_blog/$file"
	done
}

#. compress_img.sh
#rm images/*.png
uploadarquivos
updatedates

bundle update &&
JEKYLL_ENV=production &&
bundle exec jekyll build &&

cd _site && rm *.sh && cd ..
