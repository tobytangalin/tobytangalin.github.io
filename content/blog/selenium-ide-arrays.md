---
title: "Selenium IDE Arrays"
date: 2020-05-28T07:39:21
lastmod: 2020-06-29T06:17:42
slug: "selenium-ide-arrays"
description: "Learn how to work with Selenium IDE arrays. Create arrays, add elements, and read arrays."
categories: ["uncategorized"]
images: ["https://sitegrammar.com/wp-content/uploads/2020/05/create-array-selenium-IDE-1.png"]
comments: true
---

Working with arrays in Selenium IDE can be a bit confusing at first but don't worry. I'll show you how to create an array, add elements to an array, and access elements within an array.

## Create an Array in Selenium IDE

To create an array, use this: **Command** = `execute script` | **Target** = `return[]` | **Value** = `myArray`

<figure class="wp-block-image size-large"><img loading="lazy" decoding="async" width="537" height="85" src="/wp-content/uploads/2020/05/create-array-selenium-IDE-1.png" alt="" class="wp-image-79" srcset="/wp-content/uploads/2020/05/create-array-selenium-IDE-1.png 537w, /wp-content/uploads/2020/05/create-array-selenium-IDE-1-300x47.png 300w" sizes="(max-width: 537px) 100vw, 537px" /></figure>

  * `execute script` tells Selenium IDE that we want to run a JavaScript snippet.
  * `return[]` is the JavaScript snippet that we want to run.
  * `myArray` is the variable where our return value will be stored.

It works! But how does it work?

  1. Selenium runs our JavaScript snippet that returns an empty array.
  2. We then tell our variable `myArray` to reference (or point to) this empty array.
  3. myArray is now an array!

Congratulations, you now have to power to create arrays in Selenium IDE! Please use this power wisely.

[Learn more about the execute script command here.](https://www.selenium.dev/selenium-ide/docs/en/api/commands#execute-script)

## Add Elements to an Array in Selenium IDE

There are several ways to add elements to an array. I'll show you how to add elements using `execute script`, `array.concat`, and the `store` command.

### Adding array elements using execute script

To initialize an array and add elements to it using `execute script`, use this: **Command** = `execute script` | **Target** = `return [1,2,3]` **OR** `return ["Element 1", "Element 2", "Element 3"]` | **Value** = `myArray`

This method is perfect for creating arrays that do not change. In a single command, it creates an array and adds elements to it.

### Adding array elements using array.concat

To add an element to an array using `array.concat`, use this: **Command** = `execute script` | **Target** = `return ${myArray}.concat("Value to store")` | **Value** = `myArray`

Each new element is inserted at the end of the array. If you are planning to add additional elements later in your program, this method is ideal.

### Adding array elements using the store command

To add an element to an array using the `store` command, use this: **Command** = `store` | **Target** = `The element I want to add` | **Value** = `myArray[0]`. To add multiple elements to an array you can use a [Control Flow command](https://www.selenium.dev/selenium-ide/docs/en/introduction/control-flow) to create a loop in order to increment the index value.

I prefer not to use this method because at the time of writing it does not work with Selenium IDE's forEach Control Flow command. You'll need to create your own custom loop to iterate over the array.

## Read Elements in an Array in Selenium IDE

There are several ways to read the elements in an array. I'll show you how to read elements using the for each command and using the element's index.

### Reading elements in an array using the for each command

To read elements using the `for each` command, use this: **Command** = `for each` | **Target** = `myArray` | **Value** = `iterator`

Here is an example of its use:

<figure class="wp-block-image size-large"><img loading="lazy" decoding="async" width="586" height="114" src="/wp-content/uploads/2020/05/access-elements-foreach-selenium-IDE.png" alt="" class="wp-image-85" srcset="/wp-content/uploads/2020/05/access-elements-foreach-selenium-IDE.png 586w, /wp-content/uploads/2020/05/access-elements-foreach-selenium-IDE-300x58.png 300w" sizes="(max-width: 586px) 100vw, 586px" /></figure>

In this example, I am iterating through an array called arrEmployees and writing each element value to a Google form.

### Reading elements in an array using the element's index

To read elements using the element's index in an array, simply include the index of the element when calling the array.

Here is an example:

<figure class="wp-block-image size-large"><img loading="lazy" decoding="async" width="508" height="52" src="/wp-content/uploads/2020/06/access-array-element-using-index.png" alt="" class="wp-image-95" srcset="/wp-content/uploads/2020/06/access-array-element-using-index.png 508w, /wp-content/uploads/2020/06/access-array-element-using-index-300x31.png 300w" sizes="(max-width: 508px) 100vw, 508px" /></figure>

In this example, I am echoing the value of the 2nd element in the array: "orange".

That's all for now folks! You now possess invaluable knowledge that grants the power to create, edit, and read arrays and their elements. Thanks for reading!
