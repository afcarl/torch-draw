----------------------------------------------------------------------
--
-- Copyright (c) 2011 Ronan Collobert, Clement Farabet
--
-- Permission is hereby granted, free of charge, to any person obtaining
-- a copy of this software and associated documentation files (the
-- "Software"), to deal in the Software without restriction, including
-- without limitation the rights to use, copy, modify, merge, publish,
-- distribute, sublicense, and/or sell copies of the Software, and to
-- permit persons to whom the Software is furnished to do so, subject to
-- the following conditions:
--
-- The above copyright notice and this permission notice shall be
-- included in all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
-- EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-- MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
-- NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
-- LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
-- OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
-- WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
--
----------------------------------------------------------------------
-- description:
--     image - an image toolBox, for Torch
--
-- history:
--     July  1, 2011, 7:42PM - import from Torch5 - Clement Farabet
----------------------------------------------------------------------

require 'torch'
require 'image'
require 'libdraw'

draw = {}

--- Draw a rectangle
function draw.rectangle(img,x1,y1,x2,y2,thickness,rgb)
   local thickness = thickness or 1
   local rgb = rgb or (img:type() == 'torch.ByteTensor' and {255,0,0}) or {1.0,1.0,1.0}
   -- Draw
   img.draw.fillRectangle(img,x1-thickness/2,y1+thickness/2,x1+thickness/2,y2-thickness/2,unpack(rgb))
   img.draw.fillRectangle(img,x1-thickness/2,y1-thickness/2,x2+thickness/2,y1+thickness/2,unpack(rgb))
   img.draw.fillRectangle(img,x2-thickness/2,y1+thickness/2,x2+thickness/2,y2-thickness/2,unpack(rgb))
   img.draw.fillRectangle(img,x1-thickness/2,y2-thickness/2,x2+thickness/2,y2+thickness/2,unpack(rgb))
end

return draw
