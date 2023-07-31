//Types of Providers
/*Provider: It is the object that provide data to the Widgets or other providers
            and it is the read only widget and cannot update the value inside,
            it can be used to provide primitve ,non-primitive,instances of class,
            (ref)=>it allows us to talk with other providers
            -> Creating a function
               final nameProvider= Provider((ref) => "Name");
            ->Reading a Provider:  
              1. Make stless as ConsumerWidget, and add WidgetRef ref then call function
              2. Wrap ur  widget inside body with conumer and add builder: (context, ref, child) ,then call fn
                 (This is used bcz when we want to run only the particualr widget not the entire file)
              for reading (ref.read=> it is not prefered to use inside the builder, use in fun etc)
                          (ref.watch=>to track all the changes)
            Note:Provider is read-only method, u cannnot update value , so we use stateProvider              
             */
/*final nameProvider(This is for all provider)*/
/* Widget ref = Allow to communicate from widget to other provider*/

/*StateProvider: we can update the value
                -> we have *notifier which helps to change the value */

/*stateNotifier and stateNotifierProvider
stateNotifier: it is used to create the class like personNotifier (If a user model is there then we use these two)
stateNotifierProvider: it is used to access PersonClsss(), used in main function
*/
/*changeNotifier: same as stateNotifier but it dosent have state in it(immutable=we can change the object ouside of the class) 
                  we hv to create  Person person=const Person(name: "name", age: 0);  
                  ->for this we need   *notifyListeners();
                  */

/*FutureProvider: This provider is based on asynchronus code or http calls*/