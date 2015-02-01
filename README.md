# clean-script
[![Build Status](https://travis-ci.org/boennemann/clean-script.svg)](https://travis-ci.org/boennemann/clean-script)
[![Dependency Status](https://david-dm.org/boennemann/clean-script.svg)](https://david-dm.org/boennemann/clean-script)
[![devDependency Status](https://david-dm.org/boennemann/clean-script/dev-status.svg)](https://david-dm.org/boennemann/clean-script#info=devDependencies)

[![NPM](https://nodei.co/npm/clean-script.png?downloads=true&downloadRank=true&stars=true)](https://nodei.co/npm/clean-script/)

Naively one tries to run something like this:
```
test && cleanup
```

If tests fail cleanup will never be called though.
Try `clean-script` instead:
```bash
npm i -g clean-script
clean-script 'test' 'cleanup'
```

MIT License 
2015 Stephan Bönnemann
