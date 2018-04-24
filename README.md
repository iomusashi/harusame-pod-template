harusame-pod-template
============

A Pod template for creating api-clients.

## Getting started

Use this template using `pod lib create`:

```
$ pod lib create ForgedHarusame --template-url=https://github.com/iomusashi/harusame-pod-template.git
```

## Updating

Work with the ruby classes inside the `setup` folder, and the example base template that it works on from inside `template/ios/`.

## Best practices

The command `pod lib create` aims to be ran along with this guide: https://guides.cocoapods.org/making/using-pod-lib-create.html so any changes of flow should be updated there also.

It is open to communal input, but adding new features, or new ideas are probably better off being discussed in an issue first. In general we try to think if an average Xcode user is going to use this feature or not, if it's unlikely is it a _very strongly_ encouraged best practice ( ala testing / CI. ) If it's something useful for saving a few minutes every deploy, or isn't easily documented in the guide it is likely to be denied in order to keep this project as simple as possible.

## Requirements:

- CocoaPods 1.0.0+
