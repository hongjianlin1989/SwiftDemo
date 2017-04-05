# SwiftDemo

### Note
This is a demo for Zocdors, so the authToken can be expires at anytime. If you meet so we can just do a code review inside. Welcome to discuss more if you need.

### USE Case
run the app, you can see there are a list of top ten movies with details shows

click one of the cell:
get navigate to detail page for selected movie.

click PurchaseButton:
It just get redirect to Zocdoc home page.

Poster:
png is generated with its movie id. 

### UI design

The entire project is using auto-layout. Due to the fact that its lack of design, so we would just make it looks good so far. The design is adapted for all iPhones screen(5,6,6+). 

Also welcome to discuss the way without auto-layout.


### Code design

Network request is designed to follow the patten: 
Object: the response object parsed from Json
Service: providing API and Param
Request: all requests need to be handled in this class

UITableView Implementation:
so far data source and delegate are both lived in the same class. if the project goes bigger, we can think about refactor it out to separate class.
CustomCell need so that it can reduce some code and have it handle build cell function.



#### Navigation
UINavigationController is being used for this project. 


#### Unit testing
In SwiftDemoTests.swift, there are couple unit tests written for API. 
