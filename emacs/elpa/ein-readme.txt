Development
===========

Event vs hook vs callback
-------------------------

* Use events (`ein:events') for calling (possibly multiple) functions
  for its side effect.
* Use hooks for global/configurable setting.
* Use callback when caller needs returned value.
  (e.g., `:get-buffers' slot in `ein:kernelinfo')

Naming
------

Variable named `ein:%VAR-NAME%' is a permanent buffer local
variable defined by `ein:deflocal'.  It is often an instance of a
class/struct named `ein:VAR-NAME'.

Old naming rule:
* `ein:@VAR-NAME'/`ein:VAR-NAME' is a permanent buffer local
  variable.  These variables are obsolete now.
* `ein:$STRUCT-NAME' is a name of struct.
  These strcuts will be renamed to `ein:CLASS-NAME' when
  reimplementing them using EIEIO class instead of CL struct.

See also:
`CLiki : naming conventions <http://www.cliki.net/naming%20conventions>`_
