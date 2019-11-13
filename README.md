# iOS-ReactiveKit Sample App
A simple Twitter client with two screens:
  - Log In
    - There should be fields to type in a username and a password
    - Upon tapping a "Log In" button, the code should eventually call `TwitterClient.logIn(username:, password:)` with the provided credentials; i.e. there may be intermediate objects and/or method calls in between tapping the button and calling `logIn(username:, password:)`
    - Once `TwitterClient.isLoggedIn.value` goes to `true`, the app should show the Tweet Feed screen
  - Tweet Feed
    - Show a list of tweets (Provided by `TwitterClient.shared.loadTimeline`)
      - Cells should include a title with the posting user’s handle and the content of the tweet
    - Navigation bar should have a "Log Out" button. On tapping this button:
      - `TwitterClient.shared.isLoggedIn.value` should be set to `false`
      - The Log In screen should be shown
  - If `TwitterClient.isLoggedIn.value` is `true` on app launch, the app should go straight to the Tweet Feed screen
  
## Notes
- #### `TwitterClient`
Note that the `isLoggedIn` property is a ReactiveKit reactive `Property`. 
In order to listen for changes to this value, we use code like: 
```
isLoggedIn.observeNext { (isLoggedIn: Bool) -> Void in /* handle logged in status change */ }
