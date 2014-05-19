# Tiny

**An extensible wrapper around URL Shorteners**

Tiny is an extensible wrapper for URL Shorteners.  It can currently shorten links for [Googl](http://goo.gl/) and [bitly](http://bit.ly).  If you use a different service writing a wrapper is as easy as conforming to the NTAURLShortenerService protocol and it’s two required methods.

> Tiny is named after [Nate Tiny Archibald](http://en.wikipedia.org/wiki/Nate_Archibald), a former American professional basketball player. He spent 14 years playing in the NBA, most notably with the Cincinnati Royals, Kansas City - Omaha Kings and Boston Celtics. In 1991 he was enshrined in the Naismith Memorial Basketball Hall of Fame.

## Usage

Tiny provides two objects that conform to the NTAURLShortenerService protocol, BitlyURLShortenerService and GooglURLShortenerService.  Simply create a service object with any required data (an access token in bitlys case) and pass it to Tiny.  Tiny provides a single class method that does all the work you need to get shortened URLs back.  All in all this is what a general usage would look like

```objective-c
    GooglURLShortenerService *service = [GooglURLShortenerService service];
    
    [Tiny shortenURL:[NSURL URLWithString:@"http://google.com"] withService:service completion:^(NSURL *shortURL, NSError *error) {
 		       NSLog(@"Short URL - %@", shortURL);
    }];
```

It’s that easy.
