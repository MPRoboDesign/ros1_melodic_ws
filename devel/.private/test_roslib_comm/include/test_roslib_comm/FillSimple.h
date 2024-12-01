// Generated by gencpp from file test_roslib_comm/FillSimple.msg
// DO NOT EDIT!


#ifndef TEST_ROSLIB_COMM_MESSAGE_FILLSIMPLE_H
#define TEST_ROSLIB_COMM_MESSAGE_FILLSIMPLE_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace test_roslib_comm
{
template <class ContainerAllocator>
struct FillSimple_
{
  typedef FillSimple_<ContainerAllocator> Type;

  FillSimple_()
    : i32(0)
    , str()
    , i32_array()
    , b(false)  {
    }
  FillSimple_(const ContainerAllocator& _alloc)
    : i32(0)
    , str(_alloc)
    , i32_array(_alloc)
    , b(false)  {
  (void)_alloc;
    }



   typedef int32_t _i32_type;
  _i32_type i32;

   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _str_type;
  _str_type str;

   typedef std::vector<int32_t, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<int32_t>> _i32_array_type;
  _i32_array_type i32_array;

   typedef uint8_t _b_type;
  _b_type b;





  typedef boost::shared_ptr< ::test_roslib_comm::FillSimple_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::test_roslib_comm::FillSimple_<ContainerAllocator> const> ConstPtr;

}; // struct FillSimple_

typedef ::test_roslib_comm::FillSimple_<std::allocator<void> > FillSimple;

typedef boost::shared_ptr< ::test_roslib_comm::FillSimple > FillSimplePtr;
typedef boost::shared_ptr< ::test_roslib_comm::FillSimple const> FillSimpleConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::test_roslib_comm::FillSimple_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::test_roslib_comm::FillSimple_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::test_roslib_comm::FillSimple_<ContainerAllocator1> & lhs, const ::test_roslib_comm::FillSimple_<ContainerAllocator2> & rhs)
{
  return lhs.i32 == rhs.i32 &&
    lhs.str == rhs.str &&
    lhs.i32_array == rhs.i32_array &&
    lhs.b == rhs.b;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::test_roslib_comm::FillSimple_<ContainerAllocator1> & lhs, const ::test_roslib_comm::FillSimple_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace test_roslib_comm

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::test_roslib_comm::FillSimple_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::test_roslib_comm::FillSimple_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::test_roslib_comm::FillSimple_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::test_roslib_comm::FillSimple_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::test_roslib_comm::FillSimple_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::test_roslib_comm::FillSimple_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::test_roslib_comm::FillSimple_<ContainerAllocator> >
{
  static const char* value()
  {
    return "da04a60d03fa22f7d301f9bd5f9a08ab";
  }

  static const char* value(const ::test_roslib_comm::FillSimple_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xda04a60d03fa22f7ULL;
  static const uint64_t static_value2 = 0xd301f9bd5f9a08abULL;
};

template<class ContainerAllocator>
struct DataType< ::test_roslib_comm::FillSimple_<ContainerAllocator> >
{
  static const char* value()
  {
    return "test_roslib_comm/FillSimple";
  }

  static const char* value(const ::test_roslib_comm::FillSimple_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::test_roslib_comm::FillSimple_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int32 i32\n"
"string str\n"
"int32[] i32_array\n"
"bool b\n"
;
  }

  static const char* value(const ::test_roslib_comm::FillSimple_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::test_roslib_comm::FillSimple_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.i32);
      stream.next(m.str);
      stream.next(m.i32_array);
      stream.next(m.b);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct FillSimple_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::test_roslib_comm::FillSimple_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::test_roslib_comm::FillSimple_<ContainerAllocator>& v)
  {
    s << indent << "i32: ";
    Printer<int32_t>::stream(s, indent + "  ", v.i32);
    s << indent << "str: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.str);
    s << indent << "i32_array[]" << std::endl;
    for (size_t i = 0; i < v.i32_array.size(); ++i)
    {
      s << indent << "  i32_array[" << i << "]: ";
      Printer<int32_t>::stream(s, indent + "  ", v.i32_array[i]);
    }
    s << indent << "b: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.b);
  }
};

} // namespace message_operations
} // namespace ros

#endif // TEST_ROSLIB_COMM_MESSAGE_FILLSIMPLE_H
