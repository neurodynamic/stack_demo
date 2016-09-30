# DECISIONS

## sass with webpack instead of elm-css or similar
### Justification
- :hover very tricky to do with elm-css or similar
- not all attributes available in elm-css

## use popping list in model
### Justification
I wanted to be able to pop multiple things without waiting for the pop animation to finish, so I needed it to work such that the popped item was added *as soon as pop was clicked*. Simplest way to do this seemed to be to separate the popping items from the regular items so that the popped item didn't have to stay in the list while its animation played.