#!/bin/bash

# sudo cp htm.sh /usr/local/bin/htm
# sudo chmod a+x /usr/local/bin/htm

echo "== Generarte HTML blocks for ruu.lv  ==
Example
htm 20190820-Kurzeme-Klaipeda-0002-Pavilosta-by-Janis-Rullis Pavilosta 2019:08:20
";

if [[ ! -n $1 ]]; then
        echo "Filename?";
        exit;
fi
if [[ ! -n $2 ]]; then
        echo "Description?";
        exit;
fi
if [[ ! -n $3 ]]; then
        echo "Date?";
        exit;
fi
FILENAME=$1;
DESCRIPTION=$2;
DATE=$3;
DATE_W_HYPENS=`tr ':' '-' <<< ${DATE}`;
DATE_W_DOTS=`tr ':' '.' <<< ${DATE}`.;
DATE_SHORT=${DATE//:/};
HTML_FILENAME="${DATE_SHORT}-${DESCRIPTION}.html";
HTML_TITLE="Analog Photography | ${DATE_W_DOTS} ${DESCRIPTION} | ruu.lv";
HTML_URL="https://ruu.lv/news/${HTML_FILENAME}";

echo "
  <picture class='lazy'>
    <source type='image/webp' media='(min-width: 1610px)' data-srcset='https://cdn.statically.io/img/r9.lv/i/${FILENAME}-1920x.webp, https://cdn.statically.io/img/r9.lv/i/${FILENAME}-3840x.webp 2x'>
    <source type='image/webp' media='(min-width: 1376px)' data-srcset='https://cdn.statically.io/img/r9.lv/i/${FILENAME}-1600x.webp, https://cdn.statically.io/img/r9.lv/i/${FILENAME}-3200x.webp 2x'>
    <source type='image/webp' media='(min-width: 1034px)' data-srcset='https://cdn.statically.io/img/r9.lv/i/${FILENAME}-1366x.webp, https://cdn.statically.io/img/r9.lv/i/${FILENAME}-2732x.webp 2x'>			  
    <source type='image/webp' media='(min-width: 778px)' data-srcset='https://cdn.statically.io/img/r9.lv/i/${FILENAME}-1024x.webp, https://cdn.statically.io/img/r9.lv/i/${FILENAME}-2048x.webp 2x'>
    <source type='image/webp' media='(min-width: 460px)' data-srcset='https://cdn.statically.io/img/r9.lv/i/${FILENAME}-768x.webp, https://cdn.statically.io/img/r9.lv/i/${FILENAME}-1536x.webp 2x'> 			
    <source type='image/webp' media='(max-width: 459px)' data-srcset='https://cdn.statically.io/img/r9.lv/i/${FILENAME}-450x.webp, https://cdn.statically.io/img/r9.lv/i/${FILENAME}-900x.webp 2x'>
    <img class='placeholder' src='https://cdn.statically.io/img/r9.lv/i/${FILENAME}-700x-gray-placeholder.webp' alt='${DESCRIPTION} | © 2020 Janis Rullis | ruu.lv' title='${DESCRIPTION} | © 2020 Janis Rullis | ruu.lv'  data-src='https://cdn.statically.io/img/r9.lv/i/${FILENAME}-1600x.webp'>
  </picture>
" >> img.html;

echo "
<!DOCTYPE html>
<html>
  <head>	 
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap-grid.min.css' integrity='sha256-D9AvR0EzkNZoWZVSvI3ch+uf/Z5izrIpcbsykVphwPU=' crossorigin='anonymous' />
<script type='application/ld+json'>		
	{
	   '@context':'https://schema.org',
	   '@type':'Article',
     '@id':'${HTML_URL}/#article',
	   'datePublished':'${DATE_W_HYPENS}T10:00:00+08:00',
	   'dateModified':'${DATE_W_HYPENS}T10:20:00+08:00',
	   'url':'${HTML_URL}',
	   'mainEntityOfPage':{
	      '@type':'WebPage',
	      '@id':'${HTML_URL}/#webpage',
	      'url':'${HTML_URL}',
	      'isPartOf':{
		 '@type':'WebSite',
		 '@id':'https://ruu.lv/#website',
		 'url':'https://ruu.lv',
		 'name':'Analog Photography | ruu.lv'
	      }
	   },
	   'headline':'${HTML_TITLE}',
	   'description':'Life captured on a photographic film 📸',
	   'author':{
	      '@type':'Person',
	      'name':'Janis Rullis'
	   },
	   'publisher':{
	      '@type':'Organization',
	      '@id':'https://ruu.lv/#organization',
	      'name':'Analog Photography | ruu.lv',
	      'logo':{
		 '@type':'ImageObject',
		 'url':'https://cdn.statically.io/img/ruu.lv/ui/img/logo/20191224-Poga-0001-Eyes-by-Janis-Rullis-1024x.jpg'
	      }
	   },
	   'image':[
	      {
		 '@type':'ImageObject',
		 '@id':'${HTML_URL}/#post-image',
		 'url':'https://cdn.statically.io/img/r9.lv/i/${FILENAME}-1024x.webp',
		 'width':1024,
		 'height':689
	      }
	   ]
	}
		</script>
	  
	<style>
		img {
		display: block;
		margin: 0 auto;
		max-width: 100%;		
		}
		img.placeholder{
		width: 100%;
		min-height: 100px;
		}
	 </style>	   
	<link rel='shortcut icon' type='image/webp' href='https://cdn.statically.io/img/ruu.lv/ui/img/logo/favicon-32.webp'/>
	<meta charset='UTF-8'>
	<meta name='theme-color' content='#1d2523'/>
	<link rel='manifest' href='https://ruu.lv/manifest.json' />
	<meta name='viewport' content='width=device-width'>
	  
	<title>${HTML_TITLE}</title>	  
	<meta name='title' content='${HTML_TITLE}'>
	<meta name='description' content='Life captured on a photographic film 📸'>	 
	<link rel='canonical' href='${HTML_URL}' />	

	<!-- Open Graph / Facebook -->
	<meta property='og:type' content='website'>
	<meta property='og:url' content='${HTML_URL}' >
	<meta property='og:title' content='${HTML_TITLE}'>
	<meta property='og:description' content='Life captured on a photographic film 📸'>
	<meta property='og:image' content='https://cdn.statically.io/img/r9.lv/i/{FILENAME}-1024x.webp'>

	<!-- Twitter -->
	<meta property='twitter:card' content='summary_large_image'>
	<meta property='twitter:url' content='${HTML_URL}'>	
	<meta property='twitter:title' content='${HTML_TITLE}'>
	<meta property='twitter:description' content='Life captured on a photographic film 📸'>
	<meta property='twitter:image' content='https://cdn.statically.io/img/r9.lv/i/${FILENAME}-1024x.webp'>	
" >> "${HTML_FILENAME}";