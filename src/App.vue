<template>
  <div id="app">
    <router-view/>
  </div>
</template>

<style>
	/* 阿里图标 */
@font-face {
  font-family: 'iconfont';  /* project id 2187798 */
  src: url('//at.alicdn.com/t/font_2187798_4446ubeesw2.eot');
  src: url('//at.alicdn.com/t/font_2187798_4446ubeesw2.eot?#iefix') format('embedded-opentype'),
  url('//at.alicdn.com/t/font_2187798_4446ubeesw2.woff2') format('woff2'),
  url('//at.alicdn.com/t/font_2187798_4446ubeesw2.woff') format('woff'),
  url('//at.alicdn.com/t/font_2187798_4446ubeesw2.ttf') format('truetype'),
  url('//at.alicdn.com/t/font_2187798_4446ubeesw2.svg#iconfont') format('svg');
}

.iconfont{
    font-family:"iconfont" !important;
    font-size:16px;font-style:normal;
    -webkit-font-smoothing: antialiased;
    -webkit-text-stroke-width: 0.2px;
    -moz-osx-font-smoothing: grayscale;}
	
/*base style*/
html, body, div, span, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, abbr, address, cite, code, del, dfn, em, img, ins, kbd, q, samp, small, strong, sub, sup, var, b, i, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, figure, footer, header, menu, nav, section, time, mark, audio, video, details, summary{ margin:0; padding:0;}
body{ font-family:"\5FAE\8F6F\96C5\9ED1","Microsoft Yahei","Arial"; color:#333; background-color:#fff; font-size:15px; background-image:url(about:blank); background-attachment:fixed; overflow-x:hidden;}
a{ color:#06f; text-decoration:none;}
a:hover{ color:#f60; text-decoration:none;}
img{ border:none; vertical-align:middle; max-width: 100%;}
i,em{ font-style:normal;}
li{ list-style-type:none;}
textarea{ resize:vertical;}
input, select, textarea{ font-family:"\5FAE\8F6F\96C5\9ED1","Microsoft Yahei","Arial"; background-color:#fff; margin:0; padding:0; outline:none;}
area{ outline: none;}

/*global style*/
.g-fl{ float:left;}
.g-fr{ float:right;}
.g-c{ zoom:1;}
.g-c:after{ clear:both; content:"."; display:block; height:0; visibility:hidden;}
.g-w{ max-width: 1200px; min-width: 980px; width: 96%; margin-left:auto; margin-right:auto;}
.g-hide{ display:none !important;}
/* 按钮 */
button:focus{
  outline:none!important; 
}

</style>
