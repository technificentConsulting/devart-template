_by kikko_

In this late race towards completion of a prototype for the competition deadline, I've found a great ally : The [paper.js sketchpad](http://sketch.paperjs.org/).

It's "just" an online editor providing an interactive quick preview of the sketch. It's extremely easy to use, and you can use Paperscript (basically just a scoped javascript with operator overrides for mathematical operations on Points..etc)

![image](../project_images/tech/paperjs_sketchpad.jpg)

I've been using it a lot the last few hours to implement some animated/interactive bits of our project. This allows me to prototype small parts on a clean sketch, that I then write back in coffescript in our application. That way I can concentrate on the code of the part and not worry about it's integration in the bigger app.
This workflow has proven to be very efficient and iterative since it's easy to share the sketch and get feedback. And most importantly, it's extremely fun!

Here are a couple sketchs I did, before importing the code in our application :

https://www.youtube.com/watch?v=AoRxW2XAXq8
_Kinetic minimalist tree_, [sketch](http://sketch.paperjs.org/#S/pVdbj+I2FP4rLpVWgYA3zHSkluw8dNhuVakjrUS1fZjpQ0gMWBNs5Jgw7Yr/3uNr7CRTrVQeIJybz+U75zhfJ6w4kslqsnkhsjxM5pOSV+p/Wwh0LF4fRMHKA2nQPVre5c9Mkykz5N8J28sDsO4yx3IanvVD5nh7wS+bEyEVUDOcOWuSHskDkRdCWHDYnVeD0z7SRgJnROxHEDJiW01c85oLoD9Pvn+4W/+yzp4necj/k1baqxuvJwUh82eG4LPt7D79lRvakZ8b8oXUvKTyb+X4HFWPA1og+5krfUYu6DOnTCZTpzBgGKWTIK3mx0zt3+7MSkk5Qw2R51MyRV+NjvLZiv8quOLkHQOfaMtlZA2cziIRCZE2Oy6Oa84kYUp6V9QNiczwhurDQ0stJRfc0H8IvqhMzjJ8N0cd8UDo/iAV1R1nvsH/3+Ag0RZ1AsZMAf+g5ct8rPxOt6gqQ9LxXaOMHIrmE3i5ORUlSQAdQs5R4RMEoSWquPQ+yxH94AqLa41KIKXp1Iqqj8YHxOnknqgrv+eua96QjQHvFusD8Z5Ih0zjwhR9+A+49kw20Hc/s32tKvlYyAMutk1SLLa4JSUuFEOZWwZadJcEfrx7F5jwkbuPAMQIFlVVfa7m0f5YISnOZJDgqEwd9OgOJb10qqC7QRF5ElfQUb+lOv14gtLgk8pWIwV/IaafZzCc8HI0zDiowB93gPlW7hRzZIEkBfXlUpx20JuOcyqEaR92ruvcpaifoSiaAdh08Xc1h6zoR6BX/JhMZ30rISj9wduAGBwy6rHmGGxpGHukjdrQWVDjLeBWvF8YFY6ojhu6Zw7IY7HcpEv4WtzmsXYBOrcZmnkTC/RTeN4VXQ60JolxJk1VR2QK+kHHtEG3oOn/CcUB2uXG/p2hXjAw31I141AvGg2fbkCgFLUjsfRD+W58lg0jsagm0NKh6+7U8Xnvsrzweb32gQ/d69d1f7enKApd5aK34xc9FXdwZ1W1JxQ2GUwOwAR6Hw2Pga6FFBAST5z3vYyXje5YUo4tWw94YBZ5R/N1Xw4sqWHjTMGj76VgCLlLR3AFGQq5m0dwDwmFYDLZHTJKVVAiZbTDgbcGPFWJkowz4NN8OjeHpA+VlR1zAT5USlYwAHuStgYr3xmBALizUl8BSTmy0t8RUQ2qlf0NGL6cq+7RAnS47jn7JGDZdWPbFjn/9n0ftszbyz7etth4PdxGuDwLsfHtbsQCYhoTvwDGGFy3ihpuSYkdDxa74YDot/bYWVp3uOti56P5ld5D52Gf5EXInM78tTwP1a3XfhSWNWckWiReJlgo5mnRuzXDzKDvb9Ob8dm8tfuc7I+QruYpgwWvelYb9KHnbyssRxV0CayH8eCLnVPJiW/0i0hATXs3FfwFv1NS/xaeoeZjhm/euEY7qRF0a1uPvCUJaT3awvcG0pog85AVvIM4Pn4Fd/w7BX510yR4ywhMjbrxkV9Y6IYOQ5AjeKcHDqDaA8F3WnOqKWwv2Dz9W4s7xr7DWMXJ9V8=)

The sketch's code is encoded directly in the url of the sketch.

![image](../project_images/tech/paperjs_sketchpad_2.gif)
_Mr. Kalia's scarf_, [sketch](http://sketch.paperjs.org/#S/hVNNj9owEP0rVnrYpLAR243aBZZDlao9rVQJVT0ABytxwNrERrYTilb8987Yzgcfq+WC8+bNvOeZ8VsgaMWCWbB8ZSbbBeMgkzl+N1SRveTCaLIgD5P5WiCyVbTh5ghQ0kLa8KIQTCNvEj95tGRia3YAPba8A88tkCQeyGQpFQB3n6bf0q/p9A5wF6lkrRlEBDuQ3+ghjLpYwwF0oV9K1vtBaE+tgM2CY/gGAaONkq8sRa2Zkxz38F/0NHPW1uKEpbB+TPM83fEyD7FkL8BEflGfwO+mQh/wGo8Tj+ZU774rRY8zskrGyQZ11wJKo2q4mozJZIOSHWLdDVGjqNCFVFUqhWHCgKeClppduQeyMw9kEuINOA5pDn/PfrhwHo0i7Ahe1Qr2XQcvnHz2s4x8qVpkhktBpPipYHXCiGCf2wIFV9os2bYCX7GVAEU7T8w2vZEF2nh2Ju4fnA07sLWxW+VKQLIt6z/1im/mPUmwf60WED0nRnRAalhm7J7pM1f3w2yHtUk2Ie422B188CopPpLRon0X75GQEl7qe2M3jETQ9O5Z2ZqnrsG6khJ2zw7Dvs2z/rhJ4JLspeZ2TnDxVdvmzeCiSFLSUE8Kr1jgrMO+eCyKqdiWDEJTfNeni414wUG/yIaFrGF4DzvR9jlbrHNwM/eHPIizXLvQRV2WxyUroWEMX6BRNXuvwp/9x/ntazkFp/8=)