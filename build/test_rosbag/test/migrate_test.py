#!/usr/bin/env python
# Software License Agreement (BSD License)
#
# Copyright (c) 2008, Willow Garage, Inc.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#
#  * Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
#  * Redistributions in binary form must reproduce the above
#    copyright notice, this list of conditions and the following
#    disclaimer in the documentation and/or other materials provided
#    with the distribution.
#  * Neither the name of Willow Garage, Inc. nor the names of its
#    contributors may be used to endorse or promote products derived
#    from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
# FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
# COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
# BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
# ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.

import sys
import struct

import unittest

import rospkg
import rostest
import rosbag

class MigrationTest(unittest.TestCase):

  def setUp(self):
    self.pkg_dir = rospkg.RosPack().get_path('test_rosbag')
    self.pkg_binary_dir = '/home/madhav/Documents/ros1_melodic_ws/build/test_rosbag'

  def test_unmigrated(self):
    tmp_rule_files = ['migrated_explicit_rules.bmr', 'migrated_mixed_rules.bmr', 'migrated_addsub_rules.bmr']
    rule_files = ["%s/bag_migration_tests/test/%s"%(self.pkg_dir,r) for r in tmp_rule_files]

    inbag = "%s/test/unmigrated_gen1.bag"%(self.pkg_binary_dir,)

    mm = rosbag.migration.MessageMigrator(rule_files,False)
    res = rosbag.migration.checkbag(mm, inbag)

    self.assertTrue(len(res[0][1]) == 1)
    self.assertTrue(not res[0][1][0].valid)
    self.assertEqual(res[0][1][0].old_class._md5sum, '4b12e5ff694b0e2a31b2ea9e0bd900f4')
    self.assertEqual(res[0][1][0].new_class._md5sum, 'fed3471829c6040a8c84cd6c04ec5ab2')


  def test_subunmigrated(self):
    tmp_rule_files = ['migrated_explicit_rules.bmr', 'migrated_mixed_rules.bmr', 'migrated_addsub_rules.bmr']
    rule_files = ["%s/bag_migration_tests/test/%s"%(self.pkg_dir,r) for r in tmp_rule_files]

    inbag = "%s/test/subunmigrated_gen1.bag"%(self.pkg_binary_dir,)

    mm = rosbag.migration.MessageMigrator(rule_files, False)
    res = rosbag.migration.checkbag(mm, inbag)

    self.assertTrue(len(res[0][1]) == 1)
    self.assertTrue(not res[0][1][0].valid)
    self.assertEqual(res[0][1][0].old_class._md5sum, '4b12e5ff694b0e2a31b2ea9e0bd900f4')
    self.assertEqual(res[0][1][0].new_class._md5sum, 'fed3471829c6040a8c84cd6c04ec5ab2')

  def do_partially_migrated(self, N):
    tmp_rule_files = ['migrated_explicit_rules.bmr', 'migrated_mixed_rules.bmr', 'migrated_addsub_rules.bmr', 'partially_migrated_rules.bmr']
    rule_files = ["%s/bag_migration_tests/test/%s"%(self.pkg_dir,r) for r in tmp_rule_files]

    inbag = "%s/test/partially_migrated_gen%d.bag"%(self.pkg_binary_dir,N)

    mm = rosbag.migration.MessageMigrator(rule_files, False)
    res = rosbag.migration.checkbag(mm, inbag)

    self.assertTrue(len(res[0][1]) == 1)
    self.assertTrue(not res[0][1][0].valid)
    self.assertEqual(res[0][1][0].old_class._md5sum, '9fafd0ad3f442b8a7908d03e9bb64de2')
    self.assertEqual(res[0][1][0].new_class._md5sum, '45f99fcf57ef956dd2a6a16472643507')


  def test_partially_migrated_gen1(self):
    self.do_partially_migrated(1)

  def test_partially_migrated_gen2(self):
    self.do_partially_migrated(2)

  def test_partially_migrated_gen3(self):
    self.do_partially_migrated(3)

  def test_partially_migrated_gen4(self):
    self.do_partially_migrated(4)


  def test_addsub(self):
    tmp_rule_files = ['migrated_explicit_rules.bmr', 'migrated_mixed_rules.bmr', 'migrated_addsub_rules.bmr']
    rule_files = ["%s/bag_migration_tests/test/%s"%(self.pkg_dir,r) for r in tmp_rule_files]

    inbag = "%s/test/migrated_addsub_gen1.bag"%(self.pkg_binary_dir,)
    outbag = "%s/test/migrated_addsub_gen1.fixed.bag"%(self.pkg_binary_dir,)

    mm = rosbag.migration.MessageMigrator(rule_files, False)
    res = rosbag.migration.checkbag(mm, inbag)

    self.assertTrue(not False in [m[1] == [] for m in res], 'Bag not ready to be migrated')
    res = rosbag.migration.fixbag(mm, inbag, outbag)
    self.assertTrue(res, 'Bag not converted successfully')

    msgs = [msg for msg in rosbag.Bag(outbag).read_messages()]

    self.assertTrue(len(msgs) > 0)

    self.assertEqual(msgs[0][1].field1.field1, 42)
    self.assertEqual(msgs[0][1].field2.field1, 42)


  def do_migrated_explicit(self, N):
    tmp_rule_files = ['migrated_explicit_rules.bmr', 'migrated_mixed_rules.bmr', 'migrated_addsub_rules.bmr']
    rule_files = ["%s/bag_migration_tests/test/%s"%(self.pkg_dir,r) for r in tmp_rule_files]

    inbag = "%s/test/migrated_explicit_gen%d.bag"%(self.pkg_binary_dir,N)
    outbag = "%s/test/migrated_explicit_gen%d.fixed.bag"%(self.pkg_binary_dir,N)

    mm = rosbag.migration.MessageMigrator(rule_files, False)
    res = rosbag.migration.checkbag(mm, inbag)
    self.assertTrue(not False in [m[1] == [] for m in res], 'Bag not ready to be migrated')

    res = rosbag.migration.fixbag(mm, inbag, outbag)
    self.assertTrue(res, 'Bag not converted successfully')

    msgs = [msg for msg in rosbag.Bag(outbag).read_messages()]

    self.assertTrue(len(msgs) > 0)

    self.assertEqual(msgs[0][1].field2, struct.unpack('<f',struct.pack('<f',58.2))[0])
    self.assertEqual(msgs[0][1].combo_field3, "aldfkja 17")
    self.assertEqual(msgs[0][1].field4, 82)

  def test_migrated_explicit_gen1(self):
    self.do_migrated_explicit(1)

  def test_migrated_explicit_gen2(self):
    self.do_migrated_explicit(2)

  def test_migrated_explicit_gen3(self):
    self.do_migrated_explicit(3)

  def test_migrated_explicit_gen4(self):
    self.do_migrated_explicit(4)



  def do_migrated_implicit(self, N):
    tmp_rule_files = ['migrated_explicit_rules.bmr', 'migrated_mixed_rules.bmr', 'migrated_addsub_rules.bmr']
    rule_files = ["%s/bag_migration_tests/test/%s"%(self.pkg_dir,r) for r in tmp_rule_files]

    inbag = "%s/test/migrated_implicit_gen%d.bag"%(self.pkg_binary_dir,N)
    outbag = "%s/test/migrated_implicit_gen%d.fixed.bag"%(self.pkg_binary_dir,N)

    mm = rosbag.migration.MessageMigrator(rule_files, False)
    res = rosbag.migration.checkbag(mm, inbag
)
    self.assertTrue(not False in [m[1] == [] for m in res], 'Bag not ready to be migrated')
    res = rosbag.migration.fixbag(mm, inbag, outbag)
    self.assertTrue(res, 'Bag not converted successfully')

    msgs = [msg for msg in rosbag.Bag(outbag).read_messages()]

    self.assertTrue(len(msgs) > 0)

    self.assertEqual(msgs[0][1].field4.field2, struct.unpack('<f',struct.pack('<f',58.2))[0])
    self.assertEqual(msgs[0][1].field4.combo_field3, "aldfkja 17")
    self.assertEqual(msgs[0][1].field4.field4, 82)

    self.assertEqual(msgs[0][1].field1, 34)
    self.assertEqual(msgs[0][1].field2, struct.unpack('<f',struct.pack('<f',16.32))[0])
    self.assertEqual(msgs[0][1].field3, "kljene")


  def test_migrated_implicit_gen1(self):
    self.do_migrated_implicit(1)

  def test_migrated_implicit_gen2(self):
    self.do_migrated_implicit(2)

  def test_migrated_implicit_gen3(self):
    self.do_migrated_implicit(3)

  def test_migrated_implicit_gen4(self):
    self.do_migrated_implicit(4)



  def do_migrated_mixed(self, N):
    tmp_rule_files = ['migrated_explicit_rules.bmr', 'migrated_mixed_rules.bmr', 'migrated_addsub_rules.bmr']
    rule_files = ["%s/bag_migration_tests/test/%s"%(self.pkg_dir,r) for r in tmp_rule_files]

    inbag = "%s/test/migrated_mixed_gen%d.bag"%(self.pkg_binary_dir,N)
    outbag = "%s/test/migrated_mixed_gen%d.fixed.bag"%(self.pkg_binary_dir,N)

    mm = rosbag.migration.MessageMigrator(rule_files, False)
    res = rosbag.migration.checkbag(mm, inbag)

    self.assertTrue(not False in [m[1] == [] for m in res], 'Bag not ready to be migrated')
    res = rosbag.migration.fixbag(mm, inbag, outbag)
    self.assertTrue(res, 'Bag not converted successfully')

    msgs = [msg for msg in rosbag.Bag(outbag).read_messages()]

    self.assertTrue(len(msgs) > 0)

    self.assertEqual(msgs[0][1].field1.field4.field2, struct.unpack('<f',struct.pack('<f',58.2))[0])
    self.assertEqual(msgs[0][1].field1.field4.combo_field3, "aldfkja 17")
    self.assertEqual(msgs[0][1].field1.field4.field4, 82)

    self.assertEqual(msgs[0][1].field1.field1, 34)
    self.assertEqual(msgs[0][1].field1.field2, struct.unpack('<f',struct.pack('<f',16.32))[0])
    self.assertEqual(msgs[0][1].field1.field3, "kljene")

    self.assertEqual(msgs[0][1].field2, 59)

  def test_migrated_mixed_gen1(self):
    self.do_migrated_mixed(1)

  def test_migrated_mixed_gen2(self):
    self.do_migrated_mixed(2)

  def test_migrated_mixed_gen3(self):
    self.do_migrated_mixed(3)

  def test_migrated_mixed_gen4(self):
    self.do_migrated_mixed(4)



  def do_renamed(self, N):
    tmp_rule_files = ['migrated_explicit_rules.bmr', 'migrated_mixed_rules.bmr', 'migrated_addsub_rules.bmr', 'renamed_rules.bmr']
    rule_files = ["%s/bag_migration_tests/test/%s"%(self.pkg_dir,r) for r in tmp_rule_files]

    inbag = "%s/test/renamed_gen%d.bag"%(self.pkg_binary_dir,N)
    outbag = "%s/test/renamed_gen%d.fixed.bag"%(self.pkg_binary_dir,N)

    mm = rosbag.migration.MessageMigrator(rule_files, False)
    res = rosbag.migration.checkbag(mm, inbag
)
    self.assertTrue(not False in [m[1] == [] for m in res], 'Bag not ready to be migrated')
    res = rosbag.migration.fixbag(mm, inbag, outbag)
    self.assertTrue(res, 'Bag not converted successfully')

    msgs = [msg for msg in rosbag.Bag(outbag).read_messages()]

    self.assertTrue(len(msgs) > 0)


    self.assertEqual(msgs[0][1]._type, 'test_rosbag/Renamed5', 'Type name is wrong')
    self.assertEqual(msgs[0][1].foo, struct.unpack('<d',struct.pack('<d',2.17))[0])
    self.assertEqual(msgs[0][1].bar, (8, 2, 5, 1))


  def test_renamed_gen1(self):
    self.do_renamed(1)

  def test_renamed_gen2(self):
    self.do_renamed(2)

  def test_renamed_gen3(self):
    self.do_renamed(3)

  def test_renamed_gen4(self):
    self.do_renamed(4)


  def do_converged(self, N):
    tmp_rule_files = ['migrated_explicit_rules.bmr', 'migrated_mixed_rules.bmr', 'migrated_addsub_rules.bmr', 'renamed_rules.bmr', 'simple_migrated_rules.bmr', 'converged_rules.bmr']
    rule_files = ["%s/bag_migration_tests/test/%s"%(self.pkg_dir,r) for r in tmp_rule_files]

    inbag = "%s/test/converged_gen%d.bag"%(self.pkg_binary_dir,N)
    outbag = "%s/test/converged_gen%d.fixed.bag"%(self.pkg_binary_dir,N)

    mm = rosbag.migration.MessageMigrator(rule_files, False)
    res = rosbag.migration.checkbag(mm, inbag)

    self.assertTrue(not False in [m[1] == [] for m in res], 'Bag not ready to be migrated')
    res = rosbag.migration.fixbag(mm, inbag, outbag)
    self.assertTrue(res, 'Bag not converted successfully')

    msgs = [msg for msg in rosbag.Bag(outbag).read_messages()]

    self.assertTrue(len(msgs) > 0)

    self.assertEqual(msgs[0][1]._type, 'test_rosbag/Converged', 'Type name is wrong')
    self.assertEqual(msgs[0][1].field1[0], struct.unpack('<f',struct.pack('<f',1.2))[0])
    self.assertEqual(msgs[0][1].field1[1], struct.unpack('<f',struct.pack('<f',3.4))[0])
    self.assertEqual(msgs[0][1].field1[2], struct.unpack('<f',struct.pack('<f',5.6))[0])
    self.assertEqual(msgs[0][1].field1[3], struct.unpack('<f',struct.pack('<f',7.8))[0])

    self.assertEqual(msgs[0][1].field2[0].data, 11)
    self.assertEqual(msgs[0][1].field2[1].data, 22)
    self.assertEqual(msgs[0][1].field2[2].data, 33)
    self.assertEqual(msgs[0][1].field2[3].data, 44)


  def test_converged_gen1(self):
    self.do_converged(1)

  def test_converged_gen2(self):
    self.do_converged(2)

  def test_converged_gen3(self):
    self.do_converged(3)

  def test_converged_gen4(self):
    self.do_converged(4)


  def do_convergent(self, N):
    tmp_rule_files = ['migrated_explicit_rules.bmr', 'migrated_mixed_rules.bmr', 'migrated_addsub_rules.bmr', 'renamed_rules.bmr', 'simple_migrated_rules.bmr', 'converged_rules.bmr']
    rule_files = ["%s/bag_migration_tests/test/%s"%(self.pkg_dir,r) for r in tmp_rule_files]

    inbag = "%s/test/convergent_gen%d.bag"%(self.pkg_binary_dir,N)
    outbag = "%s/test/convergent_gen%d.fixed.bag"%(self.pkg_binary_dir,N)

    mm = rosbag.migration.MessageMigrator(rule_files, False)
    res = rosbag.migration.checkbag(mm, inbag)

    self.assertTrue(not False in [m[1] == [] for m in res], 'Bag not ready to be migrated')
    res = rosbag.migration.fixbag(mm, inbag, outbag)
    self.assertTrue(res, 'Bag not converted successfully')

    msgs = [msg for msg in rosbag.Bag(outbag).read_messages()]

    self.assertTrue(len(msgs) > 0)

    self.assertEqual(msgs[0][1]._type, 'test_rosbag/Converged', 'Type name is wrong')
    self.assertEqual(msgs[0][1].field1[0], struct.unpack('<f',struct.pack('<f',1.2))[0])
    self.assertEqual(msgs[0][1].field1[1], struct.unpack('<f',struct.pack('<f',3.4))[0])
    self.assertEqual(msgs[0][1].field1[2], struct.unpack('<f',struct.pack('<f',5.6))[0])
    self.assertEqual(msgs[0][1].field1[3], struct.unpack('<f',struct.pack('<f',7.8))[0])

    self.assertEqual(msgs[0][1].field2[0].data, 11)
    self.assertEqual(msgs[0][1].field2[1].data, 22)
    self.assertEqual(msgs[0][1].field2[2].data, 33)
    self.assertEqual(msgs[0][1].field2[3].data, 44)


  def test_convergent_gen1(self):
    self.do_convergent(1)

  def test_convergent_gen2(self):
    self.do_convergent(2)




  def do_constants_no_rules(self, N):
    tmp_rule_files = []
    rule_files = ["%s/bag_migration_tests/test/%s"%(self.pkg_dir,r) for r in tmp_rule_files]

    inbag = "%s/test/constants_gen%d.bag"%(self.pkg_binary_dir,N)
    outbag = "%s/test/constants_gen%d.fixed.bag"%(self.pkg_binary_dir,N)

    mm = rosbag.migration.MessageMigrator(rule_files, False)
    res = rosbag.migration.checkbag(mm, inbag)

    self.assertTrue(len(res[0][1]) == 1)
    self.assertTrue(not res[0][1][0].valid)
    self.assertEqual(res[0][1][0].old_class._md5sum, '06a34bda7d4ea2950ab952e89ca35d7a')
    self.assertEqual(res[0][1][0].new_class._md5sum, 'b45401c4d442c4da7b0a2a105075fa4a')


  def do_constants_rules(self, N):
    tmp_rule_files = ['constants.bmr']
    rule_files = ["%s/bag_migration_tests/test/%s"%(self.pkg_dir,r) for r in tmp_rule_files]

    inbag = "%s/test/constants_gen%d.bag"%(self.pkg_binary_dir,N)
    outbag = "%s/test/constants_gen%d.fixed.bag"%(self.pkg_binary_dir,N)

    mm = rosbag.migration.MessageMigrator(rule_files, False)
    res = rosbag.migration.checkbag(mm, inbag)

    self.assertTrue(not False in [m[1] == [] for m in res], 'Bag not ready to be migrated')
    res = rosbag.migration.fixbag(mm, inbag, outbag)
    self.assertTrue(res, 'Bag not converted successfully')

    msgs = [msg for msg in rosbag.Bag(outbag).read_messages()]

    self.assertTrue(len(msgs) > 0)

    self.assertEqual(msgs[0][1]._type, 'test_rosbag/Constants', 'Type name is wrong')
    self.assertEqual(msgs[0][1].value, msgs[0][1].CONSTANT)


  def test_constants_no_rules_gen1(self):
    self.do_constants_no_rules(1)

  def test_constants_gen1(self):
    self.do_constants_rules(1)

  def test_constants_gen2(self):
    self.do_constants_rules(2)


if __name__ == '__main__':
  rostest.unitrun('test_rosbag', 'migration_test', MigrationTest, sys.argv)
