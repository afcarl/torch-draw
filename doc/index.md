# image Package Reference Manual #

__draw__ is the [Torch7](http://torch.ch/) package for drawing. At the moment it consists of a single category:

  * [Drawing](drawing.md) basic geometrical figures;

Note that unless specified otherwise, this package deals with images of size 
`nChannel x height x width`.

## Usage

```lua
> require 'draw'
> l = image.lena()
> draw.rectangle(1, 1, 100, 100)
```
