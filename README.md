# How to run 
- Make sure device have flutter sdk (v2.x.x) better 2.5++
- Clone this repo
- flutter pub get
- Then run (Android or IOS)

# techtest

## techtest_a_job_thing

### What kind of architecture did you use?
- for architecture like MVC but more divided, I follow uncle bob's clean architecture concept, the version is simpler and sufficient for scalable projects

### What libraries did you add to the app? What are they used for? if you not rely the other library tell us why?
- connectivity_plus: for detect stream network status, because flutter favorite and work like i want
- dio: for http/s request, because complete handle
- flutter_dotenv: for set env hostname, because as long as I use this it still suffices my needs to implement the env model
- provider: for state management, because light, as one of the state management recommendations recommended by flutter, and reviewed at last year's flutter event
- oktoast: for toast, because easy to use and enough for needs
- intl: for formater datetime, because basic formater from flutter
- url_launcher: for launch (open send email, open url WhatsApp) because flutter favorite and work like i want 

### How long did you spend on the test?
- total if in hours maybe around 9 hours

### If you had more time, what further improvements or new features would you add?
- maybe make a good UI, because right now I'm more focused on data processing

### Which parts of your submission are you most proud of? And why? little advice, dont answer whole project, use one what you think it special.
- the filter flow on the home page (search)

### Which parts did you spend the most time with? What did you find most difficult?
- probably the most difficult is the one to think about the filter flow on the home page (search)

### How did you find the test overall? If you have any suggestions on how we can improve the test or our API, we'd love to hear them, please elaborate more about this.
- all good, this test can show how the candidate code and how to candidate solve problem, for the API itself there may be additional pagination so that the candidate can show how he handles data if the data list is loaded periodically, and for some endpoints a filter by ID must be provided to get details, like production api which the candidate will hold (same type)

### The last question, quality or quantity?
- depending on the case first, if for internal products or maintenable products I choose quality, for consumer goods production products I choose quantity
