# setcpupower
Sets the min/max power states for a laptop running Windows OS

## Installation
Place this file where it is convenient. `%USERPROFILE%` usually works pretty well. Just open Cmd and there is your script.

## Usage
`> setcpupower <MinAC> <MinDC> <MaxAC> <MaxDC>`

## Example
```
> setcpupower 5 5 50 50
CPU power settings updated successfully!
```

## Extra
User can create two shortcuts. One will run with `5 5 50 50` which will be the quiet setup. The other configuration could be `5 5 100 100` which would let the CPU run at fuul speed when performance is needed. The shortcuts could then be assigned hotkeys for easy invokation.
