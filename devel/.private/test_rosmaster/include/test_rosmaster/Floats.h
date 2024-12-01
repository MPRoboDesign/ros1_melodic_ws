// Generated by gencpp from file test_rosmaster/Floats.msg
// DO NOT EDIT!


#ifndef TEST_ROSMASTER_MESSAGE_FLOATS_H
#define TEST_ROSMASTER_MESSAGE_FLOATS_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace test_rosmaster
{
template <class ContainerAllocator>
struct Floats_
{
  typedef Floats_<ContainerAllocator> Type;

  Floats_()
    : float32(0.0)
    , float64(0.0)  {
    }
  Floats_(const ContainerAllocator& _alloc)
    : float32(0.0)
    , float64(0.0)  {
  (void)_alloc;
    }



   typedef float _float32_type;
  _float32_type float32;

   typedef double _float64_type;
  _float64_type float64;





  typedef boost::shared_ptr< ::test_rosmaster::Floats_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::test_rosmaster::Floats_<ContainerAllocator> const> ConstPtr;

}; // struct Floats_

typedef ::test_rosmaster::Floats_<std::allocator<void> > Floats;

typedef boost::shared_ptr< ::test_rosmaster::Floats > FloatsPtr;
typedef boost::shared_ptr< ::test_rosmaster::Floats const> FloatsConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::test_rosmaster::Floats_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::test_rosmaster::Floats_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::test_rosmaster::Floats_<ContainerAllocator1> & lhs, const ::test_rosmaster::Floats_<ContainerAllocator2> & rhs)
{
  return lhs.float32 == rhs.float32 &&
    lhs.float64 == rhs.float64;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::test_rosmaster::Floats_<ContainerAllocator1> & lhs, const ::test_rosmaster::Floats_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace test_rosmaster

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::test_rosmaster::Floats_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::test_rosmaster::Floats_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::test_rosmaster::Floats_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::test_rosmaster::Floats_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::test_rosmaster::Floats_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::test_rosmaster::Floats_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::test_rosmaster::Floats_<ContainerAllocator> >
{
  static const char* value()
  {
    return "1ee8aba2d870f75f2b5916e2cddbd928";
  }

  static const char* value(const ::test_rosmaster::Floats_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x1ee8aba2d870f75fULL;
  static const uint64_t static_value2 = 0x2b5916e2cddbd928ULL;
};

template<class ContainerAllocator>
struct DataType< ::test_rosmaster::Floats_<ContainerAllocator> >
{
  static const char* value()
  {
    return "test_rosmaster/Floats";
  }

  static const char* value(const ::test_rosmaster::Floats_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::test_rosmaster::Floats_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# for rostopic tests\n"
"float32 float32\n"
"float64 float64\n"
;
  }

  static const char* value(const ::test_rosmaster::Floats_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::test_rosmaster::Floats_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.float32);
      stream.next(m.float64);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Floats_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::test_rosmaster::Floats_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::test_rosmaster::Floats_<ContainerAllocator>& v)
  {
    s << indent << "float32: ";
    Printer<float>::stream(s, indent + "  ", v.float32);
    s << indent << "float64: ";
    Printer<double>::stream(s, indent + "  ", v.float64);
  }
};

} // namespace message_operations
} // namespace ros

#endif // TEST_ROSMASTER_MESSAGE_FLOATS_H
