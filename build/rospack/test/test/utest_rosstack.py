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
#
# Author: Brian Gerkey/Ken Conley

import os
import unittest
from subprocess import Popen, PIPE

ROS_ROOT = 'ROS_ROOT'
ROS_PACKAGE_PATH = 'ROS_PACKAGE_PATH'
ROS_LANG_DISABLE = 'ROS_LANG_DISABLE'
ROSSTACK_PATH = "/home/madhav/Documents/ros1_melodic_ws/devel/.private/rospack/bin/rosstack"

# Set the initial CWD, so that we can set it back later.
# Go up one directory.  Have to do this because nosetests doesn't seem to
# run properly from the parent directory, even with --where= passed in.
initial_cwd = os.path.dirname(os.path.dirname(__file__))
os.chdir(initial_cwd)

aliases = {
    'deps': 'depends',
    'deps1': 'depends1',
    'deps-manifests': 'depends-manifests',
    'deps-indent': 'depends-indent',
    }

## Process-level tests of rosstack executable
class RosstackTestCase(unittest.TestCase):

    def setUp(self):
      # Some tests change CWD
      os.chdir(initial_cwd)
    
    ## runs rosstack with ROS_ROOT set to ./test and ROS_PACKAGE_PATH unset
    ## @return int, str: return code, stdout
    def _run_rosstack(self, ros_root, ros_package_path, pkgname, command):
        env = os.environ.copy()
        if ros_root is not None:
            env[ROS_ROOT] = ros_root
        else:
            del env[ROS_ROOT]            
        if ros_package_path is not None:
            env[ROS_PACKAGE_PATH] = ros_package_path
        elif ROS_PACKAGE_PATH in env:
            del env[ROS_PACKAGE_PATH]
        # Must split up the command string into its whitespace separated
        # components; otherwise you get multiple words as one element of
        # argv.
        #args = ["rospack", command, pkgname]
        args = [ROSSTACK_PATH]
        if command:
          for s in command.split():
            args.append(s)
        if pkgname is not None:
          args.append(pkgname)
        p = Popen(args, stdout=PIPE, stderr=PIPE, env=env)
        stdout, stderr = p.communicate()

        # Also test command aliases, verifying that they give the same 
        # return code and console output
        if command:
          cmd = command.split()[-1] 
          if cmd in aliases:
            args[-2] = aliases[cmd]
            alias_p = Popen(args, stdout=PIPE, stderr=PIPE, env=env)
            alias_stdout, alias_stderr = alias_p.communicate()
            self.assertEquals(p.returncode, alias_p.returncode)
            self.assertEquals(stdout, alias_stdout)
            #self.assertEquals(stderr, alias_stderr)

        return p.returncode, stdout.strip().decode('ascii'), stderr.decode('ascii')

    ################################################################################
    # HELPER ROUTINES
    # NOTE: helpers with the 'e' prefix take in environment parameters
        
    ## @return str: stdout
    def run_rosstack(self, pkgname, command):
        ros_root = os.path.abspath('test')
        return self._run_rosstack(ros_root, None, pkgname, command)[1]

    ## @return str: stdout
    def erun_rosstack(self, ros_root, ros_package_path, pkgname, command):
        return self._run_rosstack(ros_root, ros_package_path, pkgname, command)[1]

    ## runs rospack with ROS_ROOT set to ./test and ROS_PACKAGE_PATH unset
    ## @return int: status code
    def run_rosstack_status(self, pkgname, command):
        ros_root = os.path.abspath('test')        
        return self._run_rosstack(ros_root, None, pkgname, command)[0]

    ## @return int: status code
    def erun_rosstack_status(self, ros_root, ros_package_path, pkgname, command):
        return self._run_rosstack(ros_root, ros_package_path, pkgname, command)[0]

    ## assert that rosstack fails on the specified args
    def rosstack_fail(self, package, command):
        ros_root = os.path.abspath('test')
        code, stdout, stderr = self._run_rosstack(ros_root, None, package, command)
        self.assertNotEquals(0, code, "rosstack [%s %s] should have failed. \n\nstdout[%s] \n\nstderr[%s]"%(command, package, stdout, stderr))

    ## assert that rosstack fails on the specified args. includes ROS_ROOT and ROS_PACKAGE_PATH
    def erosstack_fail(self, ros_root, ros_package_path, package, command):
        code, stdout, stderr = self._run_rosstack(ros_root, ros_package_path, package, command)
        self.assertNotEquals(0, code, "rosstack [%s %s] should have failed instead of returning status code 0. \n\nstdout[%s] \n\nstderr[%s]"%(command, package, stdout, stderr))

    ## assert that rosstack succeeds on the specified args
    def rosstack_succeed(self, package, command):
        ros_root = os.path.abspath('test')        
        status_code, stdout, stderr = self._run_rosstack(ros_root, None, package, command)
        self.assertEquals(0, status_code, '"rosstack %s %s" failed with status code [%s] instead of succeeding with [0]. \n\nstdout[%s] \n\nstderr[%s]'%(command, package, status_code, stdout, stderr))

    ## assert that rosstack succeeds on the specified args
    def erosstack_succeed(self, ros_root, ros_package_path, package, command):
        status_code, stdout, stderr = self._run_rosstack(ros_root, ros_package_path, package, command)
        self.assertEquals(0, status_code, "rosstack [%s %s, env ROS_ROOT=%s ROS_PACKAGE_PATH=%s] failed with status code [%s] instead of succeeding with [0]. \n\nstdout[%s] \n\nstderr[%s]"%(command, package, ros_root, ros_package_path, status_code, stdout, stderr))

    # helper routine that does return value validation where the return value from
    # rosstack is an unordered, line-separated list
    def check_ordered_list(self, command, tests):
        for retlist, package in tests:
            expected = set(retlist)
            self.rosstack_succeed(package, command)
            retval = self.strip_opt_ros(self.run_rosstack(package, command))
            retactual = [v for v in retval.split('\n') if v]            
            self.failIf(set(retlist) ^ set(retactual), "rosstack %s %s failed: [%s] vs [%s]"%(command, package, retlist, retactual))
            self.assertEquals('\n'.join(retlist), '\n'.join(retactual))

    # variant of check_ordered_list that allows specifying ros_root and ros_package_path.
    # helper routine that does return value validation where the return value from
    # rosstack is an unordered, line-separated list
    def echeck_ordered_list(self, command, tests):
        for retlist, ros_root, ros_package_path, package in tests:
            expected = set(retlist)
            self.erosstack_succeed(ros_root, ros_package_path, package, command)
            retval = self.erun_rosstack(ros_root, ros_package_path, package, command)
            retactual = [v for v in retval.split('\n') if v]
            self.failIf(set(retlist) ^ set(retactual), "[env %s %s] rosstack %s %s failed: [%s] vs [%s]"%(ros_root, ros_package_path, command, package, retlist, retactual))

    # variant that does not require ordering among the return values
    def check_unordered_list(self, command, tests):
        for retlist, package in tests:
            expected = set(retlist)
            self.rosstack_succeed(package, command)
            retval = self.run_rosstack(package, command)
            retactual = [v for v in retval.split('\n') if v]            
            self.failIf(set(retlist) ^ set(retactual), "rosstack %s %s failed: [%s] vs [%s]"%(command, package, retlist, retactual))
            #self.assertEquals('\n'.join(retlist), '\n'.join(retactual))

    # variant that does not require ordering among the return values
    def echeck_unordered_list(self, command, tests):
        for retlist, ros_root, ros_package_path, package in tests:
            expected = set(retlist)
            self.erosstack_succeed(ros_root, ros_package_path, package, command)
            retval = self.erun_rosstack(ros_root, ros_package_path, package, command)
            retactual = [v for v in retval.split('\n') if v]            
            self.failIf(set(retlist) ^ set(retactual), "rosstack %s %s failed: [%s] vs [%s]"%(command, package, retlist, retactual))
            #self.assertEquals('\n'.join(retlist), '\n'.join(retactual))

        
    ################################################################################
    ## ARG PARSING
        
    def test_no_option(self):
        self.rosstack_succeed(None, None)

    def test_fake_option(self):
        self.rosstack_fail("deps", "--fake deps")

    def test_invalid_option(self):
        self.rosstack_fail("deps", "list --length=10")

    def test_no_package_allowed(self):
        self.rosstack_succeed(None, "help")
        self.rosstack_succeed(None, "profile")
        self.rosstack_succeed(None, "list")
        self.rosstack_succeed(None, "list-names")

    def test_no_package_allowed_bad(self):
        self.rosstack_fail("deps", "profile")
        self.rosstack_fail("deps", "list")
        self.rosstack_fail("deps", "list-names")

    def test_contents(self):
        tests = [(["precedence1", "precedence2", "precedence3", "roslang"],
                  os.path.abspath("test2"), os.path.abspath("test2"), "test2")]
        self.echeck_unordered_list("contents", tests)

    # Bug #2854
    def test_path_precendence(self):
        tests = [([os.path.abspath("stack_install/stack")],
                  os.path.abspath("test"),
                  ':'.join([os.path.abspath("stack_install"), os.path.abspath("stack_overlay")]), "stack"),
                 ([os.path.abspath("stack_install/stack")],
                  os.path.abspath("test"),
                  ':'.join([os.path.abspath("stack_install"), os.path.abspath("stack_overlay/stack")]), "stack"),
                 ([os.path.abspath("stack_install/stack")],
                  os.path.abspath("test"),
                  ':'.join([os.path.abspath("stack_install/stack"), os.path.abspath("stack_overlay/stack")]), "stack"),
                 ([os.path.abspath("stack_install/stack")],
                  os.path.abspath("test"),
                  ':'.join([os.path.abspath("stack_install/stack"), os.path.abspath("stack_overlay")]), "stack")]
        self.echeck_unordered_list("find", tests)

# TODO: port / adapt these rospack tests to exercise rosstack, #2009
#
#    def test_invalid_option_order(self):
#        self.rospack_fail("deps", "--lang=cpp --attrib=lflags export")
#        self.rospack_fail("deps", "--lang=cpp export --attrib=lflags")
#        self.rospack_fail("deps", "--deps-only cflags-only-I")
#
#    def test_export_bad(self):
#        self.rospack_fail("base", "export --lang= --attrib=lflags")
#        self.rospack_fail("base", "export --lang=cpp --attrib=")
#        self.rospack_fail("base", "export --attrib=lflags")
#        self.rospack_fail("base", "export --lang=cpp")
#        self.rospack_fail("base", "export --lang=cpp --lang=python --attrib=lflags")
#        self.rospack_fail("base", "export --lang=cpp --attrib=lflags --attrib=cflags")
#        self.rospack_fail("base", "export --lang=cpp --attrib=cflags --top=foo")
#
#    def test_plugins_bad(self):
#        self.rospack_fail("base", "plugins")
#        self.rospack_fail("base", "plugins --lang=cpp")
#        self.rospack_fail("base", "plugins --attrib=")
#        self.rospack_fail("base", "plugins --top=foo")
#  
#    ################################################################################
#    ## EXPORT
#
#    def test_export_cpp(self):
#        package = 'base'
#        tests = [("-lfoo", "export --lang=cpp --attrib=lflags"),
#                 ("-lfoo", "export --attrib=lflags --lang=cpp"),
#                 ("-Isomething", "export --lang=cpp --attrib=cflags"),
#                 ("-Isomething", "export --attrib=cflags --lang=cpp"),
#                ]
#        for retval, arg in tests:
#            self.rospack_succeed(package, arg)
#            self.assertEquals(retval, self.strip_opt_ros(self.run_rospack(package, arg)))
#        #TODO: test export with $prefix
#        #TODO: test export with non-cpp attribs
#
#    def test_export_non_existent_attrib(self):
#        self.rospack_succeed("base", "export --lang=cpp --attrib=fake")
#        self.failIf(self.run_rospack("base", "export --lang=cpp --attrib=fake"))
#
#    ################################################################################
#    ## Plugins
#
#    def test_plugins(self):
#        tests = [(["deps foo.cmake", "plugins bat.cmake"], "base")]
#        self.check_unordered_list("plugins --attrib=cmake", tests)
#
#        package = 'base'
#        tests = [("deps foo.cmake", "plugins --attrib=cmake --top=deps")]
#        for retval, arg in tests:
#            self.rospack_succeed(package, arg)
#            self.assertEquals(retval, self.strip_opt_ros(self.run_rospack(package, arg)))
#        package = 'base_two'
#        tests = [("deps bar.cmake", "plugins --attrib=cmake")]
#        for retval, arg in tests:
#            self.rospack_succeed(package, arg)
#            self.assertEquals(retval, self.strip_opt_ros(self.run_rospack(package, arg)))
#
#    ################################################################################
#    ## ENVIRONMENT TEST
#
#    def test_no_ros_root(self):
#        testp = os.path.abspath('test')
#        self.erospack_fail(None, testp, "deps", "deps")
#
#    def test_bad_ros_root(self):
#        # #468 test. this is the chosen exit code, distinguish against segfault
#        non_existent1 = os.path.abspath('non_existent1')
#        testp = os.path.abspath("test")        
#        self.assertNotEquals(0, self.erun_rospack_status(non_existent1, testp, "deps", "deps"))
#
#    ## test rospack with ROS_ROOT=ROS_PACKAGE_PATH 
#    def test_ros_root__ros_package_path_identical(self):
#        #implicitly depending on the deps test here
#        #set ros_package_path to be identical to ros_root
#        testp = os.path.abspath('test')        
#        tests = [
#            (["base", "base_two"], testp, testp, "deps"),
#            ]
#        self.echeck_ordered_list("deps", tests)
#
#    ## test rospack with ROS_PACKAGE_PATH set to the empty string
#    def test_empty_ros_package_path(self):
#        testp = os.path.abspath('test')        
#        tests = [
#            (["base", "base_two"], testp, '', "deps"),
#            ]
#        self.echeck_ordered_list("deps", tests)
#
#    ## tests rpp vs rr precedence
#    def test_ros_package_path_precedence_1(self):
#        testp = os.path.abspath('test')
#        test2p = os.path.abspath('test2')
#        test3p = os.path.abspath('test3')                
#        tests = [
#            (["test"], testp, test2p, "precedence1"),
#            (["test2"], test2p, testp, "precedence1"),
#            (["test2"], testp, "%s:%s"%(test2p, test3p), "precedence2"),
#            (["test3"], testp, "%s:%s"%(test3p, test2p), "precedence2"),
#            ]
#        self.echeck_ordered_list('libs-only-l', tests)
#
#    # test ability to point ros_package_path directly at package
#    def test_ros_package_path_direct_package(self):
#        testp = os.path.abspath('test')
#        test2p = os.path.abspath('test2')
#        test3p = os.path.abspath('test3')        
#        # point directly at precedence 2/3
#        rpp = ':'.join([os.path.join(test2p, 'precedence2'),os.path.join(test3p, 'precedence3')])
#        tests = [
#            (["test2"], testp, rpp, "precedence2"),
#            (["test3"], testp, rpp, "precedence3"),
#            ]
#        self.echeck_ordered_list('libs-only-l', tests)
#        
#    def test_ros_package_path_colons(self):
#        # scatter some colons into ros package path to make sure rospack doesn't mind
#        testp = os.path.abspath('test')
#        test2p = os.path.abspath('test2')
#        test3p = os.path.abspath('test3')                
#        tests = [
#            (["base","base_two"], testp, "::%s:::"%testp, "deps"),
#            (["base","base_two"], testp, "::", "deps"),
#            ]
#        self.echeck_ordered_list('deps', tests)
#        tests = [
#            (["test"], testp, ":::%s:"%test2p, "precedence1"),
#            (["test2"],testp, "::%s::%s::"%(test2p,test3p), "precedence2"),
#            ]
#        self.echeck_ordered_list("libs-only-l", tests)
#
#    def test_ros_package_path_bad_paths(self):
#        testp = os.path.abspath('test')
#        test2p = os.path.abspath('test2')
#        non_existentp = os.path.abspath('test')
#        tests = [
#            (["test"], testp, non_existentp, "precedence1"),
#            (["test2"],testp, ":%s:%s"%(non_existentp, test2p), "precedence2"),
#            (["test2"],testp, ":%s:%s"%(test2p, non_existentp), "precedence2"),
#            ]
#        self.echeck_ordered_list("libs-only-l", tests)
#
#    ################################################################################
#    ## rospack list
#        
#    def _rospack_list(self, ros_root, ros_package_path):
#        env = os.environ.copy()
#        if ros_root is not None:
#            env[ROS_ROOT] = ros_root
#        else:
#            del env[ROS_ROOT]            
#        if ros_package_path is not None:
#            env[ROS_PACKAGE_PATH] = ros_package_path
#        elif ROS_PACKAGE_PATH in env:
#            del env[ROS_PACKAGE_PATH]
#        args = ["rospack", 'list']
#        p = Popen(args, stdout=PIPE, stderr=PIPE, env=env)
#        retval = p.communicate()[0]
#        return p.returncode, retval.strip().decode('ascii')
#        
#    def _check_rospack_list(self, expected, retval):
#        lines = [l for l in retval.split('\n') if l]
#        packages = [l[:l.find(' ')] for l in lines]
#        # canonicalize paths
#        paths = [os.path.abspath(l[l.find(' ')+1:]) for l in lines]
#        result = {}
#        for pack, path in zip(packages, paths):
#            result[pack] = os.path.abspath(path) 
#        self.failIf(set(expected.keys()) ^ set(packages), "package lists do not match (expected vs. actual): %s vs %s"%(expected.keys(), packages))
#        for pack,path in expected.items():
#            self.assertEquals(path, result[pack])
#
#    ## test rospack list on an empty tree
#    def test_rospack_list_empty(self):
#        rr = os.path.abspath('test_empty')
#        retcode, retval = self._rospack_list(rr, None)
#        self.assertEquals(0, retcode)
#        self.failIf(retval, "rospack list on empty directory returned value %s"%retval)
#        
#    # test that rospack list removes duplicates
#    def test_rospack_list_dups(self):
#        # make sure result is same if ROS_ROOT=ROS_PACKAGE_PATH
#        rr = os.path.abspath('structure_test')        
#        retcode, retval = self._rospack_list(rr, None)
#        self.assertEquals(0, retcode)
#        retcode2, retval2 = self._rospack_list(rr, rr)
#        self.assertEquals(0, retcode2)
#        self.assertEquals(retval, retval2, "rospack list did not remove duplicates")
#        
#    def test_rospack_list_no_rpp(self):
#        rr = os.path.abspath('structure_test')
#        expected = structure_test.copy()
#        retcode, retval = self._rospack_list(rr, None)
#        self.assertEquals(0, retcode)
#        self._check_rospack_list(expected, retval)
#        
#        #TODO: symlink test
#        #TODO: test with ros package path 
#
#    ################################################################################
#    ## rospack list-names
#        
#    def _rospack_list_names(self, ros_root, ros_package_path):
#        env = os.environ.copy()
#        if ros_root is not None:
#            env[ROS_ROOT] = ros_root
#        else:
#            del env[ROS_ROOT]            
#        if ros_package_path is not None:
#            env[ROS_PACKAGE_PATH] = ros_package_path
#        elif ROS_PACKAGE_PATH in env:
#            del env[ROS_PACKAGE_PATH]
#        args = ["rospack", 'list-names']
#        p = Popen(args, stdout=PIPE, stderr=PIPE, env=env)
#        retval = p.communicate()[0]
#        return p.returncode, retval.strip().decode('ascii')
#        
#    ## test rospack list-names on an empty tree
#    def test_rospack_list_names_empty(self):
#        rr = os.path.abspath('test_empty')
#        retcode, retval = self._rospack_list_names(rr, None)
#        self.assertEquals(0, retcode)
#        self.failIf(retval, "rospack list-names on empty directory returned value %s"%retval)
#        
#    # test that rospack list removes duplicates
#    def test_rospack_list_names_dups(self):
#        # make sure result is same if ROS_ROOT=ROS_PACKAGE_PATH
#        rr = os.path.abspath('structure_test')        
#        retcode, retval = self._rospack_list_names(rr, None)
#        self.assertEquals(0, retcode)
#        retcode2, retval2 = self._rospack_list_names(rr, rr)
#        self.assertEquals(0, retcode2)
#        self.assertEquals(retval, retval2, "rospack list-names did not remove duplicates")
#        
#    def test_rospack_list_names_no_rpp(self):
#        rr = os.path.abspath('structure_test')
#        expected = set(structure_test.copy().keys())
#        retcode, retval = self._rospack_list_names(rr, None)
#        self.assertEquals(0, retcode)
#        self.assertEquals(expected, set(retval.split()))
#        
#        #TODO: symlink test
#        #TODO: test with ros package path 
#
#    ################################################################################
#    ## rospack find
#        
#    ## test rospack find on non-existent package
#    def test_rospack_find_fail(self):
#        rr = os.path.abspath('test_empty')
#        self.erospack_fail(rr, None, 'package', 'find')
#
#    ## test rospack find with ros_package_path set directly to a package
#    def test_rospack_find_direct(self):
#        testp = os.path.abspath('test')
#        package1p = os.path.abspath(os.path.join('structure_test', 'package1'))
#        self.erospack_succeed(testp, package1p, 'package1', 'find')
#        self.assertEquals(package1p, self.erun_rospack(testp, package1p, 'package1', 'find'))
#        
#    def test_rospack_find_no_rpp(self):
#        rr = os.path.abspath('structure_test')
#        expected = structure_test.copy()
#        for package,path in expected.items():
#            self.erospack_succeed(rr, None, package, 'find')
#            self.assertEquals(path, os.path.abspath(self.erun_rospack(rr, None, package, 'find')))
#
#        #TODO: symlink test
#        #TODO: test with ros package path 
#
#    ################################################################################
#    ## DEPENDENCIES
#
#    def test_deps(self):
#        depth_list = ['depth-%s'%i for i in range(1, 101)]
#        depth_list.reverse()
#        tests = [
#            (["base","base_two"], "deps"),
#            (["base","base_two","deps"], "deps_higher"),
#            (["base","base_two","deps","deps_higher"],"deps_dup"),
#            (depth_list, "depth-0")
#            ]
#        self.check_ordered_list('deps', tests)        
#
#    def test_deps1(self):
#        tests = [        
#            (["base","base_two"], "deps"),
#            (["deps"], "deps_higher"),
#            (["depth-1"], "depth-0"),
#            (["depth-99"], "depth-98"),
#            ]
#        self.check_ordered_list('deps1',tests)
#
#    def test_deps_invalid(self):
#        self.rospack_fail("deps_invalid", "deps")
#
#    def test_depends_on(self):
#        depth_list = ['depth-%s'%i for i in range(0, 100)]
#        depth_list.reverse()
#
#        self.rospack_succeed("deps", "depends-on")
#        tests = [
#            (["deps_higher","deps_dup"], "deps"),
#            ([], "depth-0"),
#            (depth_list, "depth-100"),
#            ]
#        self.check_ordered_list("depends-on", tests)
#
#    def test_depends_on1(self):
#        # sanity check first
#        self.rospack_succeed("deps", "depends-on")
#        tests = [
#            (["deps_higher"], "deps"),
#            (["deps", "deps_dup", "plugins"], "base"),
#            (["deps", "deps_dup"], "base_two"),            
#            ]
#        self.check_unordered_list("depends-on1", tests)
#
#    def test_depends_on_nonexistent(self):
#        self.rospack_fail("deps", "deps_nonexistent")
#        self.rospack_fail("deps", "nonexistentpackage")
#        tests = [
#            (["deps_nonexistent"], "nonexistentpackage"),
#            ]
#        self.check_ordered_list("depends-on", tests)
#
#    def test_lflags_base(self):
#        self.rospack_succeed("base", "libs-only-l")
#        self.assertEquals("foo", self.run_rospack("base", "libs-only-l"))
#
#    def test_circular(self):
#        testp = os.path.abspath("test")
#        self.erospack_fail(testp, os.path.abspath("test_circular/cycle0"), "self_ref", "deps")
#        self.erospack_fail(testp, os.path.abspath("test_circular/cycle1"), "friend1", "deps")
#        self.erospack_fail(testp, os.path.abspath("test_circular/cycle1"), "friend2", "deps")
#        self.erospack_fail(testp, os.path.abspath("test_circular/cycle2"), "friend1", "deps")
#        self.erospack_fail(testp, os.path.abspath("test_circular/cycle2"), "friend2", "deps")
#        self.erospack_fail(testp, os.path.abspath("test_circular/cycle2"), "friend3", "deps")
#
#    def test_lflags_backquote(self):
#        self.rospack_succeed("backquote", "libs-only-l")
#        self.assertEquals("loki foo backquote", self.run_rospack("backquote", "libs-only-l"))
#
#    def test_backquote_invalid(self):
#        self.rospack_fail("backquote_invalid", "libs-only-other")
#
#    # Strip out '/opt/ros' and friends from flags before checking them
#    def strip_opt_ros(self, flags):
#      prefix = '/opt/ros'
#      if 'ROS_BINDEPS_PATH' in os.environ:
#        prefix = os.environ['ROS_BINDEPS_PATH']
#      tostrip = [prefix + '/lib', 
#                 prefix + '/include', 
#                 '-L' + prefix + '/lib', 
#                 '-I' + prefix + '/include',
#                 '-Wl,-rpath,' + prefix + '/lib']
#      res = ''
#      for f in flags.split(' '):
#        if f and f not in tostrip:
#          if len(res) > 0:
#            res += ' '
#          res += f
#      return res
#
#    def test_Lflags_backquote(self):
#        self.rospack_succeed("backquote", "libs-only-L")
#        self.assertEquals("odin", self.strip_opt_ros(self.run_rospack("backquote", "libs-only-L")))
#
#    def test_cflags_backquote(self):
#        self.rospack_succeed("backquote", "cflags-only-I")
#        self.assertEquals("blah backquote", self.strip_opt_ros(self.run_rospack("backquote", "cflags-only-I")))
#
#    def test_lflags_deps(self):
#        self.rospack_succeed("deps", "libs-only-l")
#        self.assertEquals("loki foo bar", self.run_rospack("deps", "libs-only-l"))
#
#    def test_lflags_deps_only(self):
#        self.rospack_succeed("deps", "libs-only-l --deps-only")
#        self.assertEquals("foo bar", self.run_rospack("deps", "libs-only-l --deps-only"))
#
#    def test_empty_lflags(self):
#        tests = [([], "deps_empty")]
#        commands = ["libs-only-l", "libs-only-L", "libs-only-other"]
#        for c in commands:
#            self.check_ordered_list(c, tests)
#
#    def test_empty_cflags(self):
#        tests = [([], "deps_empty")]
#        commands = ["cflags-only-I", "cflags-only-other"]
#        for c in commands:
#            self.check_ordered_list(c, tests)
#
#    def test_empty_vcs(self):
#        self.rospack_succeed("empty", "vcs0")
#        self.assertEquals("type: \turl:", self.run_rospack("empty", "vcs0"))
#        self.rospack_succeed("deps_empty", "vcs")
#        self.assertEquals("type: svn\turl: \ntype: \turl:", self.run_rospack("deps_empty", "vcs"))
#
#    def test_lflags_invalid(self):
#        self.rospack_fail("invalid", "libs-only-l")
#
#    def test_vcs_invalid(self):
#        self.rospack_fail("invalid", "vcs")
#
#    def test_deps1_invalid(self):
#        self.rospack_fail("invalid", "deps1")
#
#    def test_vcs0_deps(self):
#        self.rospack_succeed("deps", "vcs0")
#        self.failIf(self.run_rospack("deps", "vcs0"))
#
#    def test_vcs_deps(self):
#        self.rospack_succeed("deps", "vcs")
#        self.assertEquals("type: svn\turl: https://ros.svn.sourceforge.net/svnroot/ros/trunk\n"+
#                          "type: svn\turl: https://ros.svn.sourceforge.net/svnroot/ros/branches", self.run_rospack("deps", "vcs"))
#
#    def test_deps_manifests(self):
#        self.rospack_succeed("deps", "deps-manifests")
#        testp = os.path.abspath('test')
#        expected = os.path.join(testp, 'base/manifest.xml') + ' ' + os.path.join(testp, 'base_two/manifest.xml')
#        self.assertEquals(expected, 
#                          self.run_rospack("deps", "deps-manifests"))
#
#    def test_deps_indent(self):
#        self.rospack_succeed("deps_higher", "deps-indent")
#        testp = os.path.abspath('test')
#        expected = 'deps\n  base\n  base_two'
#        self.assertEquals(expected, 
#                          self.run_rospack("deps_higher", "deps-indent"))
#
#    def _rospack_langs(self, ros_root, ros_package_path, ros_lang_disable):
#        env = os.environ.copy()
#        if ros_root is not None:
#            env[ROS_ROOT] = ros_root
#        else:
#            del env[ROS_ROOT]            
#        if ros_package_path is not None:
#            env[ROS_PACKAGE_PATH] = ros_package_path
#        elif ROS_PACKAGE_PATH in env:
#            del env[ROS_PACKAGE_PATH]
#        if ros_lang_disable is not None:
#            env[ROS_LANG_DISABLE] = ros_lang_disable
#        elif ROS_LANG_DISABLE in env:
#            del env[ROS_LANG_DISABLE]
#        args = ["rospack", 'langs']
#        p = Popen(args, stdout=PIPE, stderr=PIPE, env=env)
#        retval = p.communicate()[0]
#        return p.returncode, retval.strip().decode('ascii')
#
#    def test_langs(self):
#        rr = os.path.abspath('test')
#        retcode, retval = self._rospack_langs(rr, None, None)
#        self.assertEquals(0, retcode)
#        # No guarantees on ordering of lang result
#        l = retval.split()
#        s = set(l)
#        expected = set(['rosfoo', 'rosbar'])
#        self.assertEquals(s, expected)
#
#    def test_langs_disable(self):
#        rr = os.path.abspath('test')
#        disable = 'rosfoo'
#        retcode, retval = self._rospack_langs(rr, None, disable)
#        self.assertEquals(0, retcode)
#        # No guarantees on ordering of lang result
#        l = retval.split()
#        s = set(l)
#        expected = set(['rosbar'])
#        self.assertEquals(s, expected)
#
#    def test_langs_empty(self):
#        rr = os.path.abspath('test2')
#        retcode, retval = self._rospack_langs(rr, None, None)
#        self.assertEquals(0, retcode)
#        self.failIf(retval, "rospack langs on empty directory returned value %s"%retval)
