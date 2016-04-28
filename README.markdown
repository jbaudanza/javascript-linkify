# JavaScript Linkify: Process links in text! #

Version: 0.4, Feb 16, 2015

This is a fork of Ben Alman's [orginal linkify library] (https://github.com/cowboy/javascript-linkify).

I've packaged the library into an npm module, so you add it to your project like this:

    npm install jbaudanza/javascript-linkify --save

I've changed the function signature to return an array rather than a string. I did this to make it easier to generate React
components, but you could also generate native DOM nodes directly. 

It works somewhat like this:

```javascript
var linkify = require('linkify')
var array = linkfy("Check out this link: www.example.com");
```
   
`array` looks like:
   
```javascript
[
 ['Check out this link'],
 ['www.example.com', 'www.example.com']
]
```
   
   You can then convert this output into React components, DOM nodes, or whatever you need. 
   

## License ##
Copyright (c) 2009 "Cowboy" Ben Alman  
Dual licensed under the MIT and GPL licenses.  
[http://benalman.com/about/license/](http://benalman.com/about/license/)
