// Copyright (c) 2010, Willow Garage, Inc.
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     * Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in the
//       documentation and/or other materials provided with the distribution.
//     * Neither the name of Willow Garage, Inc. nor the names of its
//       contributors may be used to endorse or promote products derived from
//       this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
// POSSIBILITY OF SUCH DAMAGE.

#include "ros/ros.h"
#include "rosbag/bag.h"
#include "rosbag/chunked_file.h"
#include "rosbag/view.h"

#include <sys/stat.h>
#include <sys/types.h>

#include <iostream>
#include <set>

#include <boost/assign/list_of.hpp>

#include <gtest/gtest.h>

#include "std_msgs/String.h"
#include "std_msgs/Int32.h"

class BagTest : public testing::Test
{
protected:
    std_msgs::String foo_, bar_;
    std_msgs::Int32 i_;
    
    virtual void SetUp() {
        foo_.data = std::string("foo");
        bar_.data = std::string("bar");
        i_.data = 42;
    }

    void dumpContents(std::string const& filename) {
        rosbag::Bag b;
        b.open(filename, rosbag::bagmode::Read);
        dumpContents(b);        
        b.close();
    }

    void dumpContents(rosbag::Bag& b) {
        rosbag::View view(b);
        for (const rosbag::MessageInstance& m : view)
            std::cout << m.getTime() << ": [" << m.getTopic() << "]" << std::endl;
    }

    void checkContents(std::string const& filename) {
        rosbag::Bag b;
        b.open(filename, rosbag::bagmode::Read);

        int message_count = 0;

        rosbag::View view(b);
        for (const rosbag::MessageInstance& m : view) {
            std_msgs::String::ConstPtr s = m.instantiate<std_msgs::String>();
            if (s != NULL) {
                ASSERT_EQ(s->data, foo_.data);
                message_count++;
            }
            std_msgs::Int32::ConstPtr i = m.instantiate<std_msgs::Int32>();
            if (i != NULL) {
                ASSERT_EQ(i->data, i_.data);
                message_count++;
            }
        }
        ASSERT_EQ(message_count, 2);

        b.close();
    }
};

TEST_F(BagTest, write_then_read_works) {
    std::string filename("/tmp/write_then_read_works.bag");

    rosbag::Bag b1;
    b1.open(filename, rosbag::bagmode::Write);
    b1.write("chatter", ros::Time::now(), foo_);
    b1.write("numbers", ros::Time::now(), i_);
    b1.close();

    checkContents(filename);
}

TEST_F(BagTest, append_works) {
    std::string filename("/tmp/append_works.bag");

    rosbag::Bag b1;
    b1.open(filename, rosbag::bagmode::Write);
    b1.write("chatter", ros::Time::now(), foo_);
    b1.close();

    rosbag::Bag b2;
    b2.open(filename, rosbag::bagmode::Append);
    b2.write("numbers", ros::Time::now(), i_);
    b2.close();

    checkContents(filename);
}

TEST_F(BagTest, different_writes) {
    std::string filename("/tmp/different_writes.bag");

    rosbag::Bag b1;
    b1.open(filename, rosbag::bagmode::Write | rosbag::bagmode::Read);

    std_msgs::String msg1;
    std_msgs::String::Ptr msg2 = boost::make_shared<std_msgs::String>();
    std_msgs::String::ConstPtr msg3 = boost::make_shared<std_msgs::String const>();
    
    rosbag::View view;
    view.addQuery(b1);

    b1.write("t1", ros::Time::now(), msg1);
    b1.write("t2", ros::Time::now(), msg2);
    b1.write("t3", ros::Time::now(), msg3);
    b1.write("t4", ros::Time::now(), *view.begin());

    ASSERT_EQ(view.size(), (uint32_t)(4));

    b1.close();
}

TEST_F(BagTest, reopen_works) {
    rosbag::Bag b;

    std::string filename1("/tmp/reopen_works1.bag");
    b.open(filename1, rosbag::bagmode::Write);
    b.write("chatter", ros::Time::now(), foo_);
    b.write("numbers", ros::Time::now(), i_);
    b.close();

    std::string filename2("/tmp/reopen_works1.bag");
    b.open(filename2, rosbag::bagmode::Write);
    b.write("chatter", ros::Time::now(), foo_);
    b.write("numbers", ros::Time::now(), i_);
    b.close();

    checkContents(filename1);
    checkContents(filename2);
}

TEST_F(BagTest, bag_not_open_fails) {
    rosbag::Bag b;
    try
    {
        b.write("/test", ros::Time::now(), foo_);
        FAIL();
    }
    catch (const rosbag::BagIOException& ex) {
        SUCCEED();
    }
}

TEST(rosbag, simple_write_and_read_works) {
    rosbag::Bag b1("/tmp/simple_write_and_read_works.bag", rosbag::bagmode::Write);

    std_msgs::String str;
    str.data = std::string("foo");

    std_msgs::Int32 i;
    i.data = 42;

    b1.write("chatter", ros::Time::now(), str);
    b1.write("numbers", ros::Time::now(), i);

    b1.close();

    rosbag::Bag b2("/tmp/simple_write_and_read_works.bag", rosbag::bagmode::Read);

    std::vector<std::string> topics;
    topics.push_back(std::string("chatter"));
    topics.push_back(std::string("numbers"));

    int count = 0;
    rosbag::View view(b2, rosbag::TopicQuery(topics));
    for (rosbag::MessageInstance const& m : view) {
        std_msgs::String::ConstPtr s = m.instantiate<std_msgs::String>();
        if (s != NULL)
        {
            count++;
            ASSERT_EQ(s->data, std::string("foo"));
        }

        std_msgs::Int32::ConstPtr i = m.instantiate<std_msgs::Int32>();
        if (i != NULL)
        {
            count++;
            ASSERT_EQ(i->data, 42);
        }
    }

    ASSERT_EQ(count,2);

    b2.close();
}

TEST(rosbag, append_indexed_1_2_fails) {
  try{
    rosbag::Bag b("/home/madhav/Documents/ros1_melodic_ws/build/test_rosbag/test/test_indexed_1.2.bag", rosbag::bagmode::Append);

    FAIL();
  }
  catch (const rosbag::BagException& ex) {
    SUCCEED();
  }
}

TEST(rosbag, read_indexed_1_2_succeeds) {
    rosbag::Bag b("/home/madhav/Documents/ros1_melodic_ws/build/test_rosbag/test/test_indexed_1.2.bag", rosbag::bagmode::Read);
    rosbag::View view(b);

    int32_t i = 0;

    for (rosbag::MessageInstance const& m : view) {
        std_msgs::Int32::ConstPtr imsg = m.instantiate<std_msgs::Int32>();
        if (imsg != NULL) {
            ASSERT_EQ(imsg->data, i++);
        }
    }

    b.close();
}


TEST(rosbag, write_then_read_without_read_mode_fails) {
    rosbag::Bag b("/tmp/write_then_read_without_read_mode_fails.bag", rosbag::bagmode::Write);
    std_msgs::String str;
    str.data = std::string("foo");
    b.write("chatter", ros::Time::now(), str);

    try
    {
        rosbag::View view(b);
        for (rosbag::MessageInstance const& m : view) {
            std_msgs::String::ConstPtr s = m.instantiate<std_msgs::String>();
            if (s != NULL) {
                ASSERT_EQ(s->data, std::string("foo"));
            }
        }
        FAIL();
    }
    catch (const rosbag::BagException& ex) {
        SUCCEED();
    }
}

TEST_F(BagTest, read_then_write_without_write_mode_fails) {
    rosbag::Bag b1("/tmp/read_then_write_without_write_mode_fails.bag", rosbag::bagmode::Write);
    b1.write("chatter", ros::Time::now(), foo_);
    b1.close();

    rosbag::Bag b2("/tmp/read_then_write_without_write_mode_fails.bag", rosbag::bagmode::Read);
    try
    {
        b2.write("chatter", ros::Time::now(), foo_);
        FAIL();
    }
    catch (const rosbag::BagException& ex) {
        SUCCEED();
    }
}

TEST(rosbag, time_query_works) {
    rosbag::Bag outbag;
    outbag.open("/tmp/time_query_works.bag", rosbag::bagmode::Write);

    std_msgs::Int32 imsg;

    for (int i = 0; i < 1000; i++) {
        imsg.data = i;
        switch (rand() % 5) {
        case 0: outbag.write("t0", ros::Time(i, 1), imsg); break;
        case 1: outbag.write("t1", ros::Time(i, 1), imsg); break;
        case 2: outbag.write("t2", ros::Time(i, 1), imsg); break;
        case 3: outbag.write("t2", ros::Time(i, 1), imsg); break;
        case 4: outbag.write("t4", ros::Time(i, 1), imsg); break;
        }
    }
    outbag.close();

    rosbag::Bag bag;
    bag.open("/tmp/time_query_works.bag", rosbag::bagmode::Read);

    int i = 23;

    rosbag::View view(bag, ros::Time(23, 1), ros::Time(782, 1));
    for (rosbag::MessageInstance const& m : view) {
        std_msgs::Int32::ConstPtr imsg = m.instantiate<std_msgs::Int32>();
        if (imsg != NULL) {
            ASSERT_EQ(imsg->data, i++);
            ASSERT_TRUE(m.getTime() < ros::Time(783,0));
        }
    }

    bag.close();
}

TEST(rosbag, topic_query_works) {
    rosbag::Bag outbag;
    outbag.open("/tmp/topic_query_works.bag", rosbag::bagmode::Write);

    std_msgs::Int32 imsg;

    int j0 = 0;
    int j1 = 0;

    for (int i = 0; i < 10; i++) {
        switch (rand() % 5) {
        case 0: imsg.data = j0++; outbag.write("t0", ros::Time(i, 1), imsg); break;
        case 1: imsg.data = j0++; outbag.write("t1", ros::Time(i, 1), imsg); break;
        case 2: imsg.data = j1++; outbag.write("t2", ros::Time(i, 1), imsg); break;
        case 3: imsg.data = j1++; outbag.write("t3", ros::Time(i, 1), imsg); break;
        case 4: imsg.data = j1++; outbag.write("t4", ros::Time(i, 1), imsg); break;
        }
    }
    outbag.close();

    rosbag::Bag bag;
    bag.open("/tmp/topic_query_works.bag", rosbag::bagmode::Read);

    std::vector<std::string> t = boost::assign::list_of("t0")("t1");

    int i = 0;

    rosbag::View view(bag, rosbag::TopicQuery(t));
    for (rosbag::MessageInstance const& m : view) {
        std_msgs::Int32::ConstPtr imsg = m.instantiate<std_msgs::Int32>();
        if (imsg != NULL) {
            ASSERT_EQ(imsg->data, i++);
        }
    }

    bag.close();
}


TEST(rosbag, bad_topic_query_works) {
    rosbag::Bag outbag;
    outbag.open("/tmp/bad_topic_query_works.bag", rosbag::bagmode::Write);

    std_msgs::Int32 imsg;

    for (int i = 0; i < 10; i++) {
      outbag.write("t0", ros::Time(i, 1), imsg);
    }
    outbag.close();

    rosbag::Bag bag;
    bag.open("/tmp/bad_topic_query_works.bag", rosbag::bagmode::Read);

    std::vector<std::string> t = boost::assign::list_of("t1");

    rosbag::View view(bag, rosbag::TopicQuery(t));
    for (rosbag::MessageInstance const& m : view) {
      (void)m;
      FAIL();
    }

    bag.close();
}

//This test fails on the storm machines
/*
TEST(rosbag, incremental_time) {
  ros::Time last = ros::Time::now();
  ros::Time next = ros::Time::now();
   for (int i = 0; i < 1000; i++) {
     next = ros::Time::now();
     ASSERT_TRUE(last != next);
     last = next;
   }
}
*/

TEST(rosbag, multiple_bag_works) {
    rosbag::Bag outbag1("/tmp/multiple_bag_works1.bag", rosbag::bagmode::Write);
    rosbag::Bag outbag2("/tmp/multiple_bag_works2.bag", rosbag::bagmode::Write);

    std_msgs::Int32 imsg;
    for (int i = 0; i < 1000; i++) {
        imsg.data = i;
        switch (rand() % 5) {
        case 0: outbag1.write("t0", ros::Time(0,i+1), imsg); break;
        case 1: outbag1.write("t1", ros::Time(0,i+1), imsg); break;
        case 2: outbag1.write("t2", ros::Time(0,i+1), imsg); break;
        case 3: outbag2.write("t0", ros::Time(0,i+1), imsg); break;
        case 4: outbag2.write("t1", ros::Time(0,i+1), imsg); break;
        }
    }

    outbag1.close();
    outbag2.close();

    rosbag::Bag bag1("/tmp/multiple_bag_works1.bag", rosbag::bagmode::Read);
    rosbag::Bag bag2("/tmp/multiple_bag_works2.bag", rosbag::bagmode::Read);

    rosbag::View view;
    view.addQuery(bag1);
    view.addQuery(bag2);

    int i = 0;

    for (rosbag::MessageInstance const& m : view) {
        std_msgs::Int32::ConstPtr imsg = m.instantiate<std_msgs::Int32>();
        if (imsg != NULL) {
            ASSERT_EQ(imsg->data, i++);
        }
    }

    bag1.close();
    bag2.close();
}


TEST(rosbag, overlapping_query_works) {
    rosbag::Bag outbag1("/tmp/overlapping_query_1.bag", rosbag::bagmode::Write);
    rosbag::Bag outbag2("/tmp/overlapping_query_2.bag", rosbag::bagmode::Write);

    std_msgs::Int32 imsg;
    for (int i = 0; i < 1000; i++) {
        imsg.data = i;
        switch (rand() % 5) {
        case 0: outbag1.write("t0", ros::Time(i+1), imsg); break;
        case 1: outbag1.write("t1", ros::Time(i+1), imsg); break;
        case 2: outbag1.write("t2", ros::Time(i+1), imsg); break;
        case 3: outbag2.write("t0", ros::Time(i+1), imsg); break;
        case 4: outbag2.write("t1", ros::Time(i+1), imsg); break;
        }
    }

    outbag1.close();
    outbag2.close();

    rosbag::Bag bag1("/tmp/overlapping_query_1.bag", rosbag::bagmode::Read);
    rosbag::Bag bag2("/tmp/overlapping_query_2.bag", rosbag::bagmode::Read);

    rosbag::View view1(false);
    view1.addQuery(bag1, ros::Time(1), ros::Time(750));
    view1.addQuery(bag1, ros::Time(251), ros::Time(1002));
    view1.addQuery(bag2, ros::Time(1), ros::Time(750));
    view1.addQuery(bag2, ros::Time(251), ros::Time(1002));

    rosbag::View view2(true);
    view2.addQuery(bag1, ros::Time(1), ros::Time(750));
    view2.addQuery(bag1, ros::Time(251), ros::Time(1002));
    view2.addQuery(bag2, ros::Time(1), ros::Time(750));
    view2.addQuery(bag2, ros::Time(251), ros::Time(1002));


    int i = 0;
    int j = 0;

    for (rosbag::MessageInstance const& m : view1) {
      std_msgs::Int32::ConstPtr imsg = m.instantiate<std_msgs::Int32>();
      if (imsg != NULL) {
        ASSERT_EQ(imsg->data, i);
      }
      if (i >= 250 && i < 750)
      {
        i += (j++ % 2);
      } else {
        i++;
      }
    }

    i = 0;

    for (rosbag::MessageInstance const& m : view2) {
        std_msgs::Int32::ConstPtr imsg = m.instantiate<std_msgs::Int32>();
        if (imsg != NULL) {
            ASSERT_EQ(imsg->data, i++);
        }
    }

    bag1.close();
    bag2.close();
}


TEST(rosbag, no_min_time) {
    rosbag::Bag outbag("/tmp/no_min_time.bag", rosbag::bagmode::Write);

    std_msgs::Int32 imsg;
    try
    {
      outbag.write("t0", ros::Time(0,0), imsg);
      FAIL();
    } catch (rosbag::BagException& e)
    {
      SUCCEED();
    }

    outbag.close();
}

TEST(rosbag, modify_view_works) {
    rosbag::Bag outbag;
    outbag.open("/tmp/modify_view_works.bag", rosbag::bagmode::Write);

    std_msgs::Int32 imsg;

    int j0 = 0;
    int j1 = 1;

    // Create a bag with 2 interlaced topics
    for (int i = 0; i < 100; i++) {
        imsg.data = j0;
        j0 += 2;
        outbag.write("t0", ros::Time(2 * i + 1, 0), imsg);

        imsg.data = j1;
        j1 += 2;
        outbag.write("t1", ros::Time(2 * i + 2, 0), imsg);
    }
    outbag.close();

    rosbag::Bag bag;
    bag.open("/tmp/modify_view_works.bag", rosbag::bagmode::Read);

    std::vector<std::string> t0 = boost::assign::list_of("t0");
    std::vector<std::string> t1 = boost::assign::list_of("t1");

    // We're going to skip the t1 for the first half
    j0 = 0;
    j1 = 101;

    rosbag::View view(bag, rosbag::TopicQuery(t0));

    rosbag::View::iterator iter = view.begin();

    for (int i = 0; i < 50; i++) {
        std_msgs::Int32::ConstPtr imsg = iter->instantiate<std_msgs::Int32>();
        if (imsg != NULL) {
            ASSERT_EQ(imsg->data, j0);
            j0 += 2;
        }
        iter++;
    }

    // We now add our query, and expect it to show up
    view.addQuery(bag, rosbag::TopicQuery(t1));

    for (int i = 0; i < 50; i++) {
        std_msgs::Int32::ConstPtr imsg = iter->instantiate<std_msgs::Int32>();
        if (imsg != NULL) {
            ASSERT_EQ(imsg->data, j0);
            j0 += 2;
        }
        iter++;

        imsg = iter->instantiate<std_msgs::Int32>();
        if (imsg != NULL) {
            ASSERT_EQ(imsg->data, j1);
            j1 += 2;
        }
        iter++;
    }

    bag.close();
}

TEST(rosbag, modify_bag_works) {
    rosbag::Bag rwbag("/tmp/modify_bag_works.bag", rosbag::bagmode::Write | rosbag::bagmode::Read);
    rwbag.setChunkThreshold(1);

    std::vector<std::string> t0 = boost::assign::list_of("t0");

    rosbag::View view(rwbag, rosbag::TopicQuery(t0));

    std_msgs::Int32 omsg;

    // Put a message at time 5
    omsg.data = 5;
    rwbag.write("t0", ros::Time(5 + 1, 0), omsg);
    
    // Verify begin gets us to 5
    rosbag::View::iterator iter1 = view.begin();
    std_msgs::Int32::ConstPtr imsg = iter1->instantiate<std_msgs::Int32>();
    ASSERT_EQ(imsg->data, 5);

    for (int i = 0; i < 5; i++) {
        omsg.data = i;
        rwbag.write("t0", ros::Time(i + 1, 0), omsg);
    }

    // New iterator should be at 0
    rosbag::View::iterator iter2 = view.begin();
    imsg = iter2->instantiate<std_msgs::Int32>();
    ASSERT_EQ(imsg->data, 0);

    // Increment it once
    iter2++;
    
    // Output additional messages after time 5
    for (int i = 6; i < 10; i++) {
        omsg.data = i;
        rwbag.write("t0", ros::Time(i + 1, 0), omsg);
    }

    // Iter2 should contain 1->10
    for (int i = 1; i < 10; i++) {
        imsg = iter2->instantiate<std_msgs::Int32>();
        ASSERT_EQ(imsg->data, i);
        iter2++;
    }

    // Iter1 should contain 5->10
    for (int i = 5; i < 10; i++) {
        imsg = iter1->instantiate<std_msgs::Int32>();
        ASSERT_EQ(imsg->data, i);
        iter1++;
    }
    
    rwbag.close();

    rosbag::Bag rwbag2("/tmp/modify_bag_works.bag", rosbag::bagmode::Read);

    rosbag::View view2(rwbag2, rosbag::TopicQuery(t0));

    rosbag::View::iterator iter3 = view2.begin();
    imsg = iter3->instantiate<std_msgs::Int32>();
    // Iter2 should contain 1->10
    for (int i = 0; i < 10; i++) {
        imsg = iter3->instantiate<std_msgs::Int32>();
        ASSERT_EQ(imsg->data, i);
        iter3++;
    }
}

int main(int argc, char **argv) {
    ros::init(argc, argv, "test_bag");
    ros::Time::init();

    testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}
