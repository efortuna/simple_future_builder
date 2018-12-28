# simple_future_builder

A simplified FutureBuilder for the most common use case when working with Futures in Flutter.

This package is hardly necessary, but it saves you a little typing.

## Getting Started

Usage is really simple. Just import 

`import package:simple_future_builder/simple_future_builder.dart';`

and then in your code, suppose you have some computation that is completing in the future, like
`Future<String> getAsyncVersion()`. Type:

    SimpleFutureBuilder<String>(
        future: getAsyncVersion(),
        builder: (BuildContext context, String result) => Text(result),
    )

Please note, if you want to deal with full error handling based on the results of the future, you will instead need to use the FutureBuilder widget.