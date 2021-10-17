# Stateless Microservice for Hackerbay

A simple stateless microservice in Nodejs, with three major functionalities -

 * Authentication
 * JSON patching
 * Image Thumbnail Generation


## Setup

The API requires [Node.js](https://nodejs.org/en/download/)

To get up and running: 

**1.** Clone the repo.
```
git clone https://github.com/Akintola-stephen/hackerbay-backend-task.git
```

**2.**  ```cd``` into repo.
```
cd hackerbay-backend-task
```

**3.**  Install dependencies
```
npm install
```

**4.**  Run app  on port  (  it runs on port 3000  ) with ```npm start```.

**5.**  **Important** Create a ```.env``` file and set ```jwtSecret``` to any secret phrase you want.
 

## Testing the API routes.

Testing should be done with postman [Postman](https://www.getpostman.com/) since this a  API with post and patch requests 

### Authentication
This is a mock authentication so you can pass in any username or password to login.
 1. Set  request to **POST** and the url to _/api/users/login_. 
 2. In the **Body** for the Postman request, select **x-www-form-urlencoded**.
 3.  Setting 2 keys ( one for username and password). You can set  the ```username``` key to any name.  And the ```password``` to any password (minimum of 6 characters).
 4. Hit ```Send```. Your result should be in this format:
 ```
{
    "user": "stephen23",
    "authorized": true,
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InN0ZXBoZW4yMyIsImlhdCI6MTYzNDI2NDgyOCwiZXhwIjoxNjM0Mjg2NDI4fQ.PxnJteKsgCBkc1o8YmO48Qctmgu0I-xVWdHitUpsFzg"
}
 ```


 ### JSON patching
Apply json patch to a json object, and return the resulting json object.
 1. Set  request to **PATCH** and the url to _/api/patch-object_.
 2. Set the key ```jsonObject``` to an object you would like to patch. Set the key ```jsonPatchObject``` to the object you want to use to patch the ```jsonObject```.
 ```
 Examples:
 jsonObject
 { "user": { "firstName": "Akintola", "lastName": "Stephen" } }

 jsonPatchObject
 [{"op": "replace", "path": "/user/firstName", "value": "Akintola"}, {"op": "replace", "path": "/user/lastName", "value": "Stephen"}]
 ```
 3. Since this is a secure route, for testing, you will have to set the token in the ```Header```. Set key as ```token``` and value as token you received from **Authentication**.
 4. Expected result should be:
 ```
 { "user": { "firstName": "Akintola", "lastName": "Stephen" } }
 ```


 ### Image Thumbnail Generation
This request contains a public image URL. It downloads the image, resizes to 50x50 pixels, and returns the resulting thumbnail.
 1. Set the request to **POST** and the url to _/api/create-thumbnail_.
 2. Set the key ```imageUrl``` to a public image url.
 3. Since this is a secure route, for testing, you will have to set the token in the ```Header```. Set key as ```token``` and value as token you received from **Authentication**.
 4. Image will be downloaded and converted to a thumbnail of size 50x50 pixels with a sample result as below:
 ```
 {
    "converted": true,
    "user": "Stephen",
    "success": "Image has been resized",
    "thumbnail": "./public/images/resized/"
}
```


## Unit Testing

Unit testing is done using mochai.

Run ```npm test``` from the application's root directory.

## Logging

All logs are saved in ```hackerbay.log``` in the application's root.


## Built With

 * [Node.js](https://nodejs.org)
 * [Express](https://expressjs.com/)
 * [Mocha](https://mochajs.org/) - For testing


## Known Issues

 1. Test for thumbnail generation with [Mocha](https://mochajs.org/) _'it should accept a public image url and return a resized image'_ returns a promise which is currently not being handled properly.
 2. _Dockerfile_ has been fully tested. run the command **docker pull panumy/hackerbay_test:hackerbay_test**
 3. _Istanbul_ coverage working as expected.
