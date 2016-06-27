def diff(value, top, bottom):
  if value > bottom and value < top:
    return True
  else:
    return False

for i in range(20000,30000):
  print i/100000.0 ** 2 * 3.141592 * 0.07
  test = diff( 3.141592 * (i/100000.0) ** 2 * 0.07, 1.2, 1.4)
#  if ( (3.141592 * (i/100000) ** 2) * 0.07) == 1.3675:
  if test:
    print i/100000

print "Done"
