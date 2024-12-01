
"use strict";

let SubUnmigrated = require('./SubUnmigrated.js');
let SimpleMigrated = require('./SimpleMigrated.js');
let Converged = require('./Converged.js');
let MigratedAddSub = require('./MigratedAddSub.js');
let MigratedMixed = require('./MigratedMixed.js');
let PartiallyMigrated = require('./PartiallyMigrated.js');
let MigratedExplicit = require('./MigratedExplicit.js');
let MigratedImplicit = require('./MigratedImplicit.js');
let Renamed5 = require('./Renamed5.js');
let Constants = require('./Constants.js');
let Simple = require('./Simple.js');
let Unmigrated = require('./Unmigrated.js');

module.exports = {
  SubUnmigrated: SubUnmigrated,
  SimpleMigrated: SimpleMigrated,
  Converged: Converged,
  MigratedAddSub: MigratedAddSub,
  MigratedMixed: MigratedMixed,
  PartiallyMigrated: PartiallyMigrated,
  MigratedExplicit: MigratedExplicit,
  MigratedImplicit: MigratedImplicit,
  Renamed5: Renamed5,
  Constants: Constants,
  Simple: Simple,
  Unmigrated: Unmigrated,
};
