# mocha --compilers coffee:coffee-script/register linkify_spec.coffee 

linkify = require('./index')
assert = require("assert")

describe "linkify", ->  
  it "should linkfy multple links in one string", ->
    input = 'Check out this link http://www.example.com and also http://foo.example.com'
    assert.deepEqual(
      linkify(input),
      [
        ['Check out this link '],
        ["http://www.example.com", "http://www.example.com"],
        [' and also '],
        ['http://foo.example.com', 'http://foo.example.com'],
        ['']
      ]
    )

  it "should support all valid URL characters", ->
    input = "http://example.com?name=John%20Smith&age=22&omg=$-_.+!*'()"
    assert.deepEqual(
      linkify(input),
      [
        [ '' ],
        [ 'http://example.com?name=John%20Smith&age=22&omg=$-_.+!*\'()',
          'http://example.com?name=John%20Smith&age=22&omg=$-_.+!*\'()' ],
        [ '' ]
      ]
    )

  it "should prepend an http:// to the href but not the link text", ->
    input = "example.com"
    assert.deepEqual(
      linkify(input),
      [ [ '' ], [ 'example.com', 'http://example.com' ], [ '' ] ]
    )
