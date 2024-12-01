// Generated by gencpp from file test_rospy/HeaderHeaderVal.msg
// DO NOT EDIT!


#ifndef TEST_ROSPY_MESSAGE_HEADERHEADERVAL_H
#define TEST_ROSPY_MESSAGE_HEADERHEADERVAL_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <test_rospy/HeaderVal.h>

namespace test_rospy
{
template <class ContainerAllocator>
struct HeaderHeaderVal_
{
  typedef HeaderHeaderVal_<ContainerAllocator> Type;

  HeaderHeaderVal_()
    : header()
    , val()  {
    }
  HeaderHeaderVal_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , val(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef  ::test_rospy::HeaderVal_<ContainerAllocator>  _val_type;
  _val_type val;





  typedef boost::shared_ptr< ::test_rospy::HeaderHeaderVal_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::test_rospy::HeaderHeaderVal_<ContainerAllocator> const> ConstPtr;

}; // struct HeaderHeaderVal_

typedef ::test_rospy::HeaderHeaderVal_<std::allocator<void> > HeaderHeaderVal;

typedef boost::shared_ptr< ::test_rospy::HeaderHeaderVal > HeaderHeaderValPtr;
typedef boost::shared_ptr< ::test_rospy::HeaderHeaderVal const> HeaderHeaderValConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::test_rospy::HeaderHeaderVal_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::test_rospy::HeaderHeaderVal_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::test_rospy::HeaderHeaderVal_<ContainerAllocator1> & lhs, const ::test_rospy::HeaderHeaderVal_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.val == rhs.val;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::test_rospy::HeaderHeaderVal_<ContainerAllocator1> & lhs, const ::test_rospy::HeaderHeaderVal_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace test_rospy

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::test_rospy::HeaderHeaderVal_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::test_rospy::HeaderHeaderVal_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::test_rospy::HeaderHeaderVal_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::test_rospy::HeaderHeaderVal_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::test_rospy::HeaderHeaderVal_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::test_rospy::HeaderHeaderVal_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::test_rospy::HeaderHeaderVal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ae71c365b9bafbc4abaf37150c80a6b5";
  }

  static const char* value(const ::test_rospy::HeaderHeaderVal_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xae71c365b9bafbc4ULL;
  static const uint64_t static_value2 = 0xabaf37150c80a6b5ULL;
};

template<class ContainerAllocator>
struct DataType< ::test_rospy::HeaderHeaderVal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "test_rospy/HeaderHeaderVal";
  }

  static const char* value(const ::test_rospy::HeaderHeaderVal_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::test_rospy::HeaderHeaderVal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header header\n"
"HeaderVal val\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
"\n"
"================================================================================\n"
"MSG: test_rospy/HeaderVal\n"
"Header header\n"
"string val\n"
;
  }

  static const char* value(const ::test_rospy::HeaderHeaderVal_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::test_rospy::HeaderHeaderVal_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.val);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct HeaderHeaderVal_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::test_rospy::HeaderHeaderVal_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::test_rospy::HeaderHeaderVal_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "val: ";
    s << std::endl;
    Printer< ::test_rospy::HeaderVal_<ContainerAllocator> >::stream(s, indent + "  ", v.val);
  }
};

} // namespace message_operations
} // namespace ros

#endif // TEST_ROSPY_MESSAGE_HEADERHEADERVAL_H