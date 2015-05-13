//
//  TinyTests.m
//  TinyTests
//
//  Created by Scott Petit on 5/10/14.
//  Copyright (c) 2014 Scott Petit. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BitlyURLShortenerService.h"
#import "GooglURLShortenerService.h"

@interface BitlyURLShortenerServiceTests : XCTestCase

@property (nonatomic, strong) NSString *accessToken;
@property (nonatomic, strong) BitlyURLShortenerService *service;

@end

@implementation BitlyURLShortenerServiceTests

- (void)setUp
{
    [super setUp];
    
    self.accessToken = @"this-is-my-access-token";
    self.service = [BitlyURLShortenerService serviceWithAccessToken:self.accessToken];
}

- (void)testServiceStoresAccessToken
{
    XCTAssertEqualObjects(self.service.accessToken, self.accessToken);
}

- (void)testCreatingAURLRequestForGoogle
{
    NSURLRequest *request = [self.service URLRequestToShortenURL:[NSURL URLWithString:@"http://google.com"]];
    NSString *expectedURLString = @"https://api-ssl.bitly.com/v3/shorten?access_token=this-is-my-access-token&longURL=http%3A%2F%2Fgoogle.com";
    
    XCTAssertEqualObjects([request.URL absoluteString], expectedURLString);
}

@end

@interface GooglURLShortenerServiceTests : XCTestCase

@property (nonatomic, strong) NSString *apiKey;

@end

@implementation GooglURLShortenerServiceTests

- (void)setUp
{
    [super setUp];
    
    self.apiKey = @"this-is-my-api-key";
}

- (void)testServiceStoresAPIKey
{
    GooglURLShortenerService *service = [GooglURLShortenerService service];
    XCTAssertNil(service.apiKey);
    
    service = [GooglURLShortenerService serviceWithAPIKey:self.apiKey];
    XCTAssertEqualObjects(service.apiKey, self.apiKey);
}

- (void)testCreatingAURLRequestForGoogle
{
    NSURL *URLToShorten = [NSURL URLWithString:@"http://google.com"];
    GooglURLShortenerService *service = [GooglURLShortenerService service];
    NSURLRequest *request = [service URLRequestToShortenURL:URLToShorten];
    NSString *expectedURLString = @"https://www.googleapis.com/urlshortener/v1/url";
    
    XCTAssertEqualObjects(request.URL.absoluteString, expectedURLString);
}

@end
