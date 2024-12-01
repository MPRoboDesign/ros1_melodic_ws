
"use strict";

let TestEmpty = require('./TestEmpty.js');
let TestWithHeader = require('./TestWithHeader.js');
let TestArray = require('./TestArray.js');
let TestStringInt = require('./TestStringInt.js');
let ArrayOfVariableLength = require('./ArrayOfVariableLength.js');
let VariableLengthArrayOfExternal = require('./VariableLengthArrayOfExternal.js');
let FixedLengthStringArray = require('./FixedLengthStringArray.js');
let EmbeddedFixedLength = require('./EmbeddedFixedLength.js');
let WithHeader = require('./WithHeader.js');
let CustomHeader = require('./CustomHeader.js');
let WithTime = require('./WithTime.js');
let EmbeddedExternal = require('./EmbeddedExternal.js');
let HeaderNotFirstMember = require('./HeaderNotFirstMember.js');
let WithMemberNamedHeaderThatIsNotAHeader = require('./WithMemberNamedHeaderThatIsNotAHeader.js');
let VariableLength = require('./VariableLength.js');
let EmbeddedVariableLength = require('./EmbeddedVariableLength.js');
let FixedLengthArrayOfExternal = require('./FixedLengthArrayOfExternal.js');
let VariableLengthStringArray = require('./VariableLengthStringArray.js');
let Constants = require('./Constants.js');
let ArrayOfFixedLength = require('./ArrayOfFixedLength.js');
let WithDuration = require('./WithDuration.js');
let FixedLength = require('./FixedLength.js');
let LatencyMessage = require('./LatencyMessage.js');
let ThroughputMessage = require('./ThroughputMessage.js');
let Point32 = require('./Point32.js');
let ChannelFloat32 = require('./ChannelFloat32.js');
let PointCloud = require('./PointCloud.js');

module.exports = {
  TestEmpty: TestEmpty,
  TestWithHeader: TestWithHeader,
  TestArray: TestArray,
  TestStringInt: TestStringInt,
  ArrayOfVariableLength: ArrayOfVariableLength,
  VariableLengthArrayOfExternal: VariableLengthArrayOfExternal,
  FixedLengthStringArray: FixedLengthStringArray,
  EmbeddedFixedLength: EmbeddedFixedLength,
  WithHeader: WithHeader,
  CustomHeader: CustomHeader,
  WithTime: WithTime,
  EmbeddedExternal: EmbeddedExternal,
  HeaderNotFirstMember: HeaderNotFirstMember,
  WithMemberNamedHeaderThatIsNotAHeader: WithMemberNamedHeaderThatIsNotAHeader,
  VariableLength: VariableLength,
  EmbeddedVariableLength: EmbeddedVariableLength,
  FixedLengthArrayOfExternal: FixedLengthArrayOfExternal,
  VariableLengthStringArray: VariableLengthStringArray,
  Constants: Constants,
  ArrayOfFixedLength: ArrayOfFixedLength,
  WithDuration: WithDuration,
  FixedLength: FixedLength,
  LatencyMessage: LatencyMessage,
  ThroughputMessage: ThroughputMessage,
  Point32: Point32,
  ChannelFloat32: ChannelFloat32,
  PointCloud: PointCloud,
};
